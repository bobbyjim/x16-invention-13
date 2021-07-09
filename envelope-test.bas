5 REM
10 REM  THIS IS AN ENVELOPE TEST, IN BASIC.
15 REM
20 A0   = $200
25 A1      = $210
30 A2     = $220
35 A3  = $230
40 A4   = $230
45 A5 = $230
50 A6 = $230
55 REM
60 REM THIS IS A DEMO USING THE FIRST 13 BARS OF BACH'S INVENTION 13
65 REM I.E. THE PART OF THE SONG USED BY CBM IN THEIR ADS.
70 REM
75 POKE $9F22,0 :REM SET VERA AUTO-INCREMENT TO 0
80 SK = 0            :REM SKIP NOTES
85 SG = $F9C0        :REM PSG
90 REM  SG           :REM FREQ LO
95 REM  SG+1         :REM FREQ HI
100 REM  SG+2         :REM VOL
105 REM  SG+3         :REM WAVEFORM DUTY CYCLE
110 LR = %11000000    :REM STEREO
115 W(0) = %00000000  :REM WAVEFORM 1
120 W(1) = %10000000  :REM WAVEFORM 2
125 W(2) = %11000000  :REM WAVEFORM 3
130 PU = 63           :REM PULSE DUTY CYCLE = 50%
135 REM 
140 REM FREQUENCIES
145 REM
150 A9 = 1000
155 REM
160 REM SET VOICE
165 REM
170 I=0
175 SR = SG + 16 * I
180 VPOKE 1,SR,0
185 VPOKE 1,SR+1,0
190 V = 50 :REM VOL
195 VPOKE 1,SR+2, LR + V
200 VPOKE 1,SR+3, W(I) + PU
205 POKE A0, 1 :REM ASSIGN TO ENVELOPE 1
210 REM
215 REM  CONFIGURE ENVELOPE 1
220 REM
225 POKE A3  + 1, 250 :REM ATTACK
230 POKE A4   + 1, 250 :REM DECAY
235 POKE A5 + 1, 250 :REM SUSTAIN
240 POKE A6 + 1, 250 :REM RELEASE
245 SR = SG + 16 * I
250 F = A9
255 FL = F AND 255
260 FH = INT(F/256)
265 VPOKE 1,SR+0 ,FL
270 VPOKE 1,SR+1 ,FH
275 FOR X = 1 TO V STEP 64 / PEEK(A3+1)
280    VPOKE 1,SR+2,LR+X
285    FOR T=1 TO 100 :NEXT T
290 NEXT X
295 END
300 FOR X = 1 TO 255
305    GOSUB 375
310 NEXT
315 REM 
320 REM DONE - TURN OFF VOICE
325 REM
330 SR = SG + 16 * I
335 VPOKE 1,SR+2,0
340 VPOKE 1,SR+3,0
345 END
350 REM -------------------------------------------------
355 REM
360 REM  ENVELOPE INTERRUPT
365 REM
370 REM -------------------------------------------------
375 I=0 :REM VOICE 0 ONLY
380 A7 = PEEK(A1 + I)
385 A8 = PEEK(A2 + I)
390 SR = SG + 16 * I
395 V = VPEEK(1,SR+2) AND 63
400 REM SKIP IF THIS IS IN A FINAL STATE
405 IF A7 = ASC("X") GOTO 645
410 IF A7 = 65 GOTO 495
415 IF A7 = 68 GOTO 530
420 IF A7 = 83 GOTO 565
425 IF A7 = 82 GOTO 600
430 IF A7 = 255 GOTO 635
435 REM
440 REM INITIALIZE 
445 REM
450 PRINT "INITIALIZE" A8
455 POKE A1 + I, 65
460 POKE A2 + I, V
465 VPOKE 1, SR+2, 0+LR
470 A7 = 65
475 A8 = PEEK(A3)
480 REM
485 REM ATTACK
490 REM
495 IF V = A8 THEN A7 = 68 :A8 = PEEK(A4) :GOTO 530
500 PRINT "ATTACK " V " " A8 
505 VPOKE 1, SR+2, V+1+LR
510 GOTO 645
515 REM
520 REM DECAY
525 REM
530 IF V = A8 THEN A7 = 83 :A8 = PEEK(A5) :GOTO 565
535 PRINT "DECAY  " V " " A8 
540 VPEEK 1, SR+2, V-1
545 GOTO 645
550 REM
555 REM SUSTAIN
560 REM
565 IF A8 = 0 THEN A7 = 82 :A8 = PEEK(A6) :GOTO 600
570 PRINT "SUSTAIN" A8 
575 POKE A2 + I, A8 - 1
580 GOTO 645
585 REM
590 REM RELEASE
595 REM
600 IF V = 0 THEN A7 = 255 :GOTO 635
605 PRINT "RELEASE" V
610 VPOKE 1, SR+2, V-1+LR
615 GOTO 645
620 REM
625 REM FINALIZE
630 REM
635 PRINT "FINALIZED"
640 VPOKE 1, SR+2, 0+LR
645 RETURN
