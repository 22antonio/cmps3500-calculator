#!/usr/bin/perl -w  
# must have perl-tk install
# sudo apt-get install perl-tk

#todo add parentheses
#todo parse input and make it compute based on parsed input

use Tk;
use strict;


my $mw = MainWindow->new;
$mw->Label(-text => 'Perl Calculator')->pack;
my $entry = $mw->Entry(-width => 40) -> pack;

#Placing Calculator Sections within a grd
my $mainGrid = $mw->Frame()->grid(-row=>10, -column=>10);

$mainGrid->pack;

##############################################################################################
# Numbers Frame/grid
my $numbers = $mainGrid->Frame(
) -> grid(-row => 3, -column => 4);

$numbers ->Button(
    -text => '1',
    -command => sub{ $entry->insert(length($entry->get), '1') },
)->grid(-row => 0, -column => 0);

$numbers ->Button(
    -text => '2',
    -command => sub{ $entry->insert(length($entry->get), '2') },
)->grid(-row => 0, -column => 1);

$numbers ->Button(
    -text => '3',
    -command => sub{ $entry->insert(length($entry->get), '3') },
)->grid(-row => 0, -column => 2);

$numbers ->Button(
    -text => '4',
    -command => sub{ $entry->insert(length($entry->get), '4') },
)->grid(-row => 1, -column => 0);

$numbers ->Button(
    -text => '5',
    -command => sub{ $entry->insert(length($entry->get), '5') },
)->grid(-row => 1, -column => 1);

$numbers ->Button(
    -text => '6',
    -command => sub{ $entry->insert(length($entry->get), '6') },
)->grid(-row => 1, -column => 2);

$numbers ->Button(
    -text => '7',
    -command => sub{ $entry->insert(length($entry->get), '7') },
)->grid(-row => 2, -column => 0);

$numbers ->Button(
    -text => '8',
    -command => sub{ $entry->insert(length($entry->get), '8') },
)->grid(-row => 2, -column => 1);

$numbers ->Button(
    -text => '9',
    -command => sub{ $entry->insert(length($entry->get), '9') },
)->grid(-row => 2, -column => 2);

$numbers ->Button(
    -text => '0',
    -command => sub{ $entry->insert(length($entry->get), '0') },
)->grid(-row => 3, -column => 0);

$numbers ->Button(
    -text => '.',
    -command => sub{ $entry->insert(length($entry->get), '.') },
)->grid(-row => 3, -column => 1);


$numbers ->Button(
    -text => '+/-',
    -command => sub{
        my $tempString;
        my $sign = substr($entry->get, 0, 1);

        if($sign eq '-'){
            $tempString = substr($entry->get, 1, length($entry->get));
            $entry->delete(0, length($entry->get));
            $entry->insert(0, $tempString);
        }else{
            $tempString = $entry->get;
            $entry->delete(0, length($entry->get));
            $entry->insert(0, '-');
            $entry->insert(1, $tempString);
        }
    },
)->grid(-row => 3, -column => 2);


#################################################################################

my $trig = $mainGrid->Frame()->grid(-row=>1 , -column=>3);

$trig->Button(
    -text=> 'sin',
    -command => sub{ $entry->insert(length($entry->get), 'sin(') },
)->grid(-row => 0, -column=> 0);

$trig->Button(
    -text=> 'cos',
    -command => sub{ $entry->insert(length($entry->get), 'cos(') },
)->grid(-row => 0, -column=> 1);


$trig->Button(
    -text=> 'tan',
    -command => sub{ $entry->insert(length($entry->get), 'tan(') },
)->grid(-row => 0, -column=> 2);

##############################################################################

my $basicOperations = $mainGrid->Frame()->grid(-row=>4, -column=>1);

$basicOperations->Button(
    -text=> '/',
    -command => sub{ $entry->insert(length($entry->get), '/') },
)->grid(-row=>0);

$basicOperations->Button(
    -text=> '+',
    -command => sub{ $entry->insert(length($entry->get), '+') },
)->grid(-row=>1);

$basicOperations->Button(
    -text=> '-',
    -command => sub{ $entry->insert(length($entry->get), '-') },
)->grid(-row=>2);

$basicOperations->Button(
    -text=> '*',
    -command => sub{ $entry->insert(length($entry->get), '*') },
)->grid(-row=>3);
###############################################################################

my $clearCancelOK = $mainGrid->Frame()->grid(-row=>1, -column=>3);

$clearCancelOK->Button(
    -text=> 'Clear',
    -command => sub{ 
        $entry->delete(0, length($entry->get))
    },
)->grid(-column=>0, -row=>0);

$clearCancelOK->Button(
    -text=> 'Cancel',
    -command => sub{ 
        $entry->delete(length($entry->get) - 1, length($entry->get))
    },
)->grid(-column=>1, -row=>0);

$clearCancelOK->Button(
    -text=> 'Ok',
    -command => sub{ 
        # TODO some sort of parsing to update to value

        $entry->delete(0, length($entry->get))
    },
)->grid(-column=>2, -row=>0);

####################################################################################

my $functions = $mainGrid->Frame()->grid(-row=>4, -column=>1);

$functions->Button(
    -text=> "exp",
    -command => sub{ $entry->insert(length($entry->get), 'exp(') },
)->grid(-row=>0, -column=>0);

$functions->Button(
    -text=>"ln",
    -command => sub{ $entry->insert(length($entry->get), 'ln(') },
)->grid(-row=>1, -column=>0);

$functions->Button(
    -text=>"sqrt",
    -command => sub{ $entry->insert(length($entry->get), 'sqrt(') },
)->grid(-row=>2, -column=>0);

$functions->Button(
    -text=>"sq",
    -command => sub{ $entry->insert(length($entry->get), 'sq') },
)->grid(-row=>3, -column=>0);

####################################################################################

#put grid of buttons into main grid
$clearCancelOK->grid(-row=>7, -column=>5);
$trig->grid(-row=> 8, -column=> 5);
$functions->grid(-row=>9, -column=>4);
$numbers->grid(-row=> 9, -column=>5);
$basicOperations->grid(-row=>9, -column=>6);



MainLoop; 