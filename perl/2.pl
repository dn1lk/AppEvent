#!/usr/bin/env perl
use strict;

$, = ' ';

my @list1 = (1, 0, 2, 3, 4, 'ee');
my @list2 = (3, 4, 2, 'ee', 'ab');

sub diff
{
    my (@list1) = @{$_[0]};
    my (@list2) = @{$_[1]};

    my %list1 = map {$_ => 1} @list1;
    my %list2 = map {$_ => 1} @list2;

    my @diff1 = grep !exists $list2{$_}, @list1;
    my @diff2 = grep !exists $list1{$_}, @list2;

    return (@diff1, @diff2);
}

print diff(\@list1, \@list2);
