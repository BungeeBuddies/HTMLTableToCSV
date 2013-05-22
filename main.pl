#!/usr/bin/perl
$file = 'example.htm';
open(MYFILE, $file);
# @parsedFile=();
@data = <MYFILE>;
$counter = 0;
$loops = 1;

open (WRITEFILE, '>>data.txt');
# print WRITEFILE "Bob\n";

foreach (@data){
	# $_ =~ s/\s+//g;
	# $_ =~ s/(?!>$)>/>\n/g;
	# @tempArray = split('\n',$_);

	if ($_ =~ m/<table.*?>/) {
		$counter++;
		print "$loops -> ++: $&\n";
	}

	if ($_ =~ m/<\/table>/) {
		print "$loops -> --: $&\n";
		# print WRITEFILE "\n";
		$counter--;
	}

	$loops++;
	# push(@parsedFile,@tempArray);
	# print("$_\n");
}

print "$counter\n";

$arraySize = @parsedFile;
# print "$arraySize\n";
close (MYFILE); 
close (WRITEFILE);

# <table.*?>.*<font.*?>.*\n.+\n<\/font>