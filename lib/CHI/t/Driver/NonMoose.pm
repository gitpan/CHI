package CHI::t::Driver::NonMoose;
BEGIN {
  $CHI::t::Driver::NonMoose::VERSION = '0.37';
}
use strict;
use warnings;
use CHI::Test;
use base qw(CHI::t::Driver::Memory);

sub testing_driver_class   { 'CHI::Test::Driver::NonMoose' }
sub test_short_driver_name { }

1;
