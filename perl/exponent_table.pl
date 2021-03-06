#!/usr/bin/env perl

use strict;
use warnings;

use constant MAX_VAL     => 1000;
use constant BASE_MAX    => 30;
use constant DIVISOR_MAX => 30;

use bigint;

# Computes a table of data for pretty printing later
my %computed;
for my $base ( 2 .. BASE_MAX ) {
  for my $divisor ( 2 .. DIVISOR_MAX ) {
    for my $multiple ( 1 .. MAX_VAL ) {
      my $exponent = $base**$multiple;
      last if $exponent > MAX_VAL;
      next if $exponent % $divisor;
      push @{ $computed{$base}{$divisor} }, $exponent;
    }
  }
}

# Pretty Prints Accumulated data.
for my $base ( sort { $a <=> $b } keys %computed ) {
  printf "exponents of %2d:\n", $base;
  for my $divisor ( sort { $a <=> $b } keys %{ $computed{$base} } ) {
    printf "  divisible by %2d: %s\n", $divisor, join q[ ],
      map { sprintf "%4d,", $_ } @{ $computed{$base}{$divisor} };
  }
}
