#!/usr/bin/perl
open ($file, "<" ,'example.htm');
my $text = join('', <$file>);
close ($file);

chomp($text);

# Remove break lines
$text =~ s/\R//g;

# my @matches = $text =~ m/<table.*?>.*?(?=<\/font>)<font.*?>.*?<\/font>.*?<\/table>/g;

my @matches = $text =~ m/<table.*?>.*?<\/table>/g;

# {<font.*?>.*?<\/font>}g foreach @matches;


# print @matches;

# print $text;

# my @matches = $text =~ /(?<=<font size="\d" face="Arial">\r\n).+(?=\r\n<\/font>)/g;

# Remove tabs
# s{^\s+|\s+$}{}g foreach @matches;
# s{^<(|\/)b>|\s+$}{}g foreach @matches;

# print @matches
print "$_\n\n" foreach @matches;


# (?<=<font size="\d" face="Arial">\n)(|\t)(|<b>)[\w\(\)\s,.\-:]+(|<\/b>)(?=\n<\/font>)