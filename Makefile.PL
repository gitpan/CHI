
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Unified cache handling interface',
  'AUTHOR' => 'Jonathan Swartz <swartz@pobox.com>',
  'BUILD_REQUIRES' => {
    'Date::Parse' => '0',
    'Log::Any::Adapter::Dispatch' => '0.05',
    'Test::Builder' => '0',
    'Test::Class' => '0',
    'Test::Deep' => '0',
    'Test::Exception' => '0',
    'Test::Log::Dispatch' => '0',
    'Test::More' => '0',
    'Test::Warn' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'CHI',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'CHI',
  'PREREQ_PM' => {
    'Carp::Assert' => '0.20',
    'Data::UUID' => '0',
    'Digest::JHash' => '0',
    'Digest::MD5' => '0',
    'File::Spec' => '0.80',
    'Hash::MoreUtils' => '0',
    'JSON' => '0',
    'List::MoreUtils' => '0.13',
    'Log::Any' => '0.06',
    'Moose' => '0.66',
    'Storable' => '0',
    'Task::Weaken' => '0',
    'Time::Duration' => '1.06',
    'Time::Duration::Parse' => '0.03',
    'Try::Tiny' => '0.05'
  },
  'VERSION' => '0.37',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



