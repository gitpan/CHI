package CHI::t::Constants;
BEGIN {
  $CHI::t::Constants::VERSION = '0.39';
}
use strict;
use warnings;
use CHI::Test;
use base qw(CHI::Test::Class);

sub test_import : Test(4) {
    {
        package Foo;
BEGIN {
  $Foo::VERSION = '0.39';
}
        use CHI::Constants qw(CHI_Meta_Namespace);
    }
    {
        package Bar;
BEGIN {
  $Bar::VERSION = '0.39';
}
        use CHI::Constants qw(:all);
    }
    {
        package Baz;
BEGIN {
  $Baz::VERSION = '0.39';
}
    }
    is( Foo::CHI_Meta_Namespace, '_CHI_METACACHE' );
    is( Bar::CHI_Meta_Namespace, '_CHI_METACACHE' );
    ok( Bar->can('CHI_Meta_Namespace') );
    ok( !Baz->can('CHI_Meta_Namespace') );
}

1;
