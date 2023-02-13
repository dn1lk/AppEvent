#!/usr/bin/env perl
use strict;

sub morph
{
    my ($digit, $form1, $form2, $form3) = @_;
    my $word;

    my $n100 = abs($digit) % 100;
    my $n10 = $digit % 10;

    (10 < $n100 < 20) ? $word = $form3 : ($n10 == 1) ? $word = $form1 : (1 < $n10 < 5) ? $word = $form2 : $word = $form3;
    return $digit . ' ' . $word;
}

print morph(1, 'новость', 'новости', 'новостей')
