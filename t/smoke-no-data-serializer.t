#!perl

BEGIN {
  unless ($ENV{AUTOMATED_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for "smoke bot" testing');
  }
}

#
# Tests that things work ok (with warning) without Data::Serializer installed
#
use strict;
use warnings;
use Test::More tests => 3;
use Test::Exception;
use Module::Mask;
use Module::Load::Conditional qw(can_load);
our $mask;
BEGIN { $mask = new Module::Mask ('Data::Serializer') }
use CHI;

require CHI::Driver;

my $cache;
throws_ok { $cache = CHI->new(driver => 'Memory', serializer => 'Data::Dumper', global => 1) } qr/Could not load/, "dies with serializer";
lives_ok { $cache = CHI->new(driver => 'Memory', global => 1) } "lives with no serializer";
$cache->set('foo', 5);
is($cache->get('foo'), 5, 'cache get ok');
