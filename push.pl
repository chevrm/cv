#!/bin/env perl

use strict;
use warnings;

system("git add .");
my $com = undef;
if($ARGV[0]){
	$com = $ARGV[0];
}else{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year += 1900;
	$mon = '0' . $mon if($mon<10);
	$mday = '0' . $mday if($mday<10);
	my $stamp = $year . $mon . $mday;
	$com = "autofired_$stamp";
}
system("git commit -m '$com'");
system("git push -u origin master");
