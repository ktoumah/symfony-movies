<?php

namespace App\Service\ResponseFormatter;

use App\Entity\Overview;

class OverviewResponseAPIFormatter
{

    public function fromAPIToEntity(array $apiData): Overview
    {
        $overview = new Overview();
        $overview
            ->setValue($apiData['overview'])
        ;

        return $overview;
    }

}