<?php


namespace App\Service\User;

use App\Entity\User;
use App\Exception\User\RequiredUserInformationException;
use App\Security\PasswordUpdater;
use Doctrine\ORM\EntityManagerInterface;

class CreateUser
{
    private EntityManagerInterface $entityManager;
    private PasswordUpdater $passwordUpdater;

    public function __construct(EntityManagerInterface $entityManager, PasswordUpdater $passwordUpdater)
    {
        $this->entityManager = $entityManager;
        $this->passwordUpdater = $passwordUpdater;
    }

    public function createUser(string $email, string $password): User
    {
        if (!$email) {
            throw new RequiredUserInformationException('email');
        }

        if (!$password) {
            throw new RequiredUserInformationException('password');
        }

        $user = new User();
        $user
            ->setEmail($email)
            ->setRoles([User::ROLE_USER]) // Just a static role for this example
            ->setPassword($this->passwordUpdater->encodePassword($user, $password));
        $this->entityManager->persist($user);
        $this->entityManager->flush();

        return $user;
    }

}