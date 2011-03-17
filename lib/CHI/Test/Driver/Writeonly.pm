package CHI::Test::Driver::Writeonly;
BEGIN {
  $CHI::Test::Driver::Writeonly::VERSION = '0.44';
}
use Carp;
use strict;
use warnings;
use Moose;
extends 'CHI::Driver::Memory';
__PACKAGE__->meta->make_immutable();

sub fetch {
    my ( $self, $key ) = @_;

    croak "write-only cache";
}

1;
