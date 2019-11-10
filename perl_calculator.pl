# must have perl-tk install
# sudo apt-get install perl-tk
#!/usr/bin/perl -w  
use Tk;
use strict;


my $mw = MainWindow->new;
$mw->Label(-text => 'Perl Calculator')->pack;
$mw->Entry(-width => 40) -> pack;

#Placing Calculator Sections within a grd
my $mainGrid = $mw->Frame()->grid(-row=>10, -column=>10);

$mainGrid->pack;

##############################################################################################
# Numbers Frame/grid
my $numbers = $mainGrid->Frame(
) -> grid(-row => 3, -column => 4);

$numbers ->Button(
    -text => '1'
)->grid(-row => 0, -column => 0);

$numbers ->Button(
    -text => '2'
)->grid(-row => 0, -column => 1);

$numbers ->Button(
    -text => '3'
)->grid(-row => 0, -column => 2);

$numbers ->Button(
    -text => '4'
)->grid(-row => 1, -column => 0);

$numbers ->Button(
    -text => '5'
)->grid(-row => 1, -column => 1);

$numbers ->Button(
    -text => '6'
)->grid(-row => 1, -column => 2);

$numbers ->Button(
    -text => '7'
)->grid(-row => 2, -column => 0);

$numbers ->Button(
    -text => '8'
)->grid(-row => 2, -column => 1);

$numbers ->Button(
    -text => '9'
)->grid(-row => 2, -column => 2);

$numbers ->Button(
    -text => '0'
)->grid(-row => 3, -column => 0);

$numbers ->Button(
    -text => '.'
)->grid(-row => 3, -column => 1);


$numbers ->Button(
    -text => '+/-'
)->grid(-row => 3, -column => 2);


#################################################################################

my $trig = $mainGrid->Frame()->grid(-row=>1 , -column=>3);

$trig->Button(
    -text=> 'sin'
)->grid(-row => 0, -column=> 0);

$trig->Button(
    -text=> 'cos'
)->grid(-row => 0, -column=> 1);


$trig->Button(
    -text=> 'tan'
)->grid(-row => 0, -column=> 2);

##############################################################################

my $basicOperations = $mainGrid->Frame()->grid(-row=>4, -column=>1);

$basicOperations->Button(
    -text=> '/'
)->grid(-row=>0);

$basicOperations->Button(
    -text=> '+'
)->grid(-row=>1);

$basicOperations->Button(
    -text=> '-'
)->grid(-row=>2);

$basicOperations->Button(
    -text=> '*'
)->grid(-row=>3);
###############################################################################

my $clearCancelOK = $mainGrid->Frame()->grid(-row=>1, -column=>3);

$clearCancelOK->Button(
    -text=> 'Clear'
)->grid(-column=>0, -row=>0);

$clearCancelOK->Button(
    -text=> 'Cancel'
)->grid(-column=>1, -row=>0);

$clearCancelOK->Button(
    -text=> 'Ok'
)->grid(-column=>2, -row=>0);

####################################################################################

my $functions = $mainGrid->Frame()->grid(-row=>4, -column=>1);

$functions->Button(
    -text=> "exp"
)->grid(-row=>0, -column=>0);

$functions->Button(
    -text=>"ln"
)->grid(-row=>1, -column=>0);

$functions->Button(
    -text=>"sqrt"
)->grid(-row=>2, -column=>0);

$functions->Button(
    -text=>"sq"
)->grid(-row=>3, -column=>0);

####################################################################################

#put grid of buttons into main grid
$clearCancelOK->grid(-row=>8, -column=>5);
$functions->grid(-row=>9, -column=>4);
$numbers->grid(-row=> 9, -column=>5);
$trig->grid(-row=> 8, -column=> 5);
$basicOperations->grid(-row=>9, -column=>6);



MainLoop;