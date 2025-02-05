use strict;
use warnings;
use Test::More;
use Random::RDTSC qw(get_rdtsc rdtsc_rand64);
use Config;

my $is_64bit = ($Config{use64bitint} || $Config{use64bitall});

# Have to be larger than zero
cmp_ok(get_rdtsc()   , '>', 0, 'RDTSC is non-zero');
cmp_ok(rdtsc_rand64(), '>', 0, 'rand64 is non-zero');

# Make sure the values we're getting are sane
cmp_ok(get_rdtsc()   , '<' , get_rdtsc()   , 'RDTSC values are monotonically increasing');
cmp_ok(rdtsc_rand64(), '!=', rdtsc_rand64(), 'Subsequent rand64 are different');

# Make sure we're getting real integers
ok(is_int(get_rdtsc())   , 'RDTSC is an integer');
ok(is_int(rdtsc_rand64()), 'rand64 is an integer');

my $num = get_avg_rand64(5000);
ok($num > 2**62 && $num < 2**64, "rand64() generates the right size numbers") or diag("rand64(): $num not in range");

done_testing();

#############################################################

sub get_avg_rand64 {
	my ($count) = @_;

	$count ||= 50000;

	my $total = 0;
	for (my $i = 0; $i < $count; $i++) {
		my $num = rdtsc_rand64();

		$total += $num;
	}

	my $ret = $total / $count;

	return $ret;
}

sub is_int {
    my $str = $_[0];
    #trim whitespace both sides
    $str = trim($str);

    #Alternatively, to match any float-like numeric, use:
    # m/^([+-]?)(?=\d|\.\d)\d*(\.\d*)?([Ee]([+-]?\d+))?$/

    #flatten to string and match dash or plus and one or more digits
    if ($str =~ /^(\-|\+)?\d+?$/) {
		return 1;
    } else{
		return 0;
    }
}

sub trim {
	my ($s) = (@_, $_); # Passed in var, or default to $_
	if (!defined($s) || length($s) == 0) { return ""; }
	$s =~ s/^\s*//;
	$s =~ s/\s*$//;

	return $s;
}
