# Copyright (C) 2003 Pierluigi Maori 
# aka Robert J. Newmark <newmark@kyuzz.org>
#
# This code is licensed under the terms of the GNU General Public License (GNU GPL)
#

=head1 NAME

Card

=head1 NOTES

Card obj for cyberdeck

=head1 INSTANCE VARIABLES

=over 4

=back

=cut
#BEGIN { unshift(@INC, '../lib') }


package Card;

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
	$Self->{data} = $Self->_load_card($id) if ($id); 
  return $Self;
}

sub _load_card {
  my ($Self,$id) = @_;
	my $data = $Self->{DB}->GetRecord('cards','id',$id);	
	unless $data {
		warn "(EEE) Card with id '$id' not loaded, Database error\n";
		return undef;
	}
	return $data;
}

sub get_name {
	my $Self = shift;
	return $Self->{data}->{name};
}

sub get_type {
	my $Self = shift;
	return $Self->{data}->{type};
}

sub get_faction {
	my $Self = shift;
	return $Self->{data}->{faction};
}

sub get_prod {
	my $Self = shift;
	return $Self->{data}->{prod};
}

sub get_mconn {
	my $Self = shift;
	return $Self->{data}->{mconn};
}

sub get_Mconn {
	my $Self = shift;
	return $Self->{data}->{Mconn};
}

sub get_def {
	my $Self = shift;
	return $Self->{data}->{def};
}

sub get_att {
	my $Self = shift;
	return $Self->{data}->{att};
}

sub get_mem {
	my $Self = shift;
	return $Self->{data}->{mem};
}

sub get_slot {
	my $Self = shift;
	return $Self->{data}->{slot};
}

sub get_bonus {
	my $Self = shift;
	return $Self->{data}->{bonus};
}

sub get_AP {
	my $Self = shift;
	return $Self->{data}->{AP};
}

sub get_data {
	my $Self = shift;
	return $Self->{data}->{data};
}

sub get_cost {
	my $Self = shift;
	return $Self->{data}->{cost};
}

sub get_img {
	my $Self = shift;
	return $Self->{data}->{img};
}
	
sub get_img_card {
	my $Self = shift;
	return $Self->{data}->{img_card};
}

1;
