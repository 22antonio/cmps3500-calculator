#!/usr/bin/perl -w  
# must have perl-tk install
# sudo apt-get install perl-tk

use Tk;
use strict;
use Math::Trig;

my $mw = MainWindow->new;
$mw->geometry("480x450+0+0");
$mw->Label(-text => 'Perl Calculator')->pack;
$mw->optionAdd('*font', 'Helvetica 30');
my $entry = $mw->Entry(-width => 40) -> pack;


#Placing Calculator Sections within a grd
#my $mainGrid = $mw->Frame()->grid(-row=>10, -column=>10);

#$mainGrid->pack;

my $calcGrid = $mw->Frame()->grid(
    -row => 6,
    -column => 5
);

##############################################################################################
# Numbers Frame/grid
# my $numbers = $mw->Frame() -> grid(
#     -row => 3,
#     -column => 4,
#      );

$calcGrid->Button(
    -text => '(',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '(') },
)->grid(-row => 2, -column => 3);

$calcGrid->Button(
    -text => ')',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), ')') },
)->grid(-row => 2, -column => 4);

$calcGrid ->Button(
    -text => '1',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '1') },
)->grid(-row => 5, -column => 1);

$calcGrid ->Button(
    -text => '2',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '2') },
)->grid(-row => 5, -column => 2);

$calcGrid ->Button(
    -text => '3',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '3') },
)->grid(-row => 5, -column => 3);

$calcGrid ->Button(
    -text => '4',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '4') },
)->grid(-row => 4, -column => 1);

$calcGrid ->Button(
    -text => '5',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '5') },
)->grid(-row => 4, -column => 2);

$calcGrid ->Button(
    -text => '6',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '6') },
)->grid(-row => 4, -column => 3);

$calcGrid ->Button(
    -text => '7',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '7') },
)->grid(-row => 3, -column => 1);

$calcGrid ->Button(
    -text => '8',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '8') },
)->grid(-row => 3, -column => 2);

$calcGrid ->Button(
    -text => '9',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '9') },
)->grid(-row => 3, -column => 3);

$calcGrid ->Button(
    -text => '0',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '0') },
)->grid(-row => 6, -column => 1);

$calcGrid ->Button(
    -text => '.',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '.') },
)->grid(-row => 6, -column => 2);



$calcGrid ->Button(
    -text => '+/-',
    -width => 3,
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
)->grid(-row => 6, -column => 3);

# my $cols;
# my $rows; 
# ($cols, $rows) = $numbers->gridSize();
# print $cols . $rows;

# for(my $i = 0; $i < $cols; $i++){
#     $numbers->gridColumnconfigure($i, -weight => 4);
# }


#################################################################################

# my $trig = $mw->Frame()->grid(-row=>1 , -column=>3);

$calcGrid->Button(
    -text=> 'sin',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'sin(') },
)->grid(-row => 2, -column=> 0);

$calcGrid->Button(
    -text=> 'cos',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'cos(') },
)->grid(-row=> 2, -column => 1);


$calcGrid->Button(
    -text=> 'tan',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'tan(') },
)->grid(-row=> 2, -column => 2);

# ##############################################################################

# my $basicOperations = $mw->Frame()->grid(
#     -row=>4, 
#     -column=>1
#     );

$calcGrid->Button(
    -text=> '/',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '/') },
)->grid(-row=>3, -column => 4);

$calcGrid->Button(
    -text=> '+',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '+') },
)->grid(-row=>4, -column => 4);

$calcGrid->Button(
    -text=> '-',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '-') },
)->grid(-row=>5, -column => 4);

$calcGrid->Button(
    -text=> '*',
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '*') },
)->grid(-row=>6, -column => 4);
# ###############################################################################

my $clearCancelOK = $mw->Frame()->grid(
    -row=>1, 
    -column=>3,
    );


$clearCancelOK->Button(
    -text=> 'Ok',
    -width => 5,
    -padx => 21,
    -command => sub{ 
        # TODO some sort of parsing to update to value

        my @temp = split(/(\()|(\))|(\*)|(-)|(\+)|(\/)|(\d+\.?\d*)|(tan)|(sin)|(cos)|(exp)|(ln)|(sqrt)|(^)|/,$entry->get);
        my @equation;
        my $trigFlag = 0;
        my $trigParenCounter = 0;
        my $maxTrigParen = 0;
        
        foreach(@temp){
            if($_){

                if($_ eq "^"){
                    push @equation, "**";
                }else{

                    push @equation, $_;
                    if($_ eq "tan" or $_ eq "sin" or $_ eq "cos"){
                        push @equation, "(deg2rad";
                        $trigFlag = 1;
                        $trigParenCounter += 1;
                        $maxTrigParen += 1;
                    }

                    if($_ eq ")" and $trigFlag == 1){
                        $trigParenCounter -= 1;

                        if($trigParenCounter == 0){
                            while($maxTrigParen > 0){
                                push @equation, ")";
                                $maxTrigParen -= 1;
                            }
                        }
                    }

                }
            }
        }
    

        print(@equation);
        print("\n");

        my $problem = "";

        foreach(@equation){
             if($_){
                 $problem .= $_;
             }
        }

        print($problem . "\n");

        my $result =  eval $problem;

        $entry->delete(0, length($entry->get));
        $entry->insert(0, $result);
        

    },
)->grid(-column=>3, -row=>0);

#shift grabs argument 1, should only be 1 arg to function
sub checkPrecedence{
    my $toCheck = shift;
    my $precedenceToRet = 1;
    if ($toCheck eq '*' or $toCheck eq '/'){
        $precedenceToRet = 3;
    }
    elsif($toCheck eq '+' or $toCheck eq '-'){
        $precedenceToRet = 2;
    }

    return $precedenceToRet;
}

$clearCancelOK->Button(
    -text=> 'Cancel',
    -width => 5,
    -padx => 21,
    -command => sub{ 
        $entry->delete(length($entry->get) - 1, length($entry->get))
    },
)->grid(-column=>2, -row=>0);

$clearCancelOK->Button(
    -text=> 'Clear',
    -width => 5,
    -padx => 21,
    -command => sub{ 
        $entry->delete(0, length($entry->get))
    },
)->grid(-column=>1, -row=>0);
# ####################################################################################

# my $functions = $mw->Frame()->grid(
#     -row=>4,
#     -column=>1
#      );

$calcGrid->Button(
    -text=> "exp",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'exp(') },
)->grid(-row=>3, -column=>0);

$calcGrid->Button(
    #will do natural Log in perl
    -text=>"log",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'log(') },
)->grid(-row=>4, -column=>0);

$calcGrid->Button(
    -text=>"sqrt",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), 'sqrt(') },
)->grid(-row=>5, -column=>0);

$calcGrid->Button(
    -text=>"^",
    -width => 3,
    -command => sub{ $entry->insert(length($entry->get), '^(') },
)->grid(-row=>6, -column=>0);

####################################################################################


my $cols;
my $rows; 
($cols, $rows) = $calcGrid->gridSize();

for(my $i = 0; $i < $cols; $i++){
    $calcGrid->gridColumnconfigure($i, -uniform => 1);
}

$clearCancelOK->pack(-anchor => 'nw');
$calcGrid->pack(-anchor => 'nw');


MainLoop; 