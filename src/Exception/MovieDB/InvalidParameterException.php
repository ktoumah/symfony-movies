<?php

namespace App\Exception\MovieDB;

use Exception;

class InvalidParameterException extends Exception
{
    public function __construct(string $parameter)
    {
        parent::__construct(
            "The following parameter type is invalid : $parameter",
            400
        );
    }
}
