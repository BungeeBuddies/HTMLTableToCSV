#!/usr/bin/perl
open(FILE, "<" ,'example.htm');
my $text = join('',<FILE>);
close (FILE);
chomp($text);
$text =~ s/\R//g;
$text =~ s/<\/b>/ /g;
$text =~ s/>\s+</></g;
my @matches;
push (@matches, $_) foreach $text =~ m/<tr.*?><td.*?><table.*?><tr><td.*?>.+?<\/td><\/tr><\/table><\/td><\/tr>/g;
for my $match (@matches) {
	# print "$match\n\n";

	my @lineMatches;
	push (@lineMatches, $_)foreach ($match =~ m/<table.*?><tr><td.*?>(.*?)<\/td><\/tr><\/table>/g);
	foreach (@lineMatches){
		$_ =~ s/<\/?(.*?)>//g;		
		if (++$counter == scalar(@lineMatches)){
			print "$_";
		} else {
			print "$_,";
		}
	}
	print "\n";
}
