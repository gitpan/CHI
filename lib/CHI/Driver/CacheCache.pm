package CHI::Driver::CacheCache;
BEGIN {
  $CHI::Driver::CacheCache::VERSION = '0.56';
}
use Cache::Cache;
use Carp;
use Moose;
use strict;
use warnings;

extends 'CHI::Driver::Base::CacheContainer';

has 'cc_class'   => ( is => 'ro', isa => 'Str', required => 1 );
has 'cc_options' => ( is => 'ro', isa => 'HashRef', required => 1 );

__PACKAGE__->meta->make_immutable();

sub BUILD {
    my ( $self, $params ) = @_;

    $self->{_contained_cache} = $self->_build_contained_cache;
}

sub _build_contained_cache {
    my ($self) = @_;

    my $cc_class   = $self->{cc_class};
    my $cc_options = $self->{cc_options};
    my %subparams  = ( namespace => $self->namespace );

    Class::MOP::load_class($cc_class);

    my %final_cc_params = ( %subparams, %{$cc_options} );

    return $cc_class->new( \%final_cc_params );
}

1;



=pod

=head1 NAME

CHI::Driver::CacheCache - CHI wrapper for Cache::Cache

=head1 VERSION

version 0.56

=head1 SYNOPSIS

    use CHI;

    my $cache = CHI->new(
        driver     => 'CacheCache',
        cc_class   => 'Cache::FileCache',
        cc_options => { cache_root => '/path/to/cache/root' },
    );

=head1 DESCRIPTION

This driver wraps any Cache::Cache cache.

=head1 CONSTRUCTOR OPTIONS

When using this driver, the following options can be passed to CHI->new() in
addition to the L<CHI|general constructor options/constructor>.

=over

=item cc_class

Name of Cache::Cache class to create, e.g. Cache::FileCache. Required.

=item cc_options

Hashref of options to pass to Cache::Cache constructor. Required.

=back

=head1 SEE ALSO

L<CHI|CHI>

=head1 AUTHOR

Jonathan Swartz <swartz@pobox.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

