package CHIx::DecayedSet;
BEGIN {
  $CHIx::DecayedSet::VERSION = '0.49';
}
use Moose;

has 'cache'       => ( isa => 'CHI::Types::Cache' );
has 'decays_in'   => ( isa => 'CHI::Types::Duration' );
has 'granularity' => ( isa => 'CHI::Types::Duration' );

sub insert {
    my ($value) = @_;

    my $key =;
    $self->cache->;
}

__PACKAGE__->meta->make_immutable();

1;
