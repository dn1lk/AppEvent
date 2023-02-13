#!/usr/bin/env perl
use strict;

my $bt = 1_024;
my @unit = ('bite', 'KB', 'MB', 'GB', 'TB');

my $unit_number;

while ($bt >= 1_024 && $unit_number + 1 < scalar @unit)
{
    $bt /= 1_024;
    $unit_number++
}

printf "%.0f @unit[$unit_number]", $bt;
