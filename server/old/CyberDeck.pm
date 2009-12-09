# Copyright (C) 2003 Pierluigi Maori 
# aka Robert J. Newmark <newmark@kyuzz.org>
#
# This code is licensed under the terms of the GNU General Public License (GNU GPL)
#

=head1 NAME

CyberDeck

=head1 NOTES

CyberDeck obj for cyberdeck

=head1 INSTANCE VARIABLES

=over 4

=back

=cut
#BEGIN { unshift(@INC, '../lib') }


package CyberDeck;

# Make sure we find our stuff
use strict;
use Const;
use Data::Dumper;
use Database;
use CGI; # for escapes

our $DEBUG = 1;

#our @ISA = qw(Service);

=head1 SERVICE API METHODS

=over 4

=item * B<new> ($DB)

	This create a new Card object

=cut

sub new {
        my $class = shift;
        my $Self = {};
        bless ($Self,$class);
        $Self->_initialise(@_);
}

=item * B<_initialise>  ($DB);  

	This method initialise the object
 
=cut

sub _initialise {
  my ($Self,$DB,$id) = @_;
	# Open and print first information in log file and display
	open (S_DISP,'-');
	open (S_LOG,$Const::SERVER_LOGFILE);
	open (S_ACC,$Const::SERVER_ACCESS);
	print S_DISP "
$Const::SYSTEM_NAME - $Const::SYSTEM_CODENAME
Server Started at ".time($Self->{StartTime})."

Waiting for connection...

";
	print S_LOG "Starting Logging at ".time($Self->{StartTime};
	print S_LOG "Starting Logging at ".time($Self->{StartTime};

	# Load Database and needed stuff
	$Self->{DB} = $DB;

	# Create the listening Socket
	
  return $Self;
}


1;
