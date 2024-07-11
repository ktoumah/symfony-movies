<?php

namespace App\Command;

use App\Entity\Movie;
use App\Service\ExternalAPI\MovieDBAPIInterface;
use App\Service\ResponseFormatter\MovieResponseAPIFormatter;
use App\Service\ResponseFormatter\OverviewResponseAPIFormatter;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(name: 'get-movies', description: 'Get movies from MoviesDB API and store them in our DB')]
class GetMoviesCommand extends Command
{
    private MovieDBAPIInterface $movieDBAPI;
    private MovieResponseAPIFormatter $movieResponseAPIFormatter;
    private OverviewResponseAPIFormatter $overviewResponseAPIFormatter;
    private EntityManagerInterface $entityManager;

    public function __construct(
        MovieDBAPIInterface $movieDBAPI,
        MovieResponseAPIFormatter $movieResponseAPIFormatter,
        OverviewResponseAPIFormatter $overviewResponseAPIFormatter,
        EntityManagerInterface $entityManager
    )
    {
        parent::__construct();
        $this->movieDBAPI = $movieDBAPI;
        $this->movieResponseAPIFormatter = $movieResponseAPIFormatter;
        $this->overviewResponseAPIFormatter = $overviewResponseAPIFormatter;
        $this->entityManager = $entityManager;
    }

    protected function configure(): void
    {
        $this
            ->addArgument('time-window', InputArgument::OPTIONAL, 'Enter frequency')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $timeWindow = $input->getArgument('time-window');

        if (!$timeWindow) {
            $timeWindow = Movie::TIME_WINDOW_DAY;
        }

        try {
            $trendingMovies = $this->movieDBAPI->getTrendingMoviesByTimeWindow($timeWindow);
            $trendingMoviesNumber = count($trendingMovies['results']);
            foreach ($trendingMovies['results'] as $index => $trendingMovie) {
                $movieDetails = $this->movieDBAPI->getMovieDetails($trendingMovie['id']);
                $movie = $this->movieResponseAPIFormatter->fromAPIToEntity($movieDetails);
                $overview = $this->overviewResponseAPIFormatter->fromAPIToEntity($movieDetails);
                $movie->setOverview($overview);
                $this->entityManager->persist($movie);
                $this->entityManager->persist($overview);
                $this->entityManager->flush();
                $io->info("[$index / $trendingMoviesNumber] Update successful for movie with id: ({$movie->getApiProviderId()})");
            }
        } catch (\Exception $exception) {
            $io->error('Movies update error: ' . $exception->getMessage());
        }

        $io->success('Movies updated successfully.');

        return Command::SUCCESS;
    }
}
