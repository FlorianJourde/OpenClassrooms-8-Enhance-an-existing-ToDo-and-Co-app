<?php

namespace App\Tests\Repository;

use App\Entity\Task;

use App\Repository\TaskRepository;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class TaskRepositoryTest extends KernelTestCase
{
    public function testRemoveTask(): void
    {
        self::bootKernel();
        $taskRepository = new TaskRepository(static::getContainer()->get(ManagerRegistry::class));
        $tasks = static::getContainer()->get(TaskRepository::class)->findAll();

        $this->assertInstanceOf(Task::class, end($tasks));
        $taskRepository->remove(end($tasks), true);
    }
}