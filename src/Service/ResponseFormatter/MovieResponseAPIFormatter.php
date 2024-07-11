<?php

namespace App\Service\ResponseFormatter;

use App\Entity\Movie;

class MovieResponseAPIFormatter implements MovieResponseAPIFormatterInterface
{
    public function fromAPIToEntity(array $apiData): Movie
    {
        $movie = new Movie();
        $movie
            ->setName($apiData['original_title'])
            ->setPosterPath($apiData['poster_path'])
            ->setApiProviderId($apiData['id'])
            ->setOriginalLanguage($apiData['original_language'])
            ->setPopularity($apiData['popularity'])
            ->setVoteAverage($apiData['vote_average'])
            ->setVoteCount($apiData['vote_count'])
            ->setBackdropPath($apiData['backdrop_path'])
            ->setReleaseDate(date_create($apiData['release_date']))
        ;

        return $movie;
    }

}