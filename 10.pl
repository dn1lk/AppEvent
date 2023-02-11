#!/usr/bin/env perl
use strict;

my $filename_old = "10_old.txt";
my $filename_new = "10_new.txt";

my $filedata;

open(fh_old, "<", $filename_old) or die "File '$filename_old' can't be opened";

while(<fh_old>)
{
    $filedata .= $_;
}

close(fh_old) or "Couldn't close files";

$filedata =~ s/text/another/g;  # или без g, если хотим заменить только первое слово

open(fh_new, ">", $filename_new) or die "File '$filename_new' can't be opened";
print $filedata;
print fh_new $filedata;

close(fh_new) or "Couldn't close files";
