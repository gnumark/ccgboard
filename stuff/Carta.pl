#!/usr/bin/perl -w
#
#
#

use Data::Dumper;
use CGI  qw/:standard/;

# type (Node, Hacker, Chip, Event, Smartcard)
# ad (attacco difesa 
my $card_hash = {
	type 	=> undef,
	name	=> undef,
	Nd		=> 4.0,
	Ncm		=> 1.6,
	NcM		=> 3.29,
	Nc		=> 3.91,
	Np		=> 4.63,
	Nm		=> 3.91,
	Cb		=> 1.93,
	Hd		=> 1.41,
	Ha		=> 1.41,
	Hc		=> 6.21,
	Pc		=> 5.18,
	Pm		=> 2.10,
	Pa		=> 1.89,
	Pd		=> 1.89,
	Hac		=> 3.29,
	Hap		=> 4.29,
	Ec		=> 5.4,
	Sc		=> 6.21
};


sub calc_val {
	my ($hash,$cnt) = @_;
#	return 1;
	my $VC = 0;
	my $o;
#	warn Dumper $hash;
	foreach (keys %{$hash}) {
		$o.= "$_ == $hash->{$_} MEDIO $card_hash->{$_} <BR> ";
		#warn $o;
		next if (($hash->{$_} eq 'NO' || $card_hash->{$_} == 0) );
		$VC+= ($hash->{$_}/$card_hash->{$_});
	}
	return (Dumper $hash).$o.($VC/$cnt);
}


my $header = CGI->header()."<HTML><TITLE>CyberDeck Generator</TITLE><BODY>\n
";

my $footer = "<INPUT TYPE=SUBMIT VALUE=CLICK></FORM></BODY></HTML>";

my $out;

if (!param('command')) {

	$out = "<H1>Card Generator</H1><BR><p>
	<FORM name=genera method=post action=Carta.pl >
	<INPUT TYPE=HIDDEN name=command value='type'>
	<SELECT name='type' >
		<OPTION NAME='Node'>Node</OPTION>
		<OPTION NAME='Hacker'>Hacker</OPTION>
		<OPTION NAME='Chip'>Chip</OPTION>
		<OPTION NAME='Smartcard'>Smartcard</OPTION>
		<OPTION NAME='Events'>Events</OPTION>
	</SELECT>
	";

} elsif (param('command') eq 'type') {
	my $type = param('type');
	$out = "<H1>Card Generator</H1><BR><p>
	<FORM name=genera method=post action=Carta.pl >
	<INPUT TYPE=HIDDEN name=command value='desc'>
	<INPUT TYPE=HIDDEN name=type value='$type'>
	<p>
	<TABLE>
	<tr><td>Type :</td><td>$type</td></tr>
	<tr><td>Name :</td><td><INPUT TYPE=TEXT NAME='name' width=40></td></tr>
	<tr><td>Faction :</td><td>
	<SELECT name='faction' >
		<OPTION NAME='General'>General</OPTION>
		<OPTION NAME='Corporate'>Corporate</OPTION>
		<OPTION NAME='Underground'>Underground</OPTION>
		<OPTION NAME='Mafia'>Mafia</OPTION>
		<OPTION NAME='Yakuza'>Yakuza</OPTION>
	</SELECT>
	</td></tr>
	<tr><td>Bonus :</td><td>
	<SELECT name='Cb' >
		<OPTION NAME='0'>0</option>
		<OPTION NAME='1'>1</option>
		<OPTION NAME='2'>2</option>
		<OPTION NAME='3'>3</option>
		<OPTION NAME='4'>4</option>
		<OPTION NAME='5'>5</option>
		<OPTION NAME='6'>6</option>
		<OPTION NAME='7'>7</option>
		<OPTION NAME='8'>8</option>
		<OPTION NAME='9'>9</option>
		<OPTION NAME='10'>10</option>
	</SELECT>
	<textarea ROWS=5 COLS=40 name='bonus_desc'></TEXTAREA>
	</td></tr>
	
	";
	if (param('type') eq 'Node') {
		my $i =0;
		
		$out.="<TR><TD>Node connection Max</TD><td>
		<select name='NcM'>
		";
		for ($i = 1; $i < 6 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	
		$out.="<TR><TD>Node connection Min</TD><td>
		<select name='Ncm'>
		";
		for ($i = 1; $i < 4 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
		
		$out.="<TR><TD>Node Chip Slot</TD><td>
		<select name='Nc'>
		";
		for ($i = 1; $i < 8 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
			
		$out.="<TR><TD>Node Defense </TD><td>
		<select name='Nd'>
		";
		for ($i = 0; $i < 8 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
			
		$out.="<TR><TD>Node Memory</TD><td>
		<select name='Nm'>
		";
		for ($i = 1; $i < 8 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
			
		$out.="<TR><TD>Node Production</TD><td>
		<select name='Np'>
		";
		for ($i = 0; $i < 10 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
		
		$out.="</table><INPUT TYPE=HIDDEN NAME=cnt VALUE=7>";
		
	} elsif (param('type') eq 'Hacker') {
		my $i =0;

		$out.="<TR><TD>Hacker Attack </TD><td>
		<select name='Ha'>
		";
		for ($i = 0; $i < 6 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	
		$out.="<TR><TD>Hacker Defense </TD><td>
		<select name='Hd'>
		";
		for ($i = 0; $i < 6 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	

		$out.="<TR><TD>Hacker Cost </TD><td>
		<select name='Hc'>
		";
		for ($i = 0; $i < 16 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
		
		$out.="<TR><TD>Hacker Action Point </TD><td>
		<select name='Hap'>
		";
		for ($i = 1; $i < 10 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
			
		$out.="</table><INPUT TYPE=HIDDEN NAME=cnt VALUE=5>";
		
	} elsif (param('type') eq 'Chip') {
		my $i =0;

		$out.="<TR><TD>Chip Memory </TD><td>
		<select name='Pm'>
		";
		for ($i = 1; $i < 5 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	
		$out.="<TR><TD>Chip Attack  </TD><td>
		<select name='Pa'>
		";
		for ($i = 0; $i < 4 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	

		$out.="<TR><TD>Chip Defense </TD><td>
		<select name='Pd'>
		";
		for ($i = 0; $i < 4 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
		
		$out.="<TR><TD>Program Cost </TD><td>
		<select name='Pc'>
		";
		for ($i = 0; $i < 16 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
			
		$out.="</table><INPUT TYPE=HIDDEN NAME=cnt VALUE=5>";
		
	} elsif (param('type') eq 'Smartcard') {
		my $i =0;

		$out.="<TR><TD>Smartcard Cost </TD><td>
		<select name='Sc'>
		";
		for ($i = 0; $i < 16 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	
		$out.="</table><INPUT TYPE=HIDDEN NAME=cnt VALUE=2>";
	
	} elsif (param('type') eq 'Events') {

		$out.="<TR><TD>Events Cost </TD><td>
		<select name='Ec'>
		";
		for ($i = 0; $i < 16 ; $i++ ) {
			$out.= "<option name='$i'>$i</option>\n";
		}
		$out.="</select></TD></tr>";
	
		$out.="</table><INPUT TYPE=HIDDEN NAME=cnt VALUE=2>";
	

	} else {

	}
} elsif (param('command') eq 'desc') {
	my $hash =	{
		'Cb' => ( param('Cb')?param('Cb'):'NO'),
		'NcM' =>( param('NcM')?param('NcM'):'NO'),
		'Ncm' =>( param('Ncm')? - param('Ncm'):'NO'),
		'Nd' => ( param('Nd')?param('Nd'):'NO'),
		'Nc' => ( param('Nc')?param('Nc'):'NO'),
		'Np' => ( param('Np')?param('Np'):'NO'),
		'Nm' => ( param('Nm')?param('Nm'):'NO'),
		'Ha' => ( param('Ha')?param('Ha'):'NO'),
		'Hd' => ( param('Hd')?param('Hd'):'NO'),
		'Hc' => ( param('Hc')? - param('Hc'):'NO'),
		'Hap' =>( param('Hap')?param('Hap'):'NO'),
		'Pa' => ( param('Pa')?param('Pa'):'NO'),
		'Pc' => ( param('Pc')? - param('Pc'):'NO'),
		'Pd' => ( param('Pd')?param('Pd'):'NO'),
		'Pm' => ( param('Pm')?param('Pm'):'NO'),
		'Sc' => ( param('Sc')? - param('Sc'):'NO'),
		'Ec' => ( param('Ec')? - param('Ec'):'NO')
	};
	warn Dumper $hash;
	$out.="<BR>
	<table>
	<tr><td>Name</td><td>".param('name')."</td></tr>
	<tr><td>Faction</td><td>".param('faction')."</td></tr>
	<tr><td>Bonus</td><td>".param('Cb')."</td></tr>
	<tr><td>Bonus desc</td><td>".param('bonus_desc')."</td></tr>
	<tr><td>NcM</td><td>".param('NcM')."</td></tr>
	<tr><td>Ncm</td><td>".param('Ncm')."</td></tr>
	<tr><td>Nd</td><td>".param('Nd')."</td></tr>
	<tr><td>Nc</td><td>".param('Nc')."</td></tr>
	<tr><td>Np</td><td>".param('Np')."</td></tr>
	<tr><td>Nm</td><td>".param('Nm')."</td></tr>
	<tr><td>Ha</td><td>".param('Ha')."</td></tr>
	<tr><td>Hd</td><td>".param('Hd')."</td></tr>
	<tr><td>Hc</td><td>".param('Hc')."</td></tr>
	<tr><td>Hac</td><td>".param('Hac')."</td></tr>
	<tr><td>Hap</td><td>".param('Hap')."</td></tr>
	<tr><td>Pa</td><td>".param('Pa')."</td></tr>
	<tr><td>Pd</td><td>".param('Pd')."</td></tr>
	<tr><td>Pc</td><td>".param('Pc')."</td></tr>
	<tr><td>Pm</td><td>".param('Pm')."</td></tr>
	<tr><td>Sc</td><td>".param('Sc')."</td></tr>
	<tr><td>Ec</td><td>".param('Ec')."</td></tr>
	<tr><td>CNT</td><td>".param('cnt')."</td></tr>

	
	<tr><td><b>CARD VALUE</b></td><td>".calc_val($hash,param('cnt'))."</td></tr>
	</table>
	";	
} else {

}

print $header.$out.$footer; 







1;
