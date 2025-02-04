# NAME

Random::RDTSC - Perl wrapper for RDTSC-based random number generation

# SYNOPSIS

```perl
use Random::RDTSC qw(get_rdtsc rdtsc_rand64);

my $timestamp  = get_rdtsc();
my $random_val = rdtsc_rand64();

print "TSC: $timestamp, Random: $random_val\n";
```

# DESCRIPTION

This module provides access to the `get_rdtsc()` and `rdtsc_rand64()` functions from the `rdtsc_rand` library, allowing for high-resolution timestamps and random number generation based on the CPU's RDTSC instruction.

# FUNCTIONS

## get\_rdtsc

    my $tsc = get_rdtsc();

Returns the current timestamp counter value.

## rdtsc\_rand64

    my $rand = rdtsc_rand64();

Returns a 64-bit random number based on the timestamp counter.

# AUTHOR

Scott Baker - https://www.perturb.org/

# LICENSE

This library is free software; you may redistribute it and/or modify it under the same terms as Perl itself.
