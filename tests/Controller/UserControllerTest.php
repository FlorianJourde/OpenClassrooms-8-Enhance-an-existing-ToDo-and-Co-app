<?php

namespace App\Tests\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class UserControllerTest extends WebTestCase
{
    private KernelBrowser $client;

    public function setUp(): void
    {
        $this->client = static::createClient();
    }

    public function testListUsers(): void
    {
        $this->client->request('GET', '/admin/users');
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testListUsersWhenLoggedIn(): void
    {
        SecurityControllerTest::login($this->client, 'admin');
        $this->client->request(Request::METHOD_GET, '/admin/users');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
        $this->assertSelectorExists('.users-list-section');
    }

    public function testCreateUser(): void
    {
        $this->client->request('GET', '/admin/users');
        $this->assertResponseStatusCodeSame(Response::HTTP_FOUND);
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testCreateUserWhenLoggedIn(): void
    {
        SecurityControllerTest::login($this->client, 'admin');
        $this->client->request(Request::METHOD_GET, '/admin/users/create');
        $this->assertResponseStatusCodeSame(Response::HTTP_OK);
        $this->assertSelectorExists('.create-user-section');

        $this->client->submitForm('Ajouter', [
            'user[username]' => 'Utilisateur' . uniqid(),
            'user[email]' => 'user' . uniqid() . '@todoandco.com',
            'user[password][first]' => '123456',
            'user[password][second]' => '123456'
        ]);

        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_user_list');
    }

    public function testEditUser(): void
    {
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $this->client->request(Request::METHOD_GET, '/admin/users/' . $user->getId() . '/edit');
        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testEditUserWhenLoggedIn(): void
    {
        SecurityControllerTest::login($this->client, 'admin');
        $users = static::getContainer()->get(UserRepository::class)->findAll();
        $usersExceptAdmins = [];

        foreach ($users as $user) {
            if (!in_array('ROLE_ADMIN', $user->getRoles(), true)) {
                $usersExceptAdmins[] = $user;
            }
        }

        $this->client->request(Request::METHOD_GET, '/admin/users/' . end($usersExceptAdmins)->getId() . '/edit');
        $this->assertResponseIsSuccessful();
        $this->assertRouteSame('app_user_edit');
        $this->assertRequestAttributeValueSame('id', end($usersExceptAdmins)->getId());

        $this->client->submitForm('Modifier', [
            'user[username]' => 'Utilisateur' . uniqid(),
            'user[email]' => 'user' . uniqid() . '@todoandco.com',
            'user[password][first]' => '123456',
            'user[password][second]' => '123456'
        ]);

        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_user_list');
    }

    public function testDeleteUser(): void
    {
        $user = static::getContainer()->get(UserRepository::class)->findOneByUsername('admin');
        $this->client->request(Request::METHOD_GET, '/admin/users/' . $user->getId() . '/delete');
        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_login');
    }

    public function testDeleteUserWhenLoggedIn(): void
    {
        SecurityControllerTest::login($this->client, 'admin');
        $users = static::getContainer()->get(UserRepository::class)->findAll();
        $usersExceptAdmins = [];

        foreach ($users as $user) {
            if (!in_array('ROLE_ADMIN', $user->getRoles(), true)) {
                $usersExceptAdmins[] = $user;
            }
        }

        $this->client->request(Request::METHOD_GET, '/admin/users/' . end($usersExceptAdmins)->getId() . '/delete');
        $this->assertResponseRedirects();
        $this->client->followRedirect();
        $this->assertRouteSame('app_user_list');
    }
}