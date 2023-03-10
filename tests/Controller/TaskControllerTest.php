<?php

namespace App\Tests\Controller;

use App\Repository\TaskRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class TaskControllerTest extends WebTestCase
{
    public function testListAction(): void
    {
        $client = static::createClient();
        $client->request('GET', '/tasks');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testGetTodoTasks(): void
    {
        $client = static::createClient();
        $client->request('GET', '/tasks/todo');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testDoneTasksPage(): void
    {
        $client = static::createClient();
        $client->request('GET', '/tasks/done');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testCreateAction(): void
    {
        $client = static::createClient();
        $client->request('GET', '/tasks/create');
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
        $client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testCreateActionWhenLoggedIn(): void
    {
        $client = static::createClient();
        SecurityControllerTest::login($client, 'admin');
        $client->request(Request::METHOD_GET, '/tasks/create');

        $client->submitForm('Ajouter', [
            'task[title]' => 'Titre de la tâche',
            'task[content]' => 'Contenu de la tâche',
        ]);

        $this->assertResponseRedirects();
        $crawler = $client->followRedirect();
        $this->assertRouteSame('app_task_list');
        $this->assertSelectorExists('.tasks-section');
        $this->assertCount(1, $crawler->filter('.tasks-grid'));
    }

    public function testEditAction(): void
    {
        $client = static::createClient();
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/edit');

        $this->assertResponseRedirects();
        $client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testEditActionWhenLoggedIn(): void
    {
        $client = static::createClient();
        $user = SecurityControllerTest::login($client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/edit');

        $this->assertResponseIsSuccessful();
        $this->assertRouteSame('app_task_edit');
        $this->assertRequestAttributeValueSame('id', $task->getId());
        $this->assertInputValueSame('task[title]', $task->getTitle());
        $this->assertSelectorTextSame('textarea[name="task[content]"]', $task->getContent());

        $client->submitForm('Modifier', [
            'task[title]' => 'Nouveau titre',
            'task[content]' => 'Nouveau contenu',
        ]);

        $this->assertResponseRedirects();
        $client->followRedirect();
        $this->assertResponseIsSuccessful();
        $this->assertRouteSame('app_task_list');
        $this->assertSelectorExists('.tasks-section');
    }

    public function testToggleTaskAction(): void
    {
        $client = static::createClient();
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testToggleTaskToDoActionWhenLoggedIn(): void
    {
        $client = static::createClient();
        $user = SecurityControllerTest::login($client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $client->followRedirect();

        if ($task->isDone() === false) $this->assertRouteSame('app_tasks_todo');
    }

    public function testToggleTaskDoneActionWhenLoggedIn(): void
    {
        $client = static::createClient();
        $user = SecurityControllerTest::login($client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $client->followRedirect();

        if ($task->isDone() === true) $this->assertRouteSame('app_tasks_done');
    }

    public function testDeleteTaskAction(): void
    {
        $client = static::createClient();
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/delete');

        $this->assertResponseRedirects();
        $client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testDeleteTaskActionWhenLoggedIn(): void
    {
        $client = static::createClient();
        $user = SecurityControllerTest::login($client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/delete');
        $this->assertResponseRedirects();
        $client->followRedirect();
        $this->assertRouteSame('app_task_list');
    }
}