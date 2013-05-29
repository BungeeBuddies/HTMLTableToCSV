#!/usr/bin/perl

use strict;
use warnings;

open(READFILE, "<" ,'example.htm');

my $text = join('', <READFILE>);
chomp($text);

close (READFILE);

open (WRITEFILE, ">>", "data.csv");

# Remove break lines
$text =~ s/\R//g;

my @matches;

# Add each main table row to an array
push (@matches, $_) foreach $text =~  m/<tr.*?><td.*?><table.*?><tr><td.*?>.+?<\/td><\/tr><\/table><\/td><\/tr>/g;

my $lineBreak = 0;
for my $match (@matches) {
	# $match =~ s/<.*?>//g;
	# print "$match\n\n";

	# 
	if ($match =~ m/<table.*?><tr><td.*?>(.*?)<\/td><\/tr><\/table>/g) {
		# if (!$1 eq '') {
			$match =~ s/<\/?(.*?)>//g;
			print "$match\n\n"; 
			
		# }
	}

}

close (WRITEFILE);

# m/<font.*?>(.*?)<\/font>/g
# (?<=<font size="\d" face="Arial">\n)(|\t)(|<b>)[\w\(\)\s,.\-:]+(|<\/b>)(?=\n<\/font>)
# <table.*?><tr><td.*?>.+?<\/td><\/tr><\/table>