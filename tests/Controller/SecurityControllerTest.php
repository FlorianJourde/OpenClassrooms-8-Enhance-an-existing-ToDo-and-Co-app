<?php

namespace App\Tests\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Exception;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Response;

class SecurityControllerTest extends WebTestCase
{
    public function testLoginPage(): void
    {
        $client = static::createClient();
        $client->request('GET', '/login');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
    }

    public function testLogoutPageRedirection(): void
    {
        $client = static::createClient();
        $client->request('GET', '/logout');
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
        $client->followRedirect();
        $this->assertTrue($client->getRequest()->getPathInfo() === '/');
    }

    public static function login(KernelBrowser $client, string $as): ?User
    {
        try {
            $user = static::getContainer()->get(UserRepository::class)->findOneByUsername($as);
            $client->loginUser($user);

            return $user;
        } catch (Exception $e) {
        }

        return null;
    }
}
