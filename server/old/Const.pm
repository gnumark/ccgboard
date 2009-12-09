# -*- tab-width: 4 -*-
# ex: set tabstop=4:

# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc.,
# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

=head1 NAME Const

=head1 DESCRIPTION

Constants for a CyberDeck Server 


=over 4

=cut

package Const;

#simple die..
sub cdie {
    my $what = shift;
    die 'Please set ' . $what . ' Const' unless (eval 'defined $what');
}


#############################################################################
# We put system-dependent stuff at the beginning.
#############################################################################

=item * $Const::SYSTEM_NAME - The name displayed to the user, 

=cut

$Const::SYSTEM_NAME||="CyberDeck Server";

=item * B<$Const::SYSTEM_CODENAME> - The System release, or whatever we want dis
played as subtitle on the login oage

=cut

$Const::SYSTEM_CODENAME="Release 0.1";


$Const::SERVER_LOGFILE = "/var/log/cyberdeck.log";
$Const::SERVER_ACCESS = "/var/log/cyberdeck.acc";

$Const::SERVER_PORT = "31337";
$Const::SERVER_CONN = '10'; #Number of active connection

$Const::CDUSER||='nobody';
$Const::CDUSER_ID||=99;
$Const::CDUSER_GID||=99;

$Const::DATABASE_HOST||='localhost';    # - Host with database server, often localhost

$Const::DATABASE_NAME ||='cd';   # - Usually cd

$Const::DATABASE_USER ||='root';   # - The database user used to connect to MySQL. Avoid "root"

$Const::DATABASE_PASSWORD ||='';   # - The database user used to connect to MySQL. Avoid "root"



1;


