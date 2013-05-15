#!/usr/bin/perl
$file = 'example.htm';
open(MYFILE,$file);
@parsedFile=();
while(<MYFILE>){
	$_ =~ s/\s+//g;
	$_ =~ s/(?!>$)>/>\n/g;
	@tempArray = split('\n',$_);
	push(@parsedFile,@tempArray);
	print("$_\n");
 }
 $arraySize = @parsedFile;
 print "$arraySize\n";
 close (MYFILE); 
