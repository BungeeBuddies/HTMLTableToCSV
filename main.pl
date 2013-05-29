#!/usr/bin/perl
open(FILE, "<" ,'example.htm');
my $text = join('',<FILE>);
close (FILE);
$text =~ s/\R//g;
$text =~ s/<\/b>/ /g;
$text =~ s/>\s+</></g;
my @array = ();
# foreach my $y (0 ... 15){
# 	foreach my $x (0 .. 6){
# 		push @{ $array[$y]}, $x;
# 	}
# }
my @matches;
my $xCounter = 0;
my $yCounter = 0;
push (@matches, $_) foreach $text =~ m/<tr.*?><td.*?><table.*?><tr><td.*?>.+?<\/td><\/tr><\/table><\/td><\/tr>/g;
for my $match (@matches) {
	# print "$match\n\n";
	$xCounter = 0;
	my @lineMatches;
	push (@lineMatches, $_)foreach ($match =~ m/<td.*?><table.*?><tr><td.*?>.*?<\/td><\/tr><\/table><\/td>/g);
	foreach (@lineMatches){
		while (!($array[$yCounter][$xCounter] eq '')){
			++$xCounter;
		}	
		$_ =~ m/rowspan="([0-9])"/;
		$rowspan = $1 == "td" ? 2 : $1;
		$_ =~ s/<\/?(.*?)>//g;
		for(my $y = $yCounter; $y < ($yCounter+($rowspan/2));++$y)
		{
			$array[$y][$xCounter] = $_;
		}
		++$xCounter;
	}
	++$yCounter;
}
# for(my $row = 0; $row < scalar(@array); $row++) {
# 	for(my $col = 0; $col < scalar(@array[row]); $col++) {
# 		print "$array[$row][$col],";
# 	}
# 	print "\n";
# }
for my $y (0 ... scalar(@array)){
	for my $x (0 ... $#{$array[0]}){
		print "$array[$y][$x],";
	}
	print "\n";
}