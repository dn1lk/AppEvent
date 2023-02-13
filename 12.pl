#!/usr/bin/env perl
use strict;

my $i;
$i = ++$i + ++$i + ++$i;      # ((0 + 1) + (0 + 1 + 1)) + ((0 + 1) + (0 + 1 + 1)) = 7

my $no_i;
$no_i += 1;                   # 0 + 1 = 1
$no_i = $no_i + (1 + $no_i);  # 1 + (1 + 1) = 3
$no_i = $no_i + (1 + $no_i);  # 3 + (1 + 3) = 7

print $i, ' - ', $no_i;
