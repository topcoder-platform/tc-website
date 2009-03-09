#!/usr/bin/perl

open (REMOTE,"ssh informix\@192.168.14.52 ./scripts/rating/loadRatings.sh");
sleep 3;
print REMOTE "DblM1nt\n";
sleep 30;
close REMOTE;
