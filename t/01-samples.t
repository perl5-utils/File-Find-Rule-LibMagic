#!perl

use strict;
use warnings;

use FindBin;
use File::Spec;
use Data::Dumper;

use File::Find::Rule::LibMagic;

use Test::More tests => 2;

my $searchdir = File::Spec->catdir( $FindBin::Bin, 'samples' );
my @executables = find( file => magic => '*script text executable', in => $searchdir );
cmp_ok( scalar(@executables), '==', 2, 'find by magic' );

my @xfiles = find( file => mime => 'text/x-*', in => $searchdir );
cmp_ok( scalar( @xfiles ), '==', 4, 'find by MIME types' );
