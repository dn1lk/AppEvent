#!/usr/bin/env perl
use strict;

my $ip = "255.255.4.38";  # использовал бы ifconfig, да только винда _/-(o-o)-\_

sub check
{
    my ($ip) = @_;
    return $ip =~ /((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)/;
}

print check($ip) ? "Correct" : "Not correct";
