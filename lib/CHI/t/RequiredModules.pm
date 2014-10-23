package CHI::t::RequiredModules;
BEGIN {
  $CHI::t::RequiredModules::VERSION = '0.40';
}
use strict;
use warnings;
use CHI::Test;
use base qw(CHI::Test::Class);

sub required_modules { return { 'Data::Dumper' => undef, 'blarg' => undef } }

sub test_blarg : Test(1) {
    require Blarg;
    Blarg->funny();
}

1;
