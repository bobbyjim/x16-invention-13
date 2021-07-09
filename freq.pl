
my @notes = qw/
C2 Cs2 d2 ds2 e2 f2 fs2 g2 gs2 a2 as2 b2 
C3 Cs3 d3 ds3 e3 f3 fs3 g3 gs3 a3 as3 b3 
c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4
c5 cs5 d5 ds5 e5 f5 fs5 g5 gs5 a5 as5 b5
c6 cs6 d6 ds6 e6 f6 fs6 g6 gs6 a6 as6 b6
/;

my $i = 0;
my @labels;
my @values;
for (qw/65.41 69.3 73.42 77.78 82.41 87.31 92.5 98 103.83 110 116.54 123.47 130.81 138.59 146.83 155.56 164.81 174.61 185 196 207.65 220 233.08 246.94 261.63 277.18 293.66 311.13 329.63 349.23 369.99 392 415.3 440 466.16 493.88 523.25 554.37 587.33 622.25 659.25 698.46 739.99 783.99 830.61 880 932.33 987.77 1046.5 1108.73 1174.66 1244.51 1318.51 1396.91 1479.98/)
{
   push @values, sprintf( " %-7s", sprintf( "%.2f", $_/0.3725));
   push @labels, sprintf( " %-7s", shift @notes);
   ++$i;
   print "REM  ", join(",", @labels), "\n" unless $i % 6;
   print "DATA ", join(",", @values), "\n" unless $i % 6;
   @labels = () unless $i % 6;
   @values = () unless $i % 6;
}

