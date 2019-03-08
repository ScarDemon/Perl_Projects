#testquiz.pl
#use strict;
#while(<STDIN>) {
#if ($_ =~/["Alpaugh"], @[a-z0-9.-]+\s+/) #between 1 and 7 of any character
#	{
#	print "$_\n";	
#	}
#
	$student = "Alpaugh, Weldon, s0396012\@monmouth.edu";
    my ($last, $first, $email) = split (/\s+/, $student);
	
	($last) = split (/,/, $student);
	print ($last, $first, $email);
	
