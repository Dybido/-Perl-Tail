#!/usr/bin/perl -w

#Input format : ./tail.pl -(number of lines) (filename)
$n_lines = 10;
#Checks if there are arguments and if first argument is a number 
if(@ARGV && $ARGV[0] =~ /-[0-9]+/){
   $n_lines = -$ARGV[0];
   shift @ARGV;
}

foreach $file (@ARGV){
   open INPUT, "<$file" or die "cannot open $file = $! \n";
   @inputArray = <INPUT>;
   if(@ARGV>1){
      print "==> $file <== \n";
   }
   $min = $#inputArray - $n_lines + 1;
   $min = 0 if $min < 0;
   print((@inputArray)[$min..$#inputArray]);
   close INPUT;
}


