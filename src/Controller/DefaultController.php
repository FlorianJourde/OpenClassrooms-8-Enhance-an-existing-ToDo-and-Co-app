<?php

namespace App\Controller;

use App\Repository\TaskRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    #[Route("/", name:"app_homepage")]
    public function indexAction(TaskRepository $taskRepository)
    {
        $tasks = $taskRepository->findSome(6);

        return $this->render('default/index.html.twig', ['user' => $this->getUser(), 'tasks' => $tasks]);
    }
}
