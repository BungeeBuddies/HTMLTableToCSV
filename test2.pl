#!/usr/bin/perl

use strict;
use warnings;

# open(FILE, "<", "tmpfile");
# my @values = <FILE>;
# close(FILE);

open(FILE, "<" ,'example.htm');

my $text = join('', <FILE>);
chomp($text);


my @array = <FILE>;
close (FILE);

open (WRITEFILE, ">>", "data.csv");
# print WRITEFILE "Bob\n";

# Remove break lines
$text =~ s/\R//g;
# print $text;

# my @matches = $text =~ /<table.*?>.*?<\/table>/g;
# my $previous = 0;
# my $TDs = 0;
# my $TRs = 0;
# my $Tables = 0;
# my $lineNumber = 1;
# my $nextMatch = 0;

# for my $match (@array) {

# 	$match =~ s/\R//g;

# 	if (my $n =()= ($match =~ m/(<table.*?>)/)) {
# 		$Tables += $n;
# 	}

# 	if (my $n =()= ($match =~ m/<\/table>/)) {
# 		$Tables -= $n;
# 	}

# 	if (my $n =()= ($match =~ m/(<tr.*?>)/)) {
# 		$TRs += $n;
# 	}

# 	if (my $n =()= ($match =~ m/<\/tr>/)) {
# 		$TRs -= $n;
# 	}

# 	if (my $n =()= ($match =~ m/<td.*?>/g)) {
# 		$TDs += $n;
# 	}

# 	if (my $n =()= ($match =~ m/<\/td>/g)) {
# 		$TDs -= $n;
# 	}

# 	print "$TRs\n";

# 	if ($TRs <= 1 && $previous =~ m/<td.*?<font.*?>/) {
# 		# $match =~ s/<.*?>//g;
# 		print "$previous\n";
# 		print WRITEFILE "$match, ";
# 	}

# 	if ($Tables <= 1 && $previous =~ m/<tr.*?>/) {
# 		# $match =~ s/<.*?>//g;
# 		print WRITEFILE "\n";
# 	}

# 	# if ($nextMatch) {
# 	# 	print WRITEFILE "$match";
# 	# 	$nextMatch = 0;
# 	# }

# 	# if ($match =~ m/<\/td/g) {
# 	# 	print WRITEFILE ",";
# 	# }

# 	# if ($match =~ m/<td.*?<font.*?>/) {
# 	# 	$nextMatch = 1;
# 	# }

# 	# if ($TDs == 1 && $match =~ m/<\/tr/g) {
# 	# 	print WRITEFILE "\n";
# 	# }

# 	# if ($match =~ m/(<\/font>)/g) {
# 	# 	# $match = $1;
# 	# 	# print "$1\n";
# 	# 	$previous =~ s/<(|\/)b>//g;
# 	# 	print WRITEFILE "$previous, ";

# 	# 	if ($previous =~ m/<b>/g) {
# 	# 		print WRITEFILE ", ";
# 	# 	}
# 	# }

# 	# if ($match =~ m/<\/table>/g) {
# 	# 	print WRITEFILE ", ";
# 	# }


# 	# if ($match =~ m/<td rowspan="2" align="center" nowrap="1">/g) {
# 	# 	print WRITEFILE "\n";
# 	# }

# 	# print "Line number: $lineNumber\n";
# 	# print "$nr\n";
# 	# print "Number of TDs open: $TDs\n";
# 	$previous = $match;
# 	$lineNumber++;
# }

# Print every match
# print "$_\n\n" foreach @array;

# print "TDs: $TDs\n";
# print "TRs: $TRs\n";
# print "Tables: $Tables\n";

# m/<tr.*?<td.*?/td>.*?/tr>/g for each 

# my @matches = { $text =~ /<tr.*?<td.*?>(.*?)<\/td>.*?\/tr>/g};
my @matches;

push (@matches, $_) foreach $text =~  m/<tr.*?<td.*?>(.*?)<\/td>.*?\/tr>/g;

my $lineBreak = 0;
for my $match (@matches) {
	# $match =~ s/<.*?>//g;
	print "$match\n";

	my $cleanMatch = $match;
	$cleanMatch =~ s/<.*?>//g;
	# $cleanMatch =~ s/\s//g;

	print WRITEFILE "$cleanMatch";
	# print WRITEFILE $match =~ s/<.*?>//g;

	if ($cleanMatch eq '') {
		if ($lineBreak == 0) {
			print WRITEFILE "\n";
		}
		$lineBreak = 1;
	}
	else {
		$lineBreak = 0;
	}


	if ($match =~ m/<\/font>/g) {
		print WRITEFILE ", ";
	}
}

close (WRITEFILE); 
# m/<font.*?>(.*?)<\/font>/g
# (?<=<font size="\d" face="Arial">\n)(|\t)(|<b>)[\w\(\)\s,.\-:]+(|<\/b>)(?=\n<\/font>)