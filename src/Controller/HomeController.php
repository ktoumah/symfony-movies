<?php

namespace App\Controller;

use App\Service\ExternalAPI\MovieDBAPI;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(MovieDBAPI $movieDBAPI): Response
    {
        $trendingMovies = $movieDBAPI->getTrendingMoviesByTimeWindow("day");
        $id = $trendingMovies['results'][0]['id'];

        $movieDBAPI->getMovieDetails($id);

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
