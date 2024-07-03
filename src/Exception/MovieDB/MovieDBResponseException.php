<?php

namespace App\Exception\MovieDB;

use Exception;

class MovieDBResponseException extends Exception
{
    public function __construct(Exception $exception)
    {
        parent::__construct(
            "Error when calling Movie DB API :" . $exception->getMessage(),
            $exception->getCode()
        );
    }
}
