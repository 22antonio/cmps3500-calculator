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

my @numKeys = ('1','2','3','4','5','6','7','8','9','0', '.', '+/-');

my $row = 0;
my $col = 0;
my $key;

foreach(@numKeys){
    $key = $_;
    $numbers->Button(
        -text => $key
    )->grid(-row=> $row, -column=> $col);

    $col++;
    if($col == 3){
        $row++;
        $col = 0;
    }

}

#################################################################################

my $trig = $mainGrid->Frame()->grid(-row=>1 , -column=>3);

my @trigEq = ('sin', 'cos', 'tan');
$row = 0;
$col = 0;

foreach(@trigEq){
    $key = $_;
    $trig->Button(
        -text=> $_
    )->grid(-row => $row, -column=> $col);

    $col++;
}

##############################################################################

my $basicOperations = $mainGrid->Frame()->grid(-row=>4, -column=>1);

my @operationKey = ('/', '+', '-', '*');

$col = 0;
$row = 0;

foreach(@operationKey){
    $key = $_;
    $basicOperations->Button(
        -text=> $key
    )->grid(-row=>$row);
    $row++;
}

###############################################################################
#TODO Finish turning these into loops you'll fill

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
$clearCancelOK->grid(-row=>7, -column=>5);
$functions->grid(-row=>9, -column=>4);
$numbers->grid(-row=> 9, -column=>5);
$trig->grid(-row=> 8, -column=> 5);
$basicOperations->grid(-row=>9, -column=>6);



MainLoop;