use DBI;
use strict;
use LWP::UserAgent;
use LWP::Simple;
use XML::Simple;

my $database_name = 'sbr2';
my $mysql_user = 'root';
my $mysql_password = 'D0nutSh@p';

my $dbh = DBI->connect('DBI:mysql:'.$database_name,$mysql_user,$mysql_password);

open(IN, "experiments.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO EXPERIMENT (
		ID,
		ANIMAL_MODEL_ID,
		EPIGENETIC_MARK_ID,
		QUALITY_ASSIGNMENT_ID,
		EXPERIMENT_TYPE_ID,
		TISSUE_ID,
		PUBLICATION_ID,
		PLATFORM_ID,
		VARIANT_ID,
		CELL_TYPE_ID) 
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'",	#ANIMAL_MODEL_ID
		"'.$field[2].'",	#EPIGENETIC_MARK_ID
		"'.$field[3].'",	#QUALITY_ASSIGNMENT_ID
		"'.$field[4].'",	#EXPERIMENT_TYPE_ID
		"'.$field[5].'",	#TISSUE_ID
		"'.$field[6].'",	#PUBLICATION_ID
		"'.$field[7].'",	#PLATFORM_ID
		"'.$field[8].'",	#VARIANT_ID
		"'.$field[9].'"		#CELL_TYPE_ID
	)
	ON DUPLICATE KEY UPDATE
		ANIMAL_MODEL_ID = "'.$field[1].'",
		EPIGENETIC_MARK_ID = "'.$field[2].'",
		QUALITY_ASSIGNMENT_ID = "'.$field[3].'",
		EXPERIMENT_TYPE_ID = "'.$field[4].'",
		TISSUE_ID = "'.$field[5].'",
		PUBLICATION_ID = "'.$field[6].'",
		PLATFORM_ID = "'.$field[7].'",
		VARIANT_ID = "'.$field[8].'",
		CELL_TYPE_ID = "'.$field[9].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}


open(IN, "animal_models.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO ANIMAL_MODEL (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "experiment_types.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO EXPERIMENT_TYPE (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "tissues.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO TISSUE (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "variants.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO VARIANT (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "subsystems.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO SUBSYSTEM (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "cell_types.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO CELL_TYPE (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "quality_control_measures.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO QUALITY_CONTROL_MEASURE (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "platforms.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO PLATFORM (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "publications.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO PUBLICATION (
		ID,
		CITATION)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#CITATION
	)
	ON DUPLICATE KEY UPDATE
		CITATION = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "epigenetic_marks.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO EPIGENETIC_MARK (
		ID,
		NAME)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'"		#NAME
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "partitions.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO PARTITION (
		ID,
		NAME,
		OFFSET_LANDMARK,
		OFFSET_START,
		OFFSET_LENGTH)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'",	#NAME
		"'.$field[2].'",	#OFFSET Landmark
		"'.$field[3].'",	#OFFSET Start
		"'.$field[4].'"		#OFFSET Length
	)
	ON DUPLICATE KEY UPDATE
		NAME = "'.$field[1].'",
		OFFSET_LANDMARK = "'.$field[2].'",
		OFFSET_START = "'.$field[3].'",
		OFFSET_LENGTH = "'.$field[4].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

#subsystems_assignments.tsv
open(IN, "quality_assignments.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO QUALITY_ASSIGNMENT (
		ID,
		ASSIGNMENT_ID,
		MEASURE_ID,
		MEASUREMENT)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'",	#Assignment ID
		"'.$field[2].'",	#Measure ID
		"'.$field[3].'"		#Measurement
	)
	ON DUPLICATE KEY UPDATE
		ASSIGNMENT_ID = "'.$field[1].'",
		MEASURE_ID = "'.$field[2].'",
		MEASUREMENT = "'.$field[3].'"
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}

open(IN, "subsystem_assignments.tsv");
while(my $record = <IN>)
{
	chomp($record);
	my @field = split(/\t/,$record);

	my $sql = 'INSERT INTO SUBSYSTEM_ASSIGNMENT (
		ID,
		SUBSYSTEM_ID,
		CELL_TYPE_ID)
	VALUES (
		"'.$field[0].'",	#ID
		"'.$field[1].'",	#Subsystem ID
		"'.$field[2].'"		#Cell Type ID
	)
	ON DUPLICATE KEY UPDATE
		SUBSYSTEM_ID = "'.$field[1].'",
		CELL_TYPE_ID = "'.$field[2].'",
	';

	my $sth = $dbh->prepare($sql);
	$sth->execute();
}
