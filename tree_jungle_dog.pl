#!/usr/bin/perl
# Foodie Fest

# Variables
our $name;
our $date;
our $location;

# Subroutines
sub create_event {
	print "What is the name of your event?\n";
	$name=<STDIN>;
	chomp $name;
	
	print "What is the date of your event?\n";
	$date=<STDIN>;
	chomp $date;
	
	print "What is the location of your event?\n";
	$location=<STDIN>;
	chomp $location;
	
	# Create the event
	open FEST, "> ./Foodie_Fest.txt" or die $!;
	print FEST "$name\n$date\n$location\n";
	close FEST;
	
	print "Your event has been created!\n";
}

sub register_attendees {
	my $attendees;
	
	open FEST, "< ./Foodie_Fest.txt" or die $!;
	$name=<FEST>;
	$date=<FEST>;
	$location=<FEST>;
	
	print "Enter the name of the attendee (exit to quit):\n";
	$attendees=<STDIN>;
	while ($attendees ne "exit\n") {
		chomp $attendees;
		print FEST "$attendees\n";
		print "Enter the name of the attendee (exit to quit): \n";
		$attendees=<STDIN>;
	}
	close FEST;
	
	print "Attendees had been registered successfully!\n";
	
}

sub list_attendees {
	my $name;
	my $date;
	my $location;
	my $attendee;
	
	open FEST, "< ./Foodie_Fest.txt" or die $!;
	$name=<FEST>;
	$date=<FEST>;
	$location=<FEST>;
	
	print "The list of attendees is: \n";
	$attendee=<FEST>;
	while ($attendee ne "") {
		chomp $attendee;
		print "$attendee\n";
		$attendee=<FEST>;
	}
	
	close FEST;
}

sub delete_event {
	unlink("Foodie_Fest.txt") or die "Cannot unlink file: $!"; 
	
	print "Event has been deleted...\n";
}

# Main Program
print "Welcome to Foodie Fest!\n";
print "Please enter an option:\n\n";
print "    1. Create event\n";
print "    2. Register attendees\n";
print "    3. List attendees\n";
print "    4. Delete event\n\n";

$option=<STDIN>;

if ($option == 1) {
	create_event();
} elsif ($option == 2) {
	register_attendees();
} elsif ($option == 3) {
	list_attendees();
} elsif ($option == 4) {
	delete_event();
} else {
	print "Invalid Option\n";
}

print "Exiting Foodie Fest...\n";