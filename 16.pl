#!/usr/bin/env perl
use strict;

my $ip = "255.255.4.38";  # использовал бы ifconfig, да только винда _/-(o-o)-\_

sub check
{
    my ($ip) = @_;
    return $ip =~ /((\d{1,3}\.){3}\d{1,3})/ && !grep($_ > 255, split '.', $ip);
}

print check($ip) ? "Correct" : "Not correct";
