#!/usr/bin/env perl
use strict;

my $stdin; 
my $sum;

while ($stdin ne 'done')
{
    $sum += $stdin;
    
    print 'Input number: ';
    $stdin = <STDIN>;
    chomp($stdin);
}

print 'Sum of numbers: ', $sum;
