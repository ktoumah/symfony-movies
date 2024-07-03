<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240703102704 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE movie ADD original_language VARCHAR(2) DEFAULT NULL, ADD popularity INT DEFAULT NULL, ADD vote_average DOUBLE PRECISION DEFAULT NULL, ADD vote_count INT DEFAULT NULL, CHANGE api_provider_id api_provider_id INT DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE movie DROP original_language, DROP popularity, DROP vote_average, DROP vote_count, CHANGE api_provider_id api_provider_id VARCHAR(50) NOT NULL');
    }
}
