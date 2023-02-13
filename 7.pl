#!/usr/bin/env perl
use strict;

$, = ' ';

my @list = ('аБ-3', 'Аа-2', 'Ab-7', 'Dd-8', 4, 6, '4', 'Dя-9', 'АА-1');

print sort {my $cyr_a;
            $cyr_a = $a if $a =~ /^[а-яА-ЯёЁйЙ]+/;

            my $cyr_b;
            $cyr_b = $b if $b =~ /^[а-яА-ЯёЁйЙ]+/;

            ($cyr_a && !$cyr_b) ? -1 : (!$cyr_a && $cyr_b) ? 1 : ($a cmp $b)} @list;
