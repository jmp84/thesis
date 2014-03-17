#!/usr/bin/perl -w

use strict;

if (@ARGV != 2) {
    print STDERR "Args: <ref file> <sysid>\n";
    exit(1);
}

my ($reffile, $sysid) = @ARGV;
open(REF, "zcat -f $reffile |") or die("Cannot open file $reffile: $!\n");

my $doprint = 1;
while (<REF>) {
    chomp;
    if (/sysid="$sysid"/) {
	$doprint = 0;
	# print STDERR "doprint set to zero b/c this line: $_\n";
    } elsif (/sysid=/) {
	$doprint = 1;
    }
    if ($doprint) {
	print "$_\n";
    }
}

print "</refset>\n";
