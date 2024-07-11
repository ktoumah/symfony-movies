<?php

namespace App\Service\ResponseFormatter;


interface MovieResponseAPIFormatterInterface
{
    public function fromAPIToEntity(array $apiData): object;

}