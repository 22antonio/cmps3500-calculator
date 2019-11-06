# must have perl-tk install
# sudo apt-get install perl-tk
#!/usr/bin/perl -w  
use Tk;
use strict;


my $mw = MainWindow->new;
$mw->Label(-text => 'Perl Calculator')->pack;
$mw->Entry(-width => 100) -> pack;


$mw->Button(
    -text    => '-',
    -width   => 2,
    -height  => 2,
)->pack;

$mw->Button(
    -text    => '*',
)->pack;

$mw->Button(
    -text    => '/',
)->pack;

$mw->Button(
    -text    => '=',
)->pack;


$mw->Button(
    -text    => 'Sin',
)->pack;

$mw->Button(
    -text    => 'Cos',
)->pack;


$mw->Button(
    -text    => 'Tan',
)->pack;



$mw->Button(
    -text    => 'Quit',
    -command => sub { exit },
)->pack;




MainLoop;