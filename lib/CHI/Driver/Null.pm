package CHI::Driver::Null;
BEGIN {
  $CHI::Driver::Null::VERSION = '0.51';
}
use Moose;
use strict;
use warnings;

extends 'CHI::Driver';
__PACKAGE__->meta->make_immutable();

sub fetch          { undef }
sub store          { undef }
sub remove         { undef }
sub clear          { undef }
sub get_keys       { return () }
sub get_namespaces { return () }

1;



=pod

=head1 NAME

CHI::Driver::Null - Nothing is cached

=head1 VERSION

version 0.51

=head1 SYNOPSIS

    use CHI;

    my $cache = CHI->new(driver => 'Null');
    $cache->set('key', 5);
    my $value = $cache->get('key');   # returns undef

=head1 DESCRIPTION

This cache driver implements the full CHI interface without ever actually
storing items. Useful for disabling caching in an application, for example.

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

