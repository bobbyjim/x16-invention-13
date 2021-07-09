




my @no = qw/0 1
c3 cs3 d3 ds3 e3 f3 fs3 g3 gs3 a3 as3 b3 
c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4 
c5 cs5 d5 ds5 e5 f5 fs5 g5 gs5 a5 as5 b5 
c6 cs6 d6 ds6 e6 f6 fs6 g6 gs6 a6 as6 b6 
/;

my @dat = qw/
      	c5 a4 f4 a4 d4 d4 b4 b4 c5 c5 0 0 0 0 0 0               # bar 6
	g4 c5 e5 d5 g4 d5 f5 e5 e5 g5 g5 b4 b4 g5 g5		# bar 7
	c5 g4 c5 e5 d5 g4 d5 f5 e5 e5 c5 c5 g5 g5 e5 e5		# bar 8
        c6 a5 e5 a5 c5 e5 a4 c5 d5 d5 fs5 fs5 a5 a5 c6 c6      	# bar 9
	b5 g5 d5 g5 b4 d5 g4 b4 c5 c5 e5 e5 g5 g5 b5 b5		# bar 10
	a5 fs5 ds5 fs5 b4 d5 fs4 a4 g4 g4 g5 g5 g5 e5 c5 e5	# bar 11
    	a4 a4 fs5 fs5 fs5 d5 b4 d5 g4 g4 e5 e5 e5 c5 a4 c5	# bar 12
	fs4 g5 fs5 e5 ds5 fs5 b4 ds5 e5 e5 0 0 0 0 0 0		# bar 13
/;

for (@dat)
{
   for my $j (0..38)
   {
      print "$no[$j]: $j\n" if $no[$j] eq $_;
   }
}
