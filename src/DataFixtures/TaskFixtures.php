<?php

namespace App\DataFixtures;

use App\Entity\Task;
use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class TaskFixtures extends Fixture implements DependentFixtureInterface
{
    private UserRepository $userRepository;

    /**
     * @codeCoverageIgnore
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * @codeCoverageIgnore
     */
    public function load(ObjectManager $manager): void
    {
        $users = [];
        $users[] = null;
        foreach ($this->userRepository->findAll() as $user) {
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
            'Sortir les poubelles <br> Promener le chien',
            'L\'Étranger, Sapiens, Le Pouvoir du Moment Présent, Les quatre accords toltèques',
            'www.senscritique.com <br> www.allocine.com <br> www.last.fm'
        ];

        $status = [true, false];

        for ($i = 0; $i < 30; $i++) {
            $task = new Task();
            $task->setTitle($tasksTitle[array_rand($tasksTitle)]);
            $task->setContent($tasksContent[array_rand($tasksContent)]);
            $task->toggle($status[array_rand($status)]);
            $task->setAuthor($users[array_rand($users)]);
            $manager->persist($task);
        }

        $manager->flush();
    }

    public function getDependencies(): array
    {
        return [
            UserFixtures::class,
        ];
    }
}
