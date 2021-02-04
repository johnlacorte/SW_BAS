SCREEN 12
DIM tie(100, 100)
REM   ---Charakterwerte holen------
DIM skill$(80), skill(80), cargo$(30)
OPEN "inter.bas" FOR INPUT AS #1
INPUT #1, name$
INPUT #1, ship$
FOR i = 1 TO 80
INPUT #1, skill$(i)
INPUT #1, skill(i)
NEXT i
FOR i = 1 TO 6
INPUT #1, stat$(i)
INPUT #1, stat(i)
NEXT i
INPUT #1, file$
INPUT #1, cred: INPUT #1, weap$
INPUT #1, dam, rebel, imper, jabba, x, y, rancor
INPUT #1, planet$
FOR i = 1 TO 10
INPUT #1, item$(i)
NEXT i
INPUT #1, file$
INPUT #1, ac$: INPUT #1, ac, glid, start, schau, time, xp, ship, lost, lobot
INPUT #1, health$
INPUT #1, combat$
INPUT #1, status$
INPUT #1, cannon, speed
INPUT #1, mis1, mis2, mis3, mis4, mis5
INPUT #1, mis6, mis7, mis8, mis9, mis10
INPUT #1, mis11, mis12, mis13, mis14, mis15
INPUT #1, mis16, mis17, mis18, mis19, mis20
INPUT #1, mis21, mis22, mis23, mis24, mis25
FOR i = 1 TO 30
INPUT #1, cargo$(i)
NEXT i
CLOSE #1
CLS

COLOR 15
p = 0
LINE (600 + p, 200)-(50 + p, 250)
LINE (600 + p, 200)-(50 + p, 170)
LINE -(70 + p, 200)
LINE -(50 + p, 250)
LINE (70 + p, 200)-(600 + p, 200)
LINE (50 + p, 170)-(80 + p, 130)
DRAW "r20e2r30d30l10f10r60f2r20f9"
CIRCLE (120 + p, 119), 9
PSET (100 + p, 130)
DRAW "g28r50"
LINE (120 + p, 128)-(120 + p, 119)
LINE (115 + p, 128)-(115 + p, 121)
LINE (125 + p, 128)-(125 + p, 121)
PSET (65 + p, 192)
DRAW "g2d17f2"
PSET (57 + p, 180)
DRAW "g3d43f3"
GET (49, 110)-(601, 250), tie
CLS
FOR i = 1 TO 80
RANDOMIZE TIMER
rech:
RANDOMIZE TIMER
col = INT(RND * 15) + 1
RANDOMIZE TIMER: a = INT(RND * 639) + 1
RANDOMIZE TIMER: b = INT(RND * 410) + 1
IF a > (620 - 87 * 2) AND b < 87 * 2 THEN GOTO rech
PSET (a, b), col
NEXT i
FOR i = 0 TO 87
CIRCLE (620, 0), i * 2, 4
PUT (i, 210), tie, PSET
NEXT i
COLOR 1
GOSUB loki
PRINT "From your cabin, you can see an enormous star-destroyer..."
GOSUB schleife
GOSUB loki: COLOR 2
PRINT "'This is ISD Invincible ! Welcome, "; ship$; ".": GOSUB schleife: GOSUB loki
PRINT "I am Grand Admiral Thrawn, master of the Emperor's fleet. The Emperor wishes": GOSUB schleife: GOSUB loki
PRINT "to see you on the Invincible. Prepare to be escorted to our hangar-deck.'": GOSUB schleife: GOSUB loki: COLOR 7
PRINT "Then the comm falls silent and two Ties leave the hangar of the "; : COLOR 4: PRINT "Invincible"; : COLOR 7: PRINT "."
GOSUB schleife: mis9 = -2
GOSUB saver: RUN "space.bas"

loki:
LOCATE 28, 2: PRINT "                                                                            "
LOCATE 28, 2
RETURN
schleife:
DO WHILE INKEY$ = "": LOOP
RETURN
REM ---------Saver Subroutine
saver:
OPEN "inter.bas" FOR OUTPUT AS #1
PRINT #1, name$
PRINT #1, ship$
FOR i = 1 TO 80
PRINT #1, skill$(i)
PRINT #1, skill(i)
NEXT i
FOR i = 1 TO 6
PRINT #1, stat$(i)
PRINT #1, stat(i)
NEXT i
PRINT #1, file$
PRINT #1, cred: PRINT #1, weap$
PRINT #1, dam, rebel, imper, jabba, x, y, rancor
PRINT #1, planet$
FOR i = 1 TO 10
PRINT #1, item$(i)
NEXT i
PRINT #1, file$
PRINT #1, ac$: PRINT #1, ac, glid, start, schau, time, xp, ship, lost, lobot
PRINT #1, health$
PRINT #1, combat$
PRINT #1, status$
PRINT #1, cannon, speed
PRINT #1, mis1, mis2, mis3, mis4, mis5
PRINT #1, mis6, mis7, mis8, mis9, mis10
PRINT #1, mis11, mis12, mis13, mis14, mis15
PRINT #1, mis16, mis17, mis18, mis19, mis20
PRINT #1, mis21, mis22, mis23, mis24, mis25
FOR i = 1 TO 30
PRINT #1, cargo$(i)
NEXT i
CLOSE #1
RETURN

