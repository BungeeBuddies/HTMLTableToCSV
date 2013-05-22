#!/usr/bin/perl
$inputFile = 'example.htm';
open(MYFILE,$inputFile);
@parsedFile=();
while(<MYFILE>){
	$_ =~ s/\r\n//g; #strip out all newlines
	$_ =~ s/(?!>$)>/>\n/g;	#place a newline after each closing tag, except when its the last character on a line
	@tempArray = split('\n',$_);
	push(@parsedFile,@tempArray);
 }
 close (MYFILE); 
 $arraySize = @parsedFile;
 @firstIteration=();
 foreach(@parsedFile) {
 	$_ =~ s/^[ \t]+//g; #remove every space on the beginning of a line
 }

foreach(@parsedFile){
	print "$_\n"
}

 print "$arraySize\n";
>>>>>>> ac56f6e1b1b3e902a2c87bf99b2f40b149817e33
