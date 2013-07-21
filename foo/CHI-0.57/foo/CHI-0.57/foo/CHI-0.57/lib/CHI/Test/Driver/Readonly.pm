package CHI::Test::Driver::Readonly;
{
  $CHI::Test::Driver::Readonly::VERSION = '0.57';
}
use Carp;
use Moo;
use strict;
use warnings;
extends 'CHI::Driver::Memory';

sub store {
    my ( $self, $key, $data ) = @_;

    croak "read-only cache";
}

1;
