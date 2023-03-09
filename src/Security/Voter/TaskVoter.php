<?php

namespace App\Security\Voter;

use App\Entity\Task;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Security;

class TaskVoter extends Voter
{
    public const TASK_DELETE = 'task_delete';

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    protected function supports(string $attribute, $subject): bool
    {
        return in_array($attribute, [self::TASK_DELETE])
            && $subject instanceof Task;
    }

    protected function voteOnAttribute(string $attribute, $subject, TokenInterface $token): bool
    {
        $user = $token->getUser();

        if (!$user instanceof UserInterface) {
            return false;
        }

        if ($this->security->isGranted('ROLE_ADMIN')) return true;

        switch ($attribute) {
            case self::TASK_DELETE:
                return $this->canDelete($subject, $user);
        }

        return false;
    }

    private function canDelete(Task $task, UserInterface $user): bool
    {
        return $task->getAuthor() === $user;
    }
}
