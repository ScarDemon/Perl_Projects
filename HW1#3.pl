#3 HW1


while(<STDIN>) 
{
		chomp($_); 
	if ($_ =~/^.[A-Z]+$/) #between 1 and 7 of any character
	{
	print "$_\n";	
	}
}

