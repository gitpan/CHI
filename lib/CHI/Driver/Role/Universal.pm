package CHI::Driver::Role::Universal;
BEGIN {
  $CHI::Driver::Role::Universal::VERSION = '0.39';
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

around 'remove' => sub {
    my ( $orig, $self, $key ) = @_;

    # Call transform_key before passing to remove
    return $self->$orig( $self->transform_key($key) );
};

1;



=pod

=head1 NAME

CHI::Driver::Role::Universal - Universal role applied as the innermost role to all CHI drivers

=head1 VERSION

version 0.39

=head1 SEE ALSO

L<CHI|CHI>

=head1 AUTHOR

Jonathan Swartz <swartz@pobox.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__
# ABSTRACT: Universal role applied as the innermost role to all CHI drivers

