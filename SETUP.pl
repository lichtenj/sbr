use DBI;
use strict;

my $database_name = 'sbr2';
my $mysql_user = 'root';
my $mysql_password = 'D0nutSh@p';

##
#
# Database Preparation
#
##

my $dbh = DBI->connect('DBI:mysql:'.$database_name,$mysql_user,$mysql_password) or database_setup($database_name);
$dbh = DBI->connect('DBI:mysql:'.$database_name,$mysql_user,$mysql_password);

##
#
# Table Preparation
#
##
my $sth;

## EXPERIMENT

my $experiment_drop   = 'DROP TABLE IF EXISTS `EXPERIMENT`;';
my $experiment_create = 'CREATE TABLE IF NOT EXISTS `EXPERIMENT` (
`ID` int(11) NOT NULL,
`ANIMAL_MODEL_ID` int(11) DEFAULT NULL,
`EPIGENETIC_MARK_ID` int(11) NOT NULL,
`QUALITY_ASSIGNMENT_ID` int(11) NOT NULL,
`EXPERIMENT_TYPE_ID` int(11) NOT NULL,
`TISSUE_ID` int(11) DEFAULT NULL,
`PUBLICATION_ID` int(11) NOT NULL,
`PLATFORM_ID` int(11) DEFAULT NULL,
`VARIANT_ID` int(11) DEFAULT NULL,
`CELL_TYPE_ID` int(11) NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($experiment_drop);
$sth->execute();
$sth = $dbh->prepare($experiment_create);
$sth->execute();

##EXPERIMENT TYPE

my $experiment_type_drop   = 'DROP TABLE IF EXISTS `EXPERIMENT_TYPE`;';
my $experiment_type_create = 'CREATE TABLE IF NOT EXISTS `EXPERIMENT_TYPE` (
`ID` int(11) NOT NULL,
`Name` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($experiment_type_drop);
$sth->execute();
$sth = $dbh->prepare($experiment_type_create);
$sth->execute();

##TISSUE

my $tissue_drop   = 'DROP TABLE IF EXISTS `TISSUE`;';
my $tissue_create = 'CREATE TABLE IF NOT EXISTS `TISSUE` (
`ID` int(11) NOT NULL,
`Name` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($tissue_drop);
$sth->execute();
$sth = $dbh->prepare($tissue_create);
$sth->execute();

##ANIMAL MODEL

my $animal_model_drop   = 'DROP TABLE IF EXISTS `ANIMAL_MODEL`;';
my $animal_model_create = 'CREATE TABLE IF NOT EXISTS `ANIMAL_MODEL` (
`ID` int(11) NOT NULL,
`Name` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($animal_model_drop);
$sth->execute();
$sth = $dbh->prepare($animal_model_create);
$sth->execute();

##PUBLICATION

my $publication_drop   = 'DROP TABLE IF EXISTS `PUBLICATION`;';
my $publication_create = 'CREATE TABLE IF NOT EXISTS `PUBLICATION` (
`ID` int(11) NOT NULL,
`Citation` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($publication_drop);
$sth->execute();
$sth = $dbh->prepare($publication_create);
$sth->execute();

##PLATFORM

my $platform_drop   = 'DROP TABLE IF EXISTS `PLATFORM`;';
my $platform_create = 'CREATE TABLE IF NOT EXISTS `PLATFORM` (
`ID` int(11) NOT NULL,
`Name` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($platform_drop);
$sth->execute();
$sth = $dbh->prepare($platform_create);
$sth->execute();

##RESULT

my $result_drop   = 'DROP TABLE IF EXISTS `RESULT`;';
my $result_create = 'CREATE TABLE IF NOT EXISTS `RESULT` (
`ID` int(11) NOT NULL,
`EXPERIMENT_ID` int(11) NOT NULL,
`GENE_ID` int(11) NOT NULL,
`PARTITION_ID` int(11) NOT NULL,
`REPLICATE_ID` int(11) NOT NULL,
`TOOL_ID` int(11) NOT NULL,
`MEASUREMENT_RAW` double NOT NULL,
`MEASUREMENT_NORMALIZED` double NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($result_drop);
$sth->execute();
$sth = $dbh->prepare($result_create);
$sth->execute();

##EPIGENETIC MARK

my $epigenetic_mark_drop   = 'DROP TABLE IF EXISTS `EPIGENETIC_MARK`;';
my $epigenetic_mark_create = 'CREATE TABLE IF NOT EXISTS `EPIGENETIC_MARK` (
`ID` int(11) NOT NULL,
`Name` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($epigenetic_mark_drop);
$sth->execute();
$sth = $dbh->prepare($epigenetic_mark_create);
$sth->execute();

##QUALITY ASSIGNMENT

my $quality_assignment_drop   = 'DROP TABLE IF EXISTS `QUALITY_ASSIGNMENT`;';
my $quality_assignment_create = 'CREATE TABLE IF NOT EXISTS `QUALITY_ASSIGNMENT` (
`ID` int(11) NOT NULL,
`ASSIGNMENT_ID` int(11) NOT NULL,
`MEASURE_ID` int(11) NOT NULL,
`MEASUREMENT` double NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($quality_assignment_drop);
$sth->execute();
$sth = $dbh->prepare($quality_assignment_create);
$sth->execute();

##VARIANT

my $variant_drop   = 'DROP TABLE IF EXISTS `VARIANT`;';
my $variant_create = 'CREATE TABLE IF NOT EXISTS `VARIANT` (
`ID` int(11) NOT NULL,
`NAME` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($variant_drop);
$sth->execute();
$sth = $dbh->prepare($variant_create);
$sth->execute();

##CELL TYPE

my $cell_type_drop   = 'DROP TABLE IF EXISTS `CELL_TYPE`;';
my $cell_type_create = 'CREATE TABLE IF NOT EXISTS `CELL_TYPE` (
`ID` int(11) NOT NULL,
`NAME` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($cell_type_drop);
$sth->execute();
$sth = $dbh->prepare($cell_type_create);
$sth->execute();

##GENE

my $gene_drop   = 'DROP TABLE IF EXISTS `GENE`;';
my $gene_create = 'CREATE TABLE IF NOT EXISTS `GENE` (
`ID` int(11) NOT NULL,
`REFSEQ_ID` text NOT NULL,
`SYMBOL` text NOT NULL,
`KNOWN_ID` text NOT NULL,
`ENSEMBL_ID` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($gene_drop);
$sth->execute();
$sth = $dbh->prepare($gene_create);
$sth->execute();

##PARTITION

my $partition_drop   = 'DROP TABLE IF EXISTS `PARTITION`;';
my $partition_create = 'CREATE TABLE IF NOT EXISTS `PARTITION` (
`ID` int(11) NOT NULL,
`NAME` text NOT NULL,
`OFFSET_LANDMARK` text NOT NULL,
`OFFSET_START` int(11) NOT NULL,
`OFFSET_LENGTH` int(11) NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($partition_drop);
$sth->execute();
$sth = $dbh->prepare($partition_create);
$sth->execute();

##QUALITY CONTROL MEASURE

my $quality_control_measure_drop   = 'DROP TABLE IF EXISTS `QUALITY_CONTROL_MEASURE`;';
my $quality_control_measure_create = 'CREATE TABLE IF NOT EXISTS `QUALITY_CONTROL_MEASURE` (
`ID` int(11) NOT NULL,
`NAME` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($quality_control_measure_drop);
$sth->execute();
$sth = $dbh->prepare($quality_control_measure_create);
$sth->execute();

##SUBSYSTEM

my $subsystem_drop   = 'DROP TABLE IF EXISTS `SUBSYSTEM`;';
my $subsystem_create = 'CREATE TABLE IF NOT EXISTS `SUBSYSTEM` (
`ID` int(11) NOT NULL,
`NAME` text NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($subsystem_drop);
$sth->execute();
$sth = $dbh->prepare($subsystem_create);
$sth->execute();

##SUBSYSTEM ASSIGNMENT

my $subsystem_assignment_drop   = 'DROP TABLE IF EXISTS `SUBSYSTEM_ASSIGNMENTS`;';
my $subsystem_assignment_create = 'CREATE TABLE IF NOT EXISTS `SUBSYSTEM_ASSIGNMENTS` (
`ID` int(11) NOT NULL,
`SUBSYSTEM_ID` int(11) NOT NULL,
`CELL_TYPE_ID` int(11) NOT NULL,
PRIMARY KEY (`ID`))';

$sth = $dbh->prepare($subsystem_assignment_drop);
$sth->execute();
$sth = $dbh->prepare($subsystem_assignment_create);
$sth->execute();

sub database_setup
{
	my $database_name = shift or die;
	$dbh = DBI->connect('DBI:mysql:',$mysql_user,$mysql_password);
	print 1 == $dbh->do('create database '.$database_name) ? "Successfully created\n":"Problem creating database\n";
}
