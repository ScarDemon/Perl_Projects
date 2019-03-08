
use WWW::Mechanize;

# Create a new mechanize object
my $mech = WWW::Mechanize->new();
my $url = 'https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx';
$mech->get($url);
my $news = $mech->content;

sub commend{
	# Using a Perl "heredoc":
	$messageC  = <<"END_MSG";
	
Usage: perl -w wa_timetable.pl <option>
	where <option> is one of the following:
		
		Term         : which Term (semester) the class is in, e.g. "19/SP - 2019 Spring"
		Subject      : which Subject the class is in, e.g. English
		-help        : display a help screen and sample usage
		-terms       : list all currently available Terms
		-subjects    : list all currently available Subjects
		
END_MSG
print $messageC;
}

sub help{
	$messageH  = <<"END_MSG";
	
Usage: 
	perl -w wa_timetable.pl "19/SP - 2019 Spring" "ENGLISH (EN)"
END_MSG
	


	print $messageH;
}
my @terms = $news =~ /<option value="[1-9]{2}[A-Z]{0,1}[1-9]{0,1}\/[A-Z]{2}">(.+)<\/option>/g;

sub printTerms{
	foreach my $h1 (@terms) {
	print "$h1\n";
	}
	
}


@projects = $news =~ /<option value="[A-Z]{2,3}">(.+)\)<\/option>/g;
sub printProjects{
	foreach my $h1 (@projects) {
		print "$h1)\n";
		
	}

}


$numargs = $#ARGV+1;
if ($numargs == 2){
	#Select the term;
	my $term = $ARGV[0];
	my $subject = $ARGV[1];
$mech -> field("_ctl0:MainContent:ddlTerm",$term);

$mech -> field("_ctl0:MainContent:ddlSubj_1",$subject);
#Click teg Submit Button.
$mech -> click_button(name =>"_ctl0:MainContent:btnSubmit");

#Get resulting html from clicking Submit.
my $page = $mech->content();

print $page;

}else{
	my $act = $ARGV[0];
	if($act =~ /-t/){
		printTerms();
	}
	elsif($act =~ /-s/){
		printProjects();
	}
	elsif($act=~ /-h/){
		help();
	}
	else{
		commend();
	}
}


