<?php

namespace App\Controller;

use App\Entity\Task;
use App\Form\TaskType;
use App\Repository\TaskRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class TaskController extends AbstractController
{
    #[Route("/tasks", name:"app_task_list")]
    public function listAction(TaskRepository $taskRepository)
    {
        $tasks = array_reverse($taskRepository->findAll());

        return $this->render('task/list.html.twig', ['tasks' => $tasks]);
    }

    #[Route("/tasks/todo", name:"app_tasks_todo")]
    public function getTodoTasks(TaskRepository $taskRepository)
    {
        $doneTasks = array_reverse($taskRepository->findAllByStatus(false));

        return $this->render('task/list-todo.html.twig', ['tasks' => $doneTasks]);
    }

    #[Route("/tasks/done", name:"app_tasks_done")]
    public function getDoneTasks(TaskRepository $taskRepository)
    {
        $doneTasks = array_reverse($taskRepository->findAllByStatus(true));

        return $this->render('task/list-done.html.twig', ['tasks' => $doneTasks]);
    }

    #[IsGranted("ROLE_USER")]
    #[Route("/tasks/create", name:"app_task_create")]
    public function createAction(Request $request, EntityManagerInterface $em)
    {
        $task = new Task();
        $form = $this->createForm(TaskType::class, $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $task->setAuthor($this->getUser());

            $em->persist($task);
            $em->flush();

            $this->addFlash('success', sprintf('La tâche <strong>%s</strong> a bien été ajoutée.', $task->getTitle()));

            return $this->redirectToRoute('app_task_list');
        }

        return $this->render('task/create.html.twig', ['form' => $form->createView()]);
    }

    #[IsGranted("ROLE_USER")]
    #[Route("/tasks/{id}/edit", name:"app_task_edit")]
    public function editAction(Task $task, Request $request, EntityManagerInterface $em)
    {
        $form = $this->createForm(TaskType::class, $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($task);
            $em->flush();

            $this->addFlash('success', sprintf('La tâche <strong>%s</strong> a bien été modifiée.', $task->getTitle()));

            return $this->redirectToRoute('app_task_list');
        }

        return $this->render('task/edit.html.twig', ['form' => $form->createView(), 'task' => $task]);
    }

    #[IsGranted("ROLE_USER")]
    #[Route("/tasks/{id}/toggle", name:"app_task_toggle")]
    public function toggleTaskAction(Task $task, EntityManagerInterface $em)
    {
        $task->toggle(!$task->isDone());
        $em->flush();

        $status = $task->isDone() ? 'faite' : 'non terminée';

        $this->addFlash('success', sprintf('La tâche <strong>%s</strong> a bien été marquée comme %s.', $task->getTitle(), $status));

        if ($task->isDone()) {
            return $this->redirectToRoute('app_tasks_done');
        } else {
            return $this->redirectToRoute('app_tasks_todo');
        }
    }

    #[IsGranted("ROLE_USER")]
    #[Route("/tasks/{id}/delete", name:"app_task_delete")]
    public function deleteTaskAction(Task $task, EntityManagerInterface $em)
    {
        $this->denyAccessUnlessGranted('task_delete', $task);

        $em->remove($task);
        $em->flush();

        $this->addFlash('success', sprintf('La tâche <strong>%s</strong> a bien été supprimée.', $task->getTitle()));

        return $this->redirectToRoute('app_task_list');
    }
}
