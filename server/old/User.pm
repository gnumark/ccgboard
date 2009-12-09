# Copyright (C) 2003 Pierluigi Maori 
# aka Robert J. Newmark <newmark@kyuzz.org>
#
# This code is licensed under the terms of the GNU General Public License (GNU GPL)
#

=head1 NAME

User

=head1 NOTES

User obj for cyberdeck

=head1 INSTANCE VARIABLES

=over 4

=back

=cut
#BEGIN { unshift(@INC, '../lib') }


package User;

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
  return $Self;
}


1;
