<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserFixtures extends Fixture
{
    private UserPasswordHasherInterface $userPasswordHasher;

    /**
     * @codeCoverageIgnore
     */
    public function __construct(UserPasswordHasherInterface $userPasswordHasher)
    {
        $this->userPasswordHasher = $userPasswordHasher;
    }

    /**
     * @codeCoverageIgnore
     */
    public function load(ObjectManager $manager): void
    {
        $admin = new User();
        $admin->setRoles(['ROLE_ADMIN', 'ROLE_USER']);
        $admin->setPassword($this->userPasswordHasher->hashPassword($admin, '123456'));
        $admin->setEmail('admin@todoandco.com');
        $admin->setUsername('Admin');
        $manager->persist($admin);

        for ($i = 0; $i < 3; $i++) {
            $user = new User();
            $user->setRoles(['ROLE_USER']);
            $user->setPassword($this->userPasswordHasher->hashPassword($user, '123456'));
            $user->setEmail('user' . ($i + 1)  . '@todoandco.com');
            $user->setUsername('Utilisateur' . ($i + 1));
            $manager->persist($user);
        }

        $manager->flush();
    }
}
