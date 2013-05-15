#!/usr/bin/perl
$file = 'c00128.htm';
open(MYFILE,$file);
while(<MYFILE>){
	chomp;
	$_ =~ s/(?!>$)>/>\n/g;
	print "$_\n"
 }
 close (MYFILE); 
