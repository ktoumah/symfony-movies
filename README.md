This project is a Symfony test.

# Requirements for this project.

[<img src="https://img.shields.io/badge/Os : -Ubuntu 20.04.5 LTS-informational.svg?logo=jwt">]()
[<img src="https://img.shields.io/badge/Docker : -4.13.x-informational.svg?logo=jwt">]()

### Lunch this command from the source of project

```bash
  make run
  ```

### Finally lunch 
 ```bash
  brew install php
  ```

You have to link your new php to your Mac, to do that :

 ```bash
  brew link --overwrite --force php@your-version
  ```

If you want to work again on the "old" Custom Desk, change your php version again :

```bash
brew link --overwrite --force php@old-version
```

Sometimes, you have to run another command to unlink or change between your different versions of php on Mac :

```bash
brew unlink php && brew link php
```

Test if you have the right version of php :

```bash
php -v
```

### To add imagick ext for php on Mac

```bash
brew install pkg-config imagemagick
```
```bash
pecl install imagick
```

### To add RabbitMq ext for php on Mac

```bash
brew install rabbitmq-c
```
```bash
brew install rabbitmq
```   
  *twice are necessary to install rabbitmq*
```bash
pecl install amqp
```

Next, you will have this line : `Set the path to librabbitmq install prefix [autodetect] : `  
Let this empty, `autodetet`  will run properly.

After AMQP is installed, you just have to launch the command that will be provided from you.

To finish :

```bash
brew services start rabbitmq
```
- Go to http://localhost:15672/
- Connect with `guest` & `guest`

### To add Xdebug ext for your tests on Mac

```bash
pecl install xdebug
```  
  *check in you php.ini if you have this line : `zend_extension="xdebug.so"`*
```bash
brew services restart php
```  
  *to check if xdebug is installed you must have this line :`with Xdebug v3.2.1, Copyright (c)2002-2023, by
  Derick Rethans` on launching `php -v`*

Next, you have to add conf for xdebug in xdebug.ini :

```bash
nano /opt/homebrew/etc/php/8.2/conf.d/xdebug.ini
```
(*change versions and path if necessary*)
- add this : `xdebug.mode=coverage`. Quit and save.
```bash
brew services restart php
```

### Other requirements

[<img src="https://img.shields.io/badge/Framework : -Symfony 5,4-informational.svg?logo=">](https://symfony.com/doc/5.4/setup.html)  
[<img src="https://img.shields.io/badge/Symfony CLI : -4.26.11-informational.svg?logo=">](https://symfony.com/download)   
[<img src="https://img.shields.io/badge/Imagick : -7.1.0-informational.svg?logo=">](https://imagemagick.org/script/download.php)

# Steps to initialize and run project

### Initialize the project :

Initialize dependencies:

```bash
composer install
```

⚠️ Be careful to never `composer update`  without asking the development team.

Create your database:

```bash
php bin/console doctrine:database:create
```

Implement your database:

```bash
php bin/console doctrine:migrations:migrate
```

⚠️ Dont't delete migrations files to avoid issues on relation or empty table.  
After doing all of these steps, you can get some data of a full db in the clone of Cdesk.

### Run the project 🏃

```bash
Symfony serve
```

Your project will be connected on http://127.0.0.1:8000.

### API Documentation 📑

url of our API Documentation is here : http://127.0.0.1:8000/doc/api.

For create this template we use :

- [<img src="https://img.shields.io/badge/Bundle : -Nelmio bundle on Symfony-informational.svg?logo=jwt">](https://github.com/nelmio/NelmioApiDocBundle)
- [<img src="https://img.shields.io/badge/Open source Librairy : -Swagger-informational.svg?logo=jwt">](https://github.com/nelmio/NelmioApiDocBundle)

# **ALL THE THINGS YOU WILL NEED TO WORK WITH CUSTOM DESK BELLOW** ! 📚🚨

# ⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️

# JWT Token Generation:

```bash
php bin/console lexik:jwt:generate-keypair
```

# Generate Fixtures 🏃

### Configuring a Database for Tests 💿

Create test database

```bash
php bin/console --env=test doctrine:database:create
```

Create the tables/columns in the test database

```bash
php bin/console --env=test doctrine:schema:create
```

### Load Fixtures 📑

Before loading fixtures, you have to create a file `pdo_cred.ini`(check the example file) in the root of the
project. And you have to put your database url credentials in it. (in the futur, it will be the production url to
get a lot of data to fixtures)

⚠️ Before loading fixtures, you must check before purge if it's your database test. If it's not, you can  
continue. ⚠️

To load fixtures, launch this command:

```bash
php bin/console doctrine:fixtures:load
```
 or
```bash
php bin/console d:f:l
```

# Bus Messages 📨

### Create a new message:

Install our bundle first:  
[Documentation](https://packagist.org/packages/wobz/maker-bundle)

```bash
  php bin/console make:bus-message
```

# Run tests before sending in production: 🧪

[<img src="https://img.shields.io/badge/Test : -PHP Unit 9,5,10-informational.svg?logo=jwt">](https://phpunit.readthedocs.io/fr/latest/)

To execute your test, launch this command:

```bash
php ./vendor/bin/phpunit
```

# Test mail with local SMTP (useless with MAMP PRO, already set in it) 📧

### Installation:

```bash
brew update && brew install mailhog
```

### Run SMTP local server:

```bash
mailhog
```

### SMTP URL (.env):

- `(MAILER_DSN=)smtp://localhost:1025`

### Enjoy mails here: 😃

url : http://localhost:8025

# GrumPHP:

GrumPHP is a powerful tool for PHP developers that automates code quality checks and enforces coding standards in your
projects. By integrating it into your development workflow, you can ensure your PHP code is clean, consistent, and free
of common errors, making your projects more maintainable and reliable. GrumPHP works seamlessly with Git, running checks
and tests automatically when you commit or push code changes, helping you catch issues early in the development process.
It's highly customizable, allowing you to tailor it to your project's specific requirements, and it's a valuable
addition to any PHP-based development environment.

To get started, after running the `composer install` command:

### Register GrumPHP in Git hooks with:

```bash
  php ./vendor/bin/grumphp git:init
```

### Utilize GrumPHP immediately by running:

```bash
  php ./vendor/bin/grumphp run
```

### Also, you can use GrumPHP on pre-commit:

```bash
  php ./vendor/bin/grumphp git:pre-commit
```

Finally, when you commit your code, GrumPHP automatically runs to verify your code for errors and indentation issues,
ensuring a smooth commit process.

### GrumPHP with docker

To use GrumPHP with Docker, include this configuration in the .git/hooks/pre-commit file,

by running the `MAKE run` command:

If you already have Docker installed, you can use the following command to initialize GrumPHP with Docker:

```bash
  MAKE copy-precommit-file
```

you can run GrumPHP by this command:

```bash
  MAKE run-grumphp
```

# Workflow:

### Use Maker to create a new transition:

Install our bundle first:  
[Documentation](https://packagist.org/packages/wobz/maker-bundle)

```bash
  php bin/console make:workflow-transition
```

### Generate workflow image:

To generate an image of the workflow, you need to install Graphviz on your Mac.

- `brew install graphviz`

*This package is necessary to read the dot file and generate the workflow image.*

#### after that you can use this command easily:

- `php bin/console workflow:dump order_workflow | dot -Tpng -o workflow/order-workflow.png`

# Consume async queue:

- php bin/console messenger:consume queue_name -vv

> php bin/console messenger:consume async -vv

# Launch the Callas command

### Description:

This command checks for the orders in graphiste status and send file to callas for checking

```
$ php bin/console callas-check

Usage:
  callas-check [options] [--] [<of>]
  
Arguments:
  of                    The particular order of fabrication to check
  
  Options:
  -r, --reset           reset the batch file (batch.txt) 
  -o, --orders=ORDERS   How many orders to check ? [default: 10]
  -s, --status=STATUS   Which status to check ? [default: "g"]
  -h, --help            Display help for the given command. When no command is given display help for the list command
```

# Add a new Discord Bot

If you want a discord bot in a new channel because none of the existing ones are what you want,
please follow these instructions.

First, create a new channel in the room "support".

After, go in the settings of your channel, and click on "intégrations" and add a new webhook.

After that, you just have to copy the webhook's url and put it in a new .env variable (be carefull, it's a DNS in
the .env file, so you have to create it with the copy url details (webhook id and token)).

To finish, in notifier.yaml, you have to add your webhook in the discord transport.

> framework:  
> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;notifier:  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chatter_transports:  
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cdesk: '
> %env(DISCORD_CDESK_BOT)%'
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;database: '
%env(DISCORD_DATABASE_BOT)%'
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new_channel: '
%env(DISCORD_NEW_CHANNEL_BOT)%'

# Set up a new background task

Prerequisite :

- a command doing a generic process (e.g generate invoices from Expedition to Invoiced)

**/!\ Be careful** to not create an Out Of Memory on server node. It happens when processes consumes too much memory
compared to server capacity. A simple way to prevent is to add each memory limit and compare it to node capacity.

- E.g : digicup : numproc 1 * 2Go. Accounting : numproc 2 * 2Go. Total : 6Go, node must have 7Go

Go on messenger node :

```
sudo su
vi /etc/supervisord.d/messenger-cdesk.conf 
```

Example (dont let comments) :

```
[program:cdesk-invoice-generation] <-- nom du programme à changer
command=php /var/www/webroot/ROOT/bin/console app:bg-task "php /var/www/webroot/ROOT/bin/console app:invoice-orders" 1 10 1000 
user=nginx
numprocs=1 <-- toujours laisser à 1, voire 0 pour désactiver
startsecs=0
autostart=true
autorestart=true
process_name=%(program_name)s_%(process_num)02d
```

![image](https://user-images.githubusercontent.com/83288223/232010654-2aee94d8-2990-48e8-a025-6c8f17c636a3.png)

Useful command to manage supervisor :
https://www.onurguzel.com/supervisord-restarting-and-reloading/

# Work with php-stan

Work with php-stan is simple. The only thing you have to do is launch a command in your terminal before ask for a
review (later; a CI/CD process will make this for us).

the command is :
> vendor/bin/phpstan analyse your/folder/to/analyse -l a-number-of-criticality

for example for CDesk :

> vendor/bin/phpstan analyse src/Domain -l 6

Moreover, you have to notice that the number of criticality is between 0 and 9 where 9 is the higher in criticality.

In CustomDesk, we will maintain a criticality rate of 6 on Infrastructure and Application and 9 on Domain.  
Example of error you can have :

<img width="1003" alt="image" src="https://user-images.githubusercontent.com/56299873/234482604-623d4f70-bb4d-4ec0-bb0f-839e9cdcfe12.png">  

If you need further information, don't forget to look at
the [php-stan documentation](https://phpstan.org/user-guide/getting-started)

To manage which files/folder you want to analyse or not or some errors you don't want to correct, you can update the
file phpstan.neon at the root of the project. it has its own language so we leave you to look at the possibilities on
the [phpstan.neon documentation](https://phpstan.org/config-reference#neon-format)

example of what you can do (don't copy the comments) :

```
parameters:
    excludePaths:
        - 'src/Infrastructure/Symfony/Command/Deprecated/'   <-- this folder will not be check by php-stan
        
    reportUnmatchedIgnoredErrors: false  <-- don't report error that you ignor in php-stan
    ignoreErrors:
        - '#^.*no value type specified in iterable type array#'   <-- will ignore all the errors with this string in them

```  

To finish with php-stan, don't forget to install/require some dependencies on the project.
> composer require --dev phpstan/phpstan  
> composer require --dev phpstan/extension-installer  
> composer require --dev phpstan/phpstan-symfony  
> composer require --dev phpstan/phpstan-doctrine
