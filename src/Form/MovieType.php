<?php

namespace App\Form;

use App\Entity\Movie;
use App\Entity\Overview;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MovieType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', null, [
                'label' => 'Titre'
            ])
            ->add('posterPath')
            ->add('apiProviderId')
            ->add('originalLanguage')
            ->add('popularity')
            ->add('voteAverage')
            ->add('voteCount')
            ->add('backdropPath')
            ->add('releaseDate', null, [
                'widget' => 'single_text',
            ])
            ->add('overview', OverviewType::class, [
                'required' => false
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Movie::class,
        ]);
    }
}
