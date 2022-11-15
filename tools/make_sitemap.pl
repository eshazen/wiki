#!/usr/bin/perl
#
# read a directory of md files and make a sitemap
#

use strict;

my $dir = $ARGV[0];
die "usage: $0 <directory>" if( $#ARGV < 0);

my $dh;
opendir( $dh, $dir) || die "Can't opendir: $!";
my @filez = grep { /\.md$/} readdir($dh);
closedir $dh;

print "# Site Map\n";

foreach my $f ( @filez ) {
    print "* [$f]($f)\n";
}
