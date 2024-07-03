<?php

namespace App\Exception\User;

use Exception;

class RequiredUserInformationException extends Exception
{
    public function __construct(string $information)
    {
        parent::__construct(
            "The following user information is required : $information",
            400
        );
    }
}
