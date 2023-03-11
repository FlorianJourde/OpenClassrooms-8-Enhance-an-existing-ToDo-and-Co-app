<?php

namespace App\Tests\Controller;

use App\Repository\TaskRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class TaskControllerTest extends WebTestCase
{
    private KernelBrowser $client;

    public function setUp(): void
    {
        $this->client = static::createClient();
    }

    public function testListTask(): void
    {
        $this->client->request('GET', '/tasks');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testGetTodoTasks(): void
    {
        $this->client->request('GET', '/tasks/todo');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testDoneTasksPage(): void
    {
        $this->client->request('GET', '/tasks/done');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testCreateTask(): void
    {
        $this->client->request('GET', '/tasks/create');
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testCreateTaskWhenLoggedIn(): void
    {
        SecurityControllerTest::login($this->client, 'admin');
        $this->client->request(Request::METHOD_GET, '/tasks/create');

        $this->client->submitForm('Ajouter', [
            'task[title]' => 'Titre de la tâche',
            'task[content]' => 'Contenu de la tâche',
        ]);

        $this->assertResponseRedirects();
        $crawler = $this->client->followRedirect();
        $this->assertRouteSame('app_task_list');
        $this->assertSelectorExists('.tasks-section');
        $this->assertCount(1, $crawler->filter('.tasks-grid'));
    }

    public function testEditTask(): void
    {
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/edit');

        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testEditTaskWhenLoggedIn(): void
    {
        $user = SecurityControllerTest::login($this->client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/edit');

        $this->assertResponseIsSuccessful();
        $this->assertRouteSame('app_task_edit');
        $this->assertRequestAttributeValueSame('id', $task->getId());
        $this->assertInputValueSame('task[title]', $task->getTitle());
        $this->assertSelectorTextSame('textarea[name="task[content]"]', $task->getContent());

        $this->client->submitForm('Modifier', [
            'task[title]' => 'Nouveau titre',
            'task[content]' => 'Nouveau contenu',
        ]);

        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertResponseIsSuccessful();
        $this->assertRouteSame('app_task_list');
        $this->assertSelectorExists('.tasks-section');
    }

    public function testToggleTask(): void
    {
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testToggleToDoTaskWhenLoggedIn(): void
    {
        $user = SecurityControllerTest::login($this->client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $this->client->followRedirect();

        if ($task->isDone() === false) $this->assertRouteSame('app_tasks_todo');
    }

    public function testToggleDoneTaskWhenLoggedIn(): void
    {
        $user = SecurityControllerTest::login($this->client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/toggle');
        $this->assertResponseRedirects();
        $this->client->followRedirect();

        if ($task->isDone() === true) $this->assertRouteSame('app_tasks_done');
    }

    public function testDeleteTask(): void
    {
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/delete');

        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testDeleteTaskWhenLoggedIn(): void
    {
        $user = SecurityControllerTest::login($this->client, 'admin');
        $task = static::getContainer()->get(TaskRepository::class)->findOneBy(['author' => $user]);
        $this->client->request(Request::METHOD_GET, '/tasks/' . $task->getId() . '/delete');
        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_task_list');
    }
}