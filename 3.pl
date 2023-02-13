#!/usr/bin/env perl
use experimental smartmatch;
use strict;

my @list = (1, 2, 3, 4, 'ab');
my $value = 'ab';

if (grep /^$value$/, @list)  {print "1, exists\n"};
if (grep $_ == $value, @list) {print "2, exists\n"};
if (map $_ == $value ? $_ : (), @list) {print "3, exists\n"};
if ($value ~~ @list) {print "4, exists\n"};

my %hash = map {$_ => 1} @list;  # делаем элементы ключами, а единицы - значениями
if (exists $hash{$value}) {print "5, exists\n"};
