#!/usr/bin/env perl
use strict;

$, = ' ';

my @list = (5, 2, 3, 4, 2, 4);
my %seen;

print grep(!$seen{$_}++, sort({$a <=> $b} @list));
