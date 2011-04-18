# Default serializer class, so that we don't have to depend on Data::Serializer.
# Recommend Data::Serializer for other serializers, rather than reinventing the wheel.
#
package CHI::Serializer::Storable;
BEGIN {
  $CHI::Serializer::Storable::VERSION = '0.45';
}
use Moose;
use Storable;
use strict;
use warnings;

__PACKAGE__->meta->make_immutable;

sub serialize {
    return Storable::freeze( $_[1] );
}

sub deserialize {
    return Storable::thaw( $_[1] );
}

sub serializer {
    return 'Storable';
}

1;
