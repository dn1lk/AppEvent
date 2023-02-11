#!/usr/bin/env perl
use strict;

# на винде такой команды нет, повзаимствовал у коллег вывод
sub ifconfig
{
    my $filename = "15.txt";
    my $ifconfig;

    open(fh, "<", $filename) or die "File '$filename' can't be opened";

    while(<fh>)
    {
        $ifconfig .= $_;
    }

    close(fh) or "Couldn't close files";

    return split('\n\n', $ifconfig);
}

my @ifconfig = ifconfig;

# парсим интерфейсы, сохраняем ipnet, netmask, broadcast
my %interfaces = map
{
    my $inet = (/(inet )((\d+\.){3}\d+)/)[1];
    my $netmask = (/(netmask )((\d+\.){3}\d+)/)[1];
    my $broadcast = (/(broadcast )((\d+\.){3}\d+)/)[1];
    
    if ($inet && $netmask && $broadcast)
    {
        /(\S+): / => [$inet, $netmask, $broadcast]
    }
    else
    {
        /(\S+): / => []
    };
} @ifconfig;

for (keys %interfaces) {print $_, ": ", join(', ', @{$interfaces{$_}}), "\n"}
