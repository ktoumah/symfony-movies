<?php


namespace App\Service\ExternalAPI;

use App\Entity\Movie;
use App\Exception\MovieDB\InvalidParameterException;
use App\Exception\MovieDB\MovieDBResponseException;
use Symfony\Component\DependencyInjection\Exception\ParameterNotFoundException;
use Symfony\Contracts\HttpClient\HttpClientInterface;

interface MovieDBBearerAuthenticationInterface
{
    public function getHeaders(): array;
}