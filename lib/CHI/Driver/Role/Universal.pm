package CHI::Driver::Role::Universal;
BEGIN {
  $CHI::Driver::Role::Universal::VERSION = '0.47';
}
use CHI::Constants qw(CHI_Meta_Namespace);
use Moose::Role;
use strict;
use warnings;

around 'get_namespaces' => sub {
    my $orig = shift;
    my $self = shift;

    # Call driver get_namespaces, then filter out meta-namespace
    return grep { $_ ne CHI_Meta_Namespace } $self->$orig(@_);
};

foreach my $method (qw(remove append)) {
    around $method => sub {
        my ( $orig, $self, $key, @rest ) = @_;

        # Call transform_key before passing to method
        return $self->$orig( $self->transform_key($key), @rest );
    };
}

1;

__END__

=pod

=cut
