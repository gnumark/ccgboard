package Session;

sub new {
	my $class = shift;
	my $self = {
		_username		=> shift,
		_passwd			=> shift,
		_session		=> shift
	};

	if ( $self->{_session} && $self->{_username} ) {
		CDLOG::Log('v', CDSTR::Get('sesscheck'));			
		
	} elsif ( $self->{_username} && $self->{_passwd} ) {

	} else {

	}

	return $self;
}

sub DESTROY {
	my $self = shift;
}

sub Create {

}

sub Delete {

}

sub Check {

}

sub Get {

}

1;
