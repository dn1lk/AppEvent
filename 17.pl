#!/usr/bin/env perl
use strict;

my $number = 12345678.09;

$number = sprintf "%.2f", $number;
while ($number =~ s/(.*\d)(\d\d\d)/$1\'$2/g) {};  # каюсь, просто скопировал с интернетов

printf $number;
