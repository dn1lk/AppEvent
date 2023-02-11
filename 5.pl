#!/usr/bin/env perl
use strict;

sub datetime_format
{                                                                                      # написано функцию, которая возвращает - делаю функцию, которая возвращает (а не выводит)
    my $format = "%4d-%02d-%02d %02d:%02d:%02d";
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime();
    return sprintf $format, $year + 1900, $mon + 1, $mday, $hour, $min, $sec;          # $year >= 1900, $mon == (0..11)
}

printf datetime_format;
