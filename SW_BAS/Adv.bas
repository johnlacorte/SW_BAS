REM ----Advancement tables
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
REM -------
CLS : s = 1
COLOR 4: PRINT "Your character did well, so far..."
IF xp > 18000 THEN xp = xp - 18000: GOTO stathoch
xp = xp - 1000
skillhoch:
COLOR 7:
IF s >= 7 THEN s = 1
IF s = 1 THEN an = 1: en = 17
IF s = 2 THEN an = 18: en = 29
IF s = 3 THEN an = 30: en = 47
IF s = 4 THEN an = 48: en = 57
IF s = 5 THEN an = 58: en = 62
IF s = 6 THEN an = 63: en = 80
PRINT stat$(s); "-related skills:"
FOR i = an TO en
PRINT STR$(i); "."; skill$(i); ":"; STR$(skill(i) + lost); "D"
NEXT i: a = 0
INPUT "Raise which skill by one Die (99 to Cancel) "; a
pr = 0
IF a = 99 THEN COLOR 4: PRINT "SO MOTE IT BE ...": xp = xp + 1000: GOSUB saver: RUN file$
IF a = 0 THEN s = s + 1: CLS : GOTO skillhoch
IF a < an OR a > en THEN BEEP: CLS : GOTO skillhoch
IF a = 10 AND skill(10) = 0 THEN COLOR 4: PRINT "No way !": GOSUB schleife: CLS : GOTO skillhoch
IF a = 74 THEN COLOR 4: PRINT "No way !": GOSUB schleife: CLS : GOTO skillhoch
IF skill(a) + lost >= 13 THEN COLOR 4: PRINT "It costs 4000 to raise beyond 13.": pr = 3000: GOSUB frage: GOTO quirk
IF skill(a) + lost >= 10 THEN COLOR 4: PRINT "It costs 2000 to raise beyond 10 D.": pr = 1000: GOSUB frage: GOTO quirk
quirk:
IF pr > xp THEN COLOR 2: PRINT "Sorry ! You only have"; xp + 1000; "XP left.": GOSUB schleife: CLS : GOTO skillhoch
xp = xp - pr
skill(a) = skill(a) + 1
GOTO ende
stathoch:
FOR i = 1 TO 6
PRINT "          "; STR$(i); "."; stat$(i); ":"; STR$(stat(i) + lost); "D"
NEXT i
COLOR 7
PRINT : INPUT "Raise which stat (99 to raise a skill instead) "; s
IF s = 99 THEN xp = xp + 17000: CLS : GOTO skillhoch
IF s > 6 OR s < 1 THEN BEEP: CLS : COLOR 4: GOTO stathoch
an = 0
IF s = 1 THEN an = 1: en = 17
IF s = 2 THEN an = 18: en = 29
IF s = 3 THEN an = 30: en = 47
IF s = 4 THEN an = 48: en = 57
IF s = 5 THEN an = 58: en = 62
IF s = 6 THEN an = 63: en = 80
IF an = 0 THEN BEEP: COLOR 4: GOTO stathoch
IF s = 5 AND stat(s) >= 4 THEN COLOR 4: PRINT "Strength may not be raised beyond"; stat(s); "D.": GOSUB schleife: CLS : GOTO stathoch
stat(s) = stat(s) + 1
FOR i = an TO en
IF i = 10 AND skill(i) = 0 THEN skill(i) = -1
IF i = 74 THEN skill(i) = skill(i) - 1
skill(i) = skill(i) + 1
NEXT i
PRINT "With this, skills"; an; "to"; en; "are raised by one D as well."
IF s = 5 AND weap$ = "Vibro Axe" THEN dam = 3 + stat(s) + lost: PRINT "Your Vibro Axe now hits for"; STR$(dam); "D."
ende:
PRINT "When you are ready to return to the game, just push a key."
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
DO WHILE INKEY$ = "": LOOP
RUN file$

schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

frage:
PRINT "Still raise the skill (y/n)?"
fr:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN RETURN
IF a$ = "n" OR a$ = "N" THEN CLS : RETURN skillhoch
BEEP: GOTO fr

