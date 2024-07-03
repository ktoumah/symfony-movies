<?php


namespace App\Service\ExternalAPI;

use App\Entity\Movie;
use App\Exception\MovieDB\InvalidParameterException;
use App\Exception\MovieDB\MovieDBResponseException;
use Symfony\Component\DependencyInjection\Exception\ParameterNotFoundException;
use Symfony\Contracts\HttpClient\HttpClientInterface;

class MovieDBAPI
{
    private HttpClientInterface $httpClient;
    private string $movie_db_v3_url;
    private string $movie_db_v3_token;

    public function __construct(HttpClientInterface $httpClient, string $movie_db_v3_url, string $movie_db_v3_token)
    {
        $this->httpClient = $httpClient;
        $this->movie_db_v3_url = $movie_db_v3_url;
        $this->movie_db_v3_token = $movie_db_v3_token;
    }

    private function isAValidTimeWindow($timeWindow): bool
    {
        return in_array($timeWindow, Movie::getAllTimes());
    }

    private function getHeaders(): array
    {
        return  [
            'Authorization' => 'Bearer ' . $this->movie_db_v3_token,
            'accept' => 'application/json',
        ];
    }

    public function getTrendingMoviesByTimeWindow(string $timeWindow = Movie::TIME_WINDOW_DAY): array
    {
        if (!$this->isAValidTimeWindow($timeWindow)) {
            throw new ParameterNotFoundException("The following parameter is not authorized: " . $timeWindow);
        }

        try {
            $response = $this->httpClient->request('GET', "{$this->movie_db_v3_url}/trending/movie/{$timeWindow}?language=en-US", [
                'headers' => $this->getHeaders(),
            ]);
            $data = $response->toArray();
        } catch (\Exception $exception) {
            throw new MovieDBResponseException($exception);
        }

//        dump($data);

        return $data;
    }

    public function getMovieDetails(int $id): array
    {
        if (!is_int($id)) {
            throw new InvalidParameterException($id);
        }

        try {
            $response = $this->httpClient->request('GET', "{$this->movie_db_v3_url}/movie/{$id}?language=en-US", [
                'headers' => $this->getHeaders(),
            ]);
            $data = $response->toArray();
        } catch (\Exception $exception) {
            throw new MovieDBResponseException($exception);
        }


//        dump($data);

        return $data;
    }

}