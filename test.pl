#!/usr/bin/perl

use strict;
use warnings;

# open(FILE, "<", "tmpfile");
# my @values = <FILE>;
# close(FILE);

open(FILE, "<" ,'example.htm');

# my $text = join('', <FILE>);
# chomp($text);

my @array = <FILE>;
close (FILE);

open (WRITEFILE, ">>", "data.csv");
# print WRITEFILE "Bob\n";

# Remove break lines
# $text =~ s/\R//g;

# my @matches = $text =~ /<table.*?>.*?<\/table>/g;
my $previous;
for my $match (@array) {
	$match =~ s/\R//g;

	if ($match =~ m/(<\/font>)/g) {
		# $match = $1;
		# print "$1\n";
		$previous =~ s/<(|\/)b>//g;
		print WRITEFILE "$previous, ";

		if ($previous =~ m/<b>/g) {
			print WRITEFILE ", ";
		}
	}

	if ($match =~ m/<\/table>/g) {
		print WRITEFILE ", ";
	}

	if ($match =~ m/<td rowspan="2" align="center" nowrap="1">/g) {
		print WRITEFILE "\n";
	}
	$previous = $match;
}

# Print every match
# print "$_\n\n" foreach @array;

close (WRITEFILE); 
# m/<font.*?>(.*?)<\/font>/g
# (?<=<font size="\d" face="Arial">\n)(|\t)(|<b>)[\w\(\)\s,.\-:]+(|<\/b>)(?=\n<\/font>)