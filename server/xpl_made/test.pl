
#	print "Adding com.cyberdeck.getCelsius...\n";
#	my @sig = ('double', 'double double');
#	$self->{daemon}->add_method({ name => 'com.cyberdeck.getCelsius',
#      signature => \@sig, code => \&getCelsius });
#
#	print "Adding com.cyberdeck.getInfo...\n";
#	$self->{daemon}->add_method({ name => 'com.cyberdeck.getInfo',
#      signature => ['array'], code => \&getInfo });




sub getCelsius {
   my $s = shift; # The first parameter is the server object
   my $f = shift; 
   $f = 0.0 unless $f; 
   print "getCelsius called with ".$f."...\n";
   return ($f-32.0)/1.8;
}
#
sub getInfo {
   my @info = ("Author","Herong Yang", "Version", "2005");
   print "getInfo called with ...\n";
   return \@info;
}

