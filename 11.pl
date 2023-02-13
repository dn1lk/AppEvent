#!/usr/bin/env perl
use strict;

my $filename = "11.txt";
my %filedata;

open(fh, "<", $filename) or die "File '$filename' can't be opened";
local $/; # enable localized slurp mode

my $words = <fh>;
$words ~= s/[,\.]//g;
for (split ' ', "\L$words") {$filedata{$_}++;};

for (keys %filedata)
{
    print $_, ': ', $filedata{$_}, "\n";
}

close(fh) or "Couldn't close files";
