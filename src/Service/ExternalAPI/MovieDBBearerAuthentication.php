<?php


namespace App\Service\ExternalAPI;

use App\Entity\Movie;
use App\Exception\MovieDB\InvalidParameterException;
use App\Exception\MovieDB\MovieDBResponseException;
use Symfony\Component\DependencyInjection\Exception\ParameterNotFoundException;
use Symfony\Contracts\HttpClient\HttpClientInterface;

class MovieDBBearerAuthentication implements MovieDBBearerAuthenticationInterface
{
    private string $movie_db_v3_token;

    public function __construct(string $movie_db_v3_token)
    {
        $this->movie_db_v3_token = $movie_db_v3_token;
    }

    public function getHeaders(): array
    {
        return  [
            'Authorization' => 'Bearer ' . $this->movie_db_v3_token,
            'accept' => 'application/json',
        ];
    }

}