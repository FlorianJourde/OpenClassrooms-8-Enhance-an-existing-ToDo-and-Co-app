<?php

namespace App\DataFixtures;

use App\Entity\Task;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private UserPasswordHasherInterface $userPasswordHasher;

    public function __construct(UserPasswordHasherInterface $userPasswordHasher)
    {
        $this->userPasswordHasher = $userPasswordHasher;
    }

    public function load(ObjectManager $manager): void
    {
        $users = [null];

        $admin = new User();
        $admin->setRoles(['ROLE_ADMIN', 'ROLE_USER']);
        $admin->setPassword($this->userPasswordHasher->hashPassword($admin, '123456'));
        $admin->setEmail('admin@todoandco.com');
        $admin->setUsername('Admin');
        $manager->persist($admin);
        $users[] = $admin;

        for ($i = 0; $i < 3; $i++) {
            $user = new User();
            $user->setRoles(['ROLE_USER']);
            $user->setPassword($this->userPasswordHasher->hashPassword($user, '123456'));
            $user->setEmail('user' . ($i + 1)  . '@todoandco.com');
            $user->setUsername('Utilisateur' . ($i + 1));
            $manager->persist($user);
            $users[] = $user;
        }

        $tasksTitle = ['Réunion 17/03', 'Métro', 'Numéro de téléphone', 'Liste de courses', '5 mai 2023', 'Livres à lire', 'Musique', 'Site web', 'Rappels', 'Médecin', '29/04'];
        $tasksContent = [
            '06 89 70 46 99 </br> 05 55 03 42 29 </br> 04 56 23 32 17',
            'Aniversaire de Grégory',
            '- Beurre </br> - Endives </br> - Poireau </br> - Bananes <br> - Carottes <br> - Champignons <br>',
            'Préparer la soutenance <br>',
            'Éric Roulhac <br> 141 Bis Av. de Limoges <br> 87270 Couzeix <br> 05 55 39 32 98',
            'Saint-Germain-les-Prés <br> Ligne 3',
            'Nicolas Jaar, Rival Consoles, Weval, Max Cooper, Daniel Avery, Boards of Canada, The Chemical Brothers, Todd Terje, Daniel Avery, The XX, Moderat, Superpoze, Rone, LCD Soundsystem...',
            'Sorti les poubelles <br> Promener le chien',
            'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques',
            'www.senscritique.com <br> www.allocine.com <br> www.last.fm'
        ];

        $status = [true, false];

        for ($i = 0; $i < 30; $i++) {
            $task = new Task();
            $task->setTitle($tasksTitle[array_rand($tasksTitle)]);
            $task->setContent($tasksContent[array_rand($tasksContent)]);
            $task->setIsDone($status[array_rand($status)]);
            $task->setAuthor($users[array_rand($users)]);
            $manager->persist($task);
        }

        $manager->flush();
    }
}
