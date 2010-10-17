
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'RESTful interface to Factual.com, using Spore',
  'AUTHOR' => 'Andrew Grangaard <spazm@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Net-HTTP-Factual',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Net::HTTP::Factual',
  'PREREQ_PM' => {
    'Moose' => '0',
    'Net::HTTP::Spore' => '0'
  },
  'VERSION' => '0.102900',
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



