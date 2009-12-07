<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE methoddef SYSTEM "rpc-method.dtd">
<methoddef>
<name>com.cyberdeck.checklogin</name>
<version>1.0</version>
<signature>double</signature>
<code language="perl">
<![CDATA[
sub checklogin {
	my ($username) = @_;
	if ($username eq 'ciccio') { return 0;} else {return 1;}	
}
__END__
]]></code>
</methoddef>
