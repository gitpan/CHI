package CHI::Test::Driver::NonMoose;
BEGIN {
  $CHI::Test::Driver::NonMoose::VERSION = '0.55';
}
use Carp;
use strict;
use warnings;
use base qw(CHI::Driver::Memory);

1;
