package CHI::t::Sanity;
BEGIN {
  $CHI::t::Sanity::VERSION = '0.38';
}
use strict;
use warnings;
use CHI::Test;
use base qw(CHI::Test::Class);

sub test_ok : Test(1) {
    ok( 1, '1 is ok' );
}

1;
