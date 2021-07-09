
my @no = qw/0 1
c2 cs2 d2 ds2 e2 f2 fs2 g2 gs2 a2 as2 b2 
c3 cs3 d3 ds3 e3 f3 fs3 g3 gs3 a3 as3 b3 
c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4 
c5 cs5 d5 ds5 e5 f5 fs5 g5 gs5 a5 as5 b5 
c6 cs6 d6 ds6 e6 f6 fs6 g6 gs6 a6 as6 b6 
/;

my @treble = qw/
 	0  e4 a4 c5 b4 e4 b4 d5 c5 c5 e5 e5 gs4 gs4 e5 e5	#-bar-1
	a4 e4 a4 c5 b4 e4 b4 d5 c5 c5 a4 a4 0 0 0 0		#-bar-2
	0  e5 c5 e5 a4 c5 e4 g4 f4 f4 a4 a4 d5 d5 f5 f5 	#-bar-3
	f5 d5 b4 d5 g4 b4 d4 f4 e4 e4 g4 g4 c5 c5 e5 e5		#-bar-4
	e5 c5 a4 c5 f4 f4 d5 d5 d5 b4 g4 b4 e4 e4 c5 c5 	#-bar-5
      	c5 a4 f4 a4 d4 d4 b4 b4 c5 c5 0 0 0 0 0 0               #-bar-6
	0 g4 c5 e5 d5 g4 d5 f5 e5 e5 g5 g5 b4 b4 g5 g5		#-bar-7
	c5 g4 c5 e5 d5 g4 d5 f5 e5 e5 c5 c5 g5 g5 e5 e5		#-bar-8
        c6 a5 e5 a5 c5 e5 a4 c5 d5 d5 fs5 fs5 a5 a5 c6 c6      	#-bar-9
	b5 g5 d5 g5 b4 d5 g4 b4 c5 c5 e5 e5 g5 g5 b5 b5		#-bar-10
	a5 fs5 ds5 fs5 b4 d5 fs4 a4 g4 g4 g5 g5 g5 e5 c5 e5	#-bar-11
    	a4 a4 fs5 fs5 fs5 d5 b4 d5 g4 g4 e5 e5 e5 c5 a4 c5	#-bar-12
	fs4 g5 fs5 e5 ds5 fs5 b4 ds5 e5 e5 0 0 0 0 0 0		#-bar-13
/;

my @bass = qw/
	a2 a2   a3 a3 a3 a3 gs3 gs3 a3  e3 a3 c4  b3 e3 b3 d4   #-bar-1
	c4 c4   a3 a3 gs3 gs3 e3 e3 a3 e3 a3 c4 b3 e3 b3 d4     #-bar-2
	c4 c4   a3 a3 c4 c4 a3  a3  d4 a3 f3 a3 d3 f3 a2 c3     #-bar-3
 	b2 b2   d3 d3 g3 g3 b3  b3  b3 g3 e3 g3 c3 e3 g2 b2     #-bar-4
   	a2 a2   c3 c3 d3 f3 b2  d3  g2  g2 b2 b2  c3 e3 a2 c3	#-bar-5
   	f2 f2   d2 d2 g2 g3 f3  g3  a2  g3 c4 e4  d4 g3 d4 f4	#-bar-6
   	e4 e4   c4 c4 b3 b3 g3  g3  c4  g3 c4 e4  d4 g3 d4 f4	#-bar-7
   	e4 e4   c4 c4 0  0  0   0   0   g4 e4 g4  c4 e4 g3 b3	#-bar-8
   	a3 a3   c4 c4 e4 e4 g4  g4  fs4 a4 d4 fs4 a3 d4 fs3 a4	#-bar-9
   	g3 g3   b3 b3 d4 d4 fs4 fs4 e4 fs4 c4 e4  g3 c4 e3 g3   #-bar-10
   	fs3 fs3 a3 a3 b3 b3 ds4 ds4 0   e4 c4 e4  a3 c4 e4 g4   #-bar-11
   	fs4 d4  b3 d4 g3 b3 d4  fs4 e4  c4 a3 c4 fs3 a3 c4 c4   #-bar-12
   	c4 b3   c4 b3 c4 c4 b2  b2  e3  e4 b3 g3  e3 b2 a2 b2   #-bar-13
/;

my $bar = 1;
my $barf = "";
{
   my $treble = shift @treble;
   my $bass  = shift @bass;

   ++$bar if $treble =~ /-bar-/;
   $barf = "bar $bar" if $treble =~ /-bar-/;
   print "rem $barf\n" if $barf && @treble;
   $barf = undef;

   $treble = shift @treble if $treble =~ /-bar-/;
   $bass   = shift @bass   if $bass   =~ /-bar-/;

   my @line = ();
   for my $j (0..61)
   {
      push @line, $j if $treble eq $no[$j];
   }
   for my $j (0..61)
   {
      push @line, $j if $bass eq $no[$j];
   }
   print "DATA ", join(",", @line), "  :rem $treble, $bass\n";


   redo while @treble;
}
