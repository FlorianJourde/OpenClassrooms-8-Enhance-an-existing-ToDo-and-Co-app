<?php

namespace App\Tests\Repository;

use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class UserRepositoryTest extends KernelTestCase
{
    public function testRemoveUser(): void
    {
        self::bootKernel();
        $userRepository = new UserRepository(static::getContainer()->get(ManagerRegistry::class));
        $users = static::getContainer()->get(UserRepository::class)->findAll();
        $usersExceptAdmins = [];

        foreach ($users as $user) {
            if (!in_array('ROLE_ADMIN', $user->getRoles(), true)) {
                $usersExceptAdmins[] = $user;
            }
        }

        $this->assertInstanceOf(User::class, end($usersExceptAdmins));
        $userRepository->remove(end($usersExceptAdmins), true);
    }
}