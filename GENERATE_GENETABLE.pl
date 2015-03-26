use DBI;
use strict;
use LWP::UserAgent;
use LWP::Simple;
use XML::Simple;

my $database_name = 'sbr2';
my $mysql_user = 'root';
my $mysql_password = 'D0nutSh@p';

my $dbh = DBI->connect('DBI:mysql:'.$database_name,$mysql_user,$mysql_password);

my $kgXref = shift or die;
my $species_id = shift or die;
my $offset = shift or 0;

my $count = $offset;
open(IN, $kgXref) or die "Cannot open $kgXref";
while(my $rec = <IN>)
{
	$offset++;

	chomp($rec);
	my @tmp = split(/\t/,$rec);

#	print $offset."\t";
#	print $species_id."\t";
#	print $tmp[0]."\t";	#Known Gene ID				e.g. uc007afi.2
#	print $tmp[1]."\t";	#mRNA ID				e.g. NM_011541
#	print $tmp[2]."\t";	#UniProt Protein Accession number	e.g. Q3UWX7
#	print $tmp[3]."\t";	#Uniprot display ID			e.g. Q3UWX7_MOUSE
#	print $tmp[4]."\t";	#Gene Symbol				e.g. Tcea1
#	print $tmp[5]."\t";	#RefSeq ID				e.g. NM_011541
#	print $tmp[6]."\t";	#NCBI Protein Accession number		e.g. NP_035671
#	print $tmp[7]."\t";	#Description				e.g. transcription elongation factor A protein 1
#	print "\n";

	my $ensembl = 'TBA';

	my $sql = 'INSERT INTO GENE (
		ID,
		SPECIES_ID,
		REFSEQ_ID,
		SYMBOL,
		KNOWN_ID,
		ENSEMBL_ID)
	VALUES (
		"'.$offset.'",	#ID
		"'.$species_id.'",	#SPECIES ID
		"'.$tmp[5].'",		#REFSEQ ID
		"'.$tmp[4].'",		#SYMBOL
		"'.$tmp[0].'",		#KNOWN ID
		"'.$ensembl.'"		#ENSEMBL ID
	)
	ON DUPLICATE KEY UPDATE
		SPECIES_ID = "'.$species_id.'",
		REFSEQ_ID = "'.$tmp[5].'",
		SYMBOL = "'.$tmp[4].'",
		KNOWN_ID = "'.$tmp[0].'",
		ENSEMBL_ID = "'.$ensembl.'"
	';

my $sth = $dbh->prepare($sql);
$sth->execute();
}
close IN;

print $offset." Genes processed\n";
