#!/usr/bin/env perl

use strict;
use warnings;

use constant MAX_VAL => 1000;
use bigint;

my %computed;

for my $base ( 2 .. 30 ) {
  for my $divisor ( 2 .. 30 ) {
    my @matches;
    for my $multiple ( 1 .. MAX_VAL ) {
      my $exponent = $base ** $multiple;
      last if $exponent > MAX_VAL;
      push @matches, $exponent if $exponent % $divisor == 0;
    }
    $computed{$base}{$divisor} = \@matches if @matches;
  }
}

for my $base ( sort { $a <=> $b } keys %computed ) {
  printf "exponents of %2d:\n", $base;
  for my $divisor ( sort { $a <=> $b } keys %{ $computed{$base} } ) {
    printf "  divisible by %2d: %s\n", $divisor, join q[ ], map { sprintf "%4d,", $_ } @{ $computed{$base}{$divisor} };
  }
}
