<?php

namespace App\Tests\Controller;

use App\Entity\Task;
use App\Entity\User;
use App\Repository\TaskRepository;
use App\Repository\UserRepository;
use DateTime;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DefaultControllerTest extends WebTestCase
{
//    private KernelBrowser|null $client = null;

//    public function setUp() : void
//    {
//        $this->client = static::createClient();
//        $this->userRepository = $this->client->getContainer()->get('doctrine.orm.entity_manager')->getRepository(User::class);
//        $this->user = $this->userRepository->findOneByEmail('admin@todoandco.com');
//        $this->urlGenerator = $this->client->getContainer()->get('router.default');
//        $this->client->loginUser($this->user);
//    }
//
//    public function testHomepageIsUp()
//    {
//        $this->client->request(Request::METHOD_GET, $this->urlGenerator->generate('homepage'));
//        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
//    }

//    public function testHomepage()
//    {
//        $crawler = $this->client->request(Request::METHOD_GET, $this->urlGenerator->generate('homepage'));
//        $this->assertSame(1, $crawler->filter('html:contains("Bienvenue sur FoodDiary!")')->count());
//    }

//    public function testFindHeading()
//    {
//        $crawler = $this->client->request(Request::METHOD_GET, $this->urlGenerator->generate('homepage'));
//        $this->assertSame(1, $crawler->filter('h1')->count());
//    }

    public function testHomepage(): void
    {
//        $client = static::createClient();
//        $tasks = static::getContainer()->get(TaskRepository::class)->findSome(6);

//        $user = static::getContainer()->get(UserRepository::class)->findOneBy(['username' => 'Admin'], ['asc']);
//        $tasks = static::getContainer()->get(UserRepository::class)->findOneBy(['username' => 'Admin'], ['asc']);
//        $taskRepository = $client->getContainer()->get('doctrine.orm.entity_manager')->getRepository(Task::class);

//        $this->assertCount(
//            6,
//            $taskRepository, "testArray doesn't contains 3 elements"
//        );

//        dd($taskRepository);
//
//        $this->assertCount(
//            6,
//            $taskRepository, "testArray doesn't contains 3 elements"
//        );

//        $tasks = $this->createMock(TaskRepository::class);
//        $user = $this->createMock(UserRepository::class);


        $client = static::createClient();

        // Request a specific page
        $crawler = $client->request('GET', '/');

        // Validate a successful response and some content
        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('h1', 'Toutes les tâches');

        dd($crawler);

//        $crawler = $client->request(Request::METHOD_GET, 'homepage');

//        $crawler = $client->request(Request::METHOD_GET, $this->urlGenerator->generate('homepage'));
//        $this->assertSame(1, $crawler->filter('html:contains("Bienvenue sur FoodDiary!")')->count());
//        $this->assertSame(1, $crawler->filter('html:contains("Bienvenue sur FoodDiary!")')->count());

//        dd($crawler);

//        $this->assertSame(1, $crawler->filter('html:contains("Bienvenue sur FoodDiary!")')->count());


        /*
//      $client->request(Request::METHOD_GET, '/');
        $task = new Task();
        $tasksArray = [];

        for ($i = 0; $i < 6; $i++) {
            $task->setTitle('Titre');
            $task->setCreatedAt(new DateTime('now'));
            $task->setAuthor(null);
            $task->setContent('Contenu de la tâche');
            $task->setIsDone(false);
            $tasksArray[] = $task;
        }

        $this->assertCount(
            6,
            $tasksArray, "testArray doesn't contains 3 elements"
        );*/

//        $tasks->expects($this->any())
//            ->method('getRepository')
//            ->willReturn($tasksArray);

//        dd($tasks->expects());
//        dd(static::getContainer()->get(TaskRepository::class)->findSome(6));
//        dd('HELLO');
//        $this->assertResponseStatusCodeSame(Response::HTTP_OK);

//        $client = static::createClient();
//        $crawler = $client->request('GET', '/');

//        $this->assertResponseIsSuccessful();
//        $this->assertSelectorTextContains('h1', 'ToDo & Co');
    }
}
