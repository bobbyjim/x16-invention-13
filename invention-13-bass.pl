




my @no = qw/0 1
c3 cs3 d3 ds3 e3 f3 fs3 g3 gs3 a3 as3 b3 
c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4 
c5 cs5 d5 ds5 e5 f5 fs5 g5 gs5 a5 as5 b5 
c6 cs6 d6 ds6 e6 f6 fs6 g6 gs6 a6 as6 b6 
/;

my @dat = qw/
   a3 a3 c4 c4 d4 f4 b3 d4 g3 g3 b3 b3 c4 e4 a3 c4	# bar 5
   f3 f3 d3 d3 g3 g4 f4 g4 a3 g4 c5 e5 d5 g4 d5 f5	# bar 6
   e5 e5 c5 c5 b4 b4 g4 g4 c5 g4 c5 e5 d5 g4 d5 f5	# bar 7
   e5 e5 c5 c5 0  0  0  0  0  g5 e5 g5 c5 e5 g4 b4	# bar 8
   a4 a4 c5 c5 e5 e5 g5 g5 fs5 a5 d5 f5 a4 d5 fs4 a5	# bar 9
   g4 g4 b4 b4 d5 d5 fs5 fs5 e5 fs5 c5 e5 g4 c5 e4 g4   # bar 10
   fs4 fs4 a4 a4 b4 b4 ds5 ds5 0 e5 c5 e5 a4 c5 e5 g5   # bar 11
   fs5 d5 b4 d5 g4 b4 d5 fs5 e5 c5 a4 c5 fs4 a4 c5 c5   # bar 12
   c5 b4 c5 b4 c5 c5 b3 b3 e4 e5 b4 g4 e4 b3 a3 b3      # bar 13
/;

for my $note (@dat)
{
   for my $j (0..38)
   {
      print "$no[$j]: $j\n" if $no[$j] eq $note;
   }
}
