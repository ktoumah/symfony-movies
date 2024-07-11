<?php

namespace App\Service\ResponseFormatter;

use App\Entity\Overview;

class OverviewResponseAPIFormatter implements MovieResponseAPIFormatterInterface
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