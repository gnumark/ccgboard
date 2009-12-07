package Network;
use Data::Dumper;
use RPC::XML;
use RPC::XML::Server;
use strict;
use Carp qw( croak );
use warnings;

sub new {
	my $class = shift;
	my $self = {
		_host 	=> shift,
		_port  	=> shift,
		_queue => shift,
		_timeout => shift,
		_path => shift,
	};
	# set the default values if nothing is passed
	$self->{_host} = 'localhost' unless $self->{_host};
	$self->{_port} = '3100' unless $self->{_port};
	$self->{_queue} = '1' unless $self->{_queue};
	$self->{_timeout} = '10' unless $self->{_timeout};
	$self->{_path} = 'rpc/' unless $self->{_path};
	bless $self, $class;
	$self->OpenListener();
	return $self;
}

sub DESTROY {
	my $self = shift;
	$self->CloseListener();	
}

sub OpenListener {
	my ($self) = @_;
	$self->{daemon} = RPC::XML::Server->new(host => $self->{_host}, 
																					port => $self->{_port}, 
																					queue => $self->{_queue}, 
																					timeout => $self->{_timeout});
	die "Could not create RPC daemon: $!\n" unless $self->{daemon};
	$self->LoadMethods();
	$self->{daemon}->server_loop();
	return $self;
}

sub LoadMethods {
	my ($self) = @_;
	print "Adding methods...\n";
	$self->{daemon}->add_method({ 
			name => 'com.cyberdeck.hello',
      signature => ['string'],
      code => sub {return "Hello world!";} });

	warn $self->{daemon}->add_methods_in_dir($self->{_path});
	return 1;
}


sub CloseListener {
	my ($self) = @_;
	print "Closing Server\n";
	kill ('INT', $self->{daemon});
}

1;
