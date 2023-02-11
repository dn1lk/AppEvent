#!/usr/bin/env perl
use strict;

{                                                                                           # экранируем объект
    package Animal;

    sub new
    {                                                                                       # функция создания нового экземпляра
        my $class = shift;
        my $self = {
            _age => shift,
        };

        bless $self, $class;
    };

    sub age
    {                                                                                       # функция работы с возрастом
        my ($self, $age) = @_;

        if ($age)
        {
            $self -> {_age} = $age;
        }
        else
        {
            return $self -> {_age};                                                         # нужно как-то проверить, является ли переменная экзепляром или классом
        }
    }
}

{                                                                                           # экранируем объект
    package Animal::Cat;
    our @ISA = qw(Animal);
    
    sub new
    {                                                                                       # функция создания нового экземпляра
        my $class = shift;
        my $self = {
            _age => shift,
            _lifes => shift || 9,
        };

        bless $self, $class;
    };

    sub lifes
    {                                                                                       # функция работы с жизнями
        my ($self, $lifes) = @_;

        if ($lifes)
        {
            $self -> {_lifes} = $lifes;
        }
        else
        {
            return $self -> {_lifes};                                                       # нужно как-то проверить, является ли переменная экзепляром или классом
        }
    }


    sub add
    {                                                                                       # функция сложения кошек
        my ($first_cat, $second_cat) = @_;

        my $age = $first_cat -> age + $second_cat -> age;
        $first_cat -> {_lifes} = --($first_cat -> {_lifes});

        my $self = new Animal::Cat($age);        
    }

    use overload '+' => \&add;
}

my $cat_1 = new Animal::Cat(2);
my $cat_2 = new Animal::Cat;

$cat_1 -> lifes(2);
print 'First cat has lifes: ', $cat_1 -> lifes, "\n";

my $cat_3 = $cat_1 + $cat_2;
print 'Third cat has age: ', $cat_3 -> age, "\n";
print 'But first cat has lifes: ', $cat_1 -> lifes, "\n";
