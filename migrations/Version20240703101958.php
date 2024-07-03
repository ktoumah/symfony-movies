<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240703101958 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE overview ADD movie_id INT NOT NULL');
        $this->addSql('ALTER TABLE overview ADD CONSTRAINT FK_E7C3D1BB8F93B6FC FOREIGN KEY (movie_id) REFERENCES movie (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_E7C3D1BB8F93B6FC ON overview (movie_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE overview DROP FOREIGN KEY FK_E7C3D1BB8F93B6FC');
        $this->addSql('DROP INDEX UNIQ_E7C3D1BB8F93B6FC ON overview');
        $this->addSql('ALTER TABLE overview DROP movie_id');
    }
}
