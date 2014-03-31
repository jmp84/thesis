#!/usr/bin/perl -w

use strict;

if (@ARGV != 3) {
    print STDERR "Args: <ref file> <sysid> <doc ids>\n";
    exit(1);
    die "Usage: $0 docids(uniq) output_prefix < ref_sgm_file \n";
}

my ($reffile, $sysid, $docids) = @ARGV;
open(REF, "zcat -f $reffile |") or die("Cannot open file $reffile: $!\n");
open(DID, "zcat -f $docids |") or die("Cannot open file $docids: $!\n");

my %DOCS;

### 1- load ordered list of docids
my $last="";
my @ids;
while(<DID>) {
    chomp;
    if ($_ ne $last) {
	push(@ids, $_);
	$last=$_;
    }
}
close(DID);

### 2- load all references into a hash
my $current_doc="";
my $current_sys="";
while(<REF>) {
    chomp;
    if (/^<doc/i) {
	$current_doc = $_;
	$current_doc =~ s/^.+docid=\"//;
	$current_doc =~ s/\".+//;
	$current_sys = $_;
	$current_sys =~ s/^.+sysid=\"//;
	$current_sys =~s/\".+//;
	#print "DOC[$current_doc] SYS[$current_sys]\n";
    } elsif (/<seg id=/) {
	s/^.*<seg id=\"[0-9]+\">//;
	s/<\/seg>//;
	s/^ //;
	s/ $//;
	#print "SENT($_)\n";
	push(@{$DOCS{$current_sys}{$current_doc}}, $_);
    }
}
close(REF);

### 3- print output
foreach my $id (@ids){
    foreach my $line (@{$DOCS{$sysid}{$id}}){
	print "$line\n";
    }
}
