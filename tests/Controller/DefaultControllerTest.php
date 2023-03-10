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
    public function testHomepage(): void
    {
        $client = static::createClient();
        $client->request('GET', '/');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }
}
