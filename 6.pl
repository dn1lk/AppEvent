#!/usr/bin/env perl
use strict;

my @list = ('A'..'Z', 'a'..'z', '0'..'9');
my $key;

for (1..10) {$key .= @list[rand @list]}

print $key;
