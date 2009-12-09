# Copyright (C) 2003 Pierluigi Maori 
# aka Robert J. Newmark <newmark@kyuzz.org>
#
# This code is licensed under the terms of the GNU General Public License (GNU GPL)
#

=head1 NAME

Deck

=head1 NOTES

Deck obj for cyberdeck

=head1 INSTANCE VARIABLES

=over 4

=back

=cut
#BEGIN { unshift(@INC, '../lib') }


package Deck;

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

	This create a new Deck object

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
	$Self->{data} = $Self->_load_deck($id) if $id;
  return $Self;
}

sub _load_deck {
  my ($Self,$id) = @_;
		my $data = $Self->{DB}->GetRecord('deck','id',$id);	
	unless $data {
		warn "(EEE) Card with id '$id' not loaded, Database error\n";
		return undef;
	}
	return $data;
}

sub shuffle {

}

sub get_tcard {

}

sub put_tcard {

}

sub view_tcard {

}

sub add_card {

}

sub del_card {

}

sub save_deck {

}




1;
