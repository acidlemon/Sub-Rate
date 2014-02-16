use strict;
use warnings;
use Test::More;

use_ok 'Sub::Rate';

my $rate = Sub::Rate->new( max_rate => 100 );
isa_ok $rate, 'Sub::Rate';

my ($r1, $r2) = (0, 0);

$rate->add( 0 => sub { $r1++ } );
$rate->add( 100 => sub { $r2++ } );

# mock for boundary
$rate->rand_func( sub { 0 } );

my $func = $rate->generate;

$func->();

is $r1, 0, 'r1 not increment ok';

done_testing;

