<?php

namespace App\Controller;

use App\Entity\Movie;
use App\Form\MovieType;
use App\Repository\MovieRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/backoffice')]
class MoviesController extends AbstractController
{
    #[Route('/movies', name: 'app_movies')]
    public function index(
        EntityManagerInterface $entityManager,
        PaginatorInterface $paginator,
        Request $request,
        MovieRepository $movieRepository
    ): Response
    {
        $movies = $paginator->paginate(
            $movieRepository->findAllQuery(),
            $request->query->getInt('page', 1),
            10
        );

        return $this->render('movie/index.html.twig', [
            'movies' => $movies,
        ]);
    }

    #[Route('/movies/{id}/show', name: 'movie_show', requirements: ['id' => '\d+'])]
    public function show(Movie $movie): Response
    {
        if (!$movie) {
            throw $this->createNotFoundException('The movie does not exist');
        }

        return $this->render('movie/show.html.twig', [
            'movie' => $movie,
        ]);
    }

    #[Route('/movies/{id}/delete', name: 'movie_delete', requirements: ['id' => '\d+'])]
    public function delete(Movie $movie, EntityManagerInterface $entityManager): Response
    {
        if (!$movie) {
            throw $this->createNotFoundException('The movie does not exist');
        }

        $entityManager->remove($movie);
        $entityManager->flush();

        return $this->redirectToRoute('app_movies');
    }

    #[Route('/movies/{id}/edit', name: 'movie_edit', requirements: ['id' => '\d+'])]
    public function edit(Movie $movie, EntityManagerInterface $entityManager, Request $request): Response
    {
        if (!$movie) {
            throw $this->createNotFoundException('The movie does not exist');
        }

        $form = $this->createForm(MovieType::class, $movie);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('movie_show', ['id' => $movie->getId()]);
        }

        return $this->render('movie/edit.html.twig', [
            'form' => $form->createView(),
            'movie' => $movie,
        ]);
    }
}
