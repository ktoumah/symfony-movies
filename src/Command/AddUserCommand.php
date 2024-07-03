<?php

namespace App\Command;

use App\Service\User\CreateUser;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(name: 'add-user', description: 'This command allow to add user to database with a hashed password')]
class AddUserCommand extends Command
{
    private CreateUser $createUser;

    public function __construct(CreateUser $createUser)
    {
        parent::__construct();
        $this->createUser = $createUser;
    }

    protected function configure(): void
    {
        $this
            ->addArgument('email', InputArgument::REQUIRED, 'Enter your email')
            ->addArgument('password', InputArgument::REQUIRED, 'Enter your password')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $email = $input->getArgument('email');
        $password = $input->getArgument('password');

        if (!$email) {
            $io->error('No email entered !');
        }

        if (!$password) {
            $io->error('No password entered !');
        }
        try {
            $this->createUser->createUser($email, $password);
        } catch (\Exception $exception) {
            $io->error('Add user error: ' . $exception->getMessage());
        }

        $io->success('User added successfully.');

        return Command::SUCCESS;
    }
}
