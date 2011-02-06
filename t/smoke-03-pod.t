#!perl

BEGIN {
  unless ($ENV{AUTOMATED_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for "smoke bot" testing');
  }
}

use strict;
use warnings;
use Test::More;
use Test::Pod;

all_pod_files_ok();
