#!/usr/bin/perl -w
use Data::Dumper;
require RPC::XML;
require RPC::XML::Client;
use XML::DOM;

my $parser = new XML::DOM::Parser;
$cli = RPC::XML::Client->new('http://localhost:3100/RPCSERV');
#print ref $resp ? join("\n", @{$resp->value}) : "Error: $resp";

while (1) {
	print "\n
List of Possible commands:

register
login
logout
inspect
quit

--------------------------
>";
	$input = <STDIN>;
	chomp $input;
	print "\n\nCommand passed --> $input\n";
	&command_parse($input);
}
					

sub command_parse {
	my $cmd = shift;
	my $res;
	
	if ($cmd=~/^login$/) {
		print "Enter username:";
		$res = <STDIN>;
		chomp $res;
		my $username = $res;
		print "Enter password:";
		$res = <STDIN>;
		chomp $res;
		my $password = $res;
		print "\n---> Entered\nusername: '$username'\npassword: '$password'\n";
   	$respa = $cli->send_request('com.cyberdeck.login',$username,$password);
		$stringa = $respa->as_string();
 		my $doc = $parser->parse($stringa);
		$session = $doc->getElementsByTagName('session');
		$status = $doc->getElementsByTagName('status');
		$rname = $doc->getElementsByTagName('realname');
		$email = $doc->getElementsByTagName('email');
		print "\nResponse: status     -> $status \n";
		print "\nResponse: session id -> $session \n";
		print "\nResponse: realname   -> $rname \n";
		print "\nResponse: email      -> $email \n";

	} elsif ($cmd=~/^logout$/) {

	} elsif ($cmd=~/^register$/) {
		$resp=0;
		while ($resp == 0) {
			print "Enter username:";
			$res = <STDIN>;
			chomp $res;
			my $username = $res;
			print "Enter password:";
			$res = <STDIN>;
			chomp $res;
			my $password = $res;
			print "\n---> Entered\nusername: '$username'\npassword: '$password'\n";
 	  	$respa = $cli->send_request('com.cyberdeck.checklogin',$username);
			$stringa = $respa->as_string();
 			my $doc = $parser->parse($stringa);
			$resp = $doc->getElementsByTagName('response');
			if ($resp == 0) {print "\nUsername $username already in use, please choose another\n";}
		}
		print "Enter realname:";	
		$res = <STDIN>;
		chomp $res;
		my $realname = $res;
		print "Enter email:";
		$res = <STDIN>;
		chomp $res;
		my $email = $res;
 	 	$respa = $cli->send_request('com.cyberdeck.register',$username,$password,$realname,$email);
		$stringa = $respa->as_string();
 		$doc = $parser->parse($stringa);
		$resp = $doc->getElementsByTagName('response');
		if ($resp == 0) {
			print "\nSomething wrong in your registration, please try again:\nHere there are the data you submitted\nusername $username\npassword $password\nrealname $realname\nemail $email\n\n";
		} else {
			print "\nRegistration successfully executed, please login:\nHere there are the data you submitted\nusername $username\npassword $password\nrealname $realname\nemail $email\n\n";
		}
	} elsif ($cmd=~/^inspect$/) {
		my $resp = $cli->send_request('system.listMethods');
		$gg = $resp->value();	
		foreach (@$gg) {
			my $tmp=$_;
			print "\n--->Got $tmp\n\n";
    	$respa = $cli->send_request($tmp);
			$stringa = $respa->as_string();
			print "----->$stringa\n"; 
		}

	} elsif ($cmd=~/^quit$/) {
		exit 0;
	} else {
		print "Unimplemented command: $cmd \n";
	}
}
