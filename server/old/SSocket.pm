# Copyright (C) 2003 Pierluigi Maori 
# aka Robert J. Newmark <newmark@kyuzz.org>
#
# This code is licensed under the terms of the GNU General Public License (GNU GPL)
#

=head1 NAME

Network

=head1 NOTES

Network obj for cyberdeck

=head1 INSTANCE VARIABLES

=over 4

=back

=cut
#BEGIN { unshift(@INC, '../lib') }


package Network;

# Make sure we find our stuff
use strict;
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
  # init services parent
	#$Self->SUPER::_initialise(@bw);
	$Self->{DB} = $DB;
	# Create the socket
	$Self->{proto} = getprotobyname('tcp');	
  socket(Socket_Handle, PF_INET, SOCK_STREAM, $Self->{proto});
  $Self->{port} = $Const::SERVER_PORT;
  unlink('/tmp/usock');
  $sun = sockaddr_un('/tmp/usock');
  connect(Socket_Handle,$sun);
	$Self->{Socket} = Socket_Handle;
  return $Self;
}


1;
