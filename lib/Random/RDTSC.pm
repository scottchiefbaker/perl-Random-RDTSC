package Random::RDTSC;

use strict;
use warnings;
require Exporter;
require DynaLoader;

our @ISA       = qw(Exporter DynaLoader);
our @EXPORT_OK = qw(get_rdtsc rdtsc_rand64);
our $VERSION   = '0.1';

bootstrap Random::RDTSC $VERSION;

1;

__END__

=head1 NAME

Random::RDTSC - Perl wrapper for RDTSC-based random number generation

=head1 SYNOPSIS

    use Random::RDTSC qw(get_rdtsc rdtsc_rand64);

    my $timestamp  = get_rdtsc();
    my $random_val = rdtsc_rand64();

    print "TSC: $timestamp, Random: $random_val\n";

=head1 DESCRIPTION

This module provides access to the C<get_rdtsc()> and C<rdtsc_rand64()> functions from the C<rdtsc_rand> library, allowing for high-resolution timestamps and random number generation based on the CPU's RDTSC instruction.

=head1 FUNCTIONS

=head2 get_rdtsc

    my $tsc = get_rdtsc();

Returns the current timestamp counter value.

=head2 rdtsc_rand64

    my $rand = rdtsc_rand64();

Returns a 64-bit random number based on the timestamp counter.

=head1 AUTHOR

Scott Baker - https://www.perturb.org/

=head1 LICENSE

This library is free software; you may redistribute it and/or modify it under the same terms as Perl itself.

=cut
