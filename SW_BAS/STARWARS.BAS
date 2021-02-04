REM -----------------The Beginning is a very delicate time-----------
SCREEN 12
ON ERROR GOTO fehler
auswahl:
CLS : COLOR 2
LOCATE 12, 30: PRINT "S"; : COLOR 7: PRINT "tart a new Game"
COLOR 2
LOCATE 14, 30: PRINT "L"; : COLOR 7: PRINT "oad a saved Game"
COLOR 2
LOCATE 16, 30: PRINT "Q"; : COLOR 7: PRINT "uit to DOS"
COLOR 2
LOCATE 18, 30: PRINT "V"; : COLOR 7: PRINT "iew a Saved Game"
schleife:
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
IF a$ = "S" OR a$ = "s" THEN RUN "starchar.bas"
IF a$ = "L" OR a$ = "l" THEN GOTO loadgame
IF a$ = "q" OR a$ = "Q" THEN SCREEN 0: CLS : SYSTEM
IF a$ = "v" OR a$ = "V" THEN GOTO viewgame
GOTO schleife
loadgame:
REM   ---Charakterwerte holen------
CLS
f$ = ""
LOCATE 15, 30
COLOR 2: PRINT "Which Slot (A-H)"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "a" OR a$ = "A" THEN f$ = "a.bas"
IF a$ = "b" OR a$ = "B" THEN f$ = "b.bas"
IF a$ = "c" OR a$ = "C" THEN f$ = "c.bas"
IF a$ = "d" OR a$ = "D" THEN f$ = "d.bas"
IF a$ = "e" OR a$ = "E" THEN f$ = "e.bas"
IF a$ = "f" OR a$ = "F" THEN f$ = "f.bas"
IF a$ = "g" OR a$ = "G" THEN f$ = "g.bas"
IF a$ = "h" OR a$ = "H" THEN f$ = "h.bas"
IF f$ = "" THEN GOTO loadgame
DIM skill(80), skill$(80), cargo$(30)
OPEN f$ FOR INPUT AS #1
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
LOCATE 12, 25: PRINT name$; " is back again !!!!"
COLOR 7
IF stat(5) > 4 THEN COLOR 2: GOSUB stats
IF ship = -1 AND cannon > 6 THEN cannon = 6: LOCATE 13, 15: COLOR 4: PRINT "The cannon-bug is fixed. 6D only. Sorry, Sir."
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

stats:
GOSUB schleife1
CLS : COLOR 4
PRINT "But stop !": PRINT "What do I see here ?"
PRINT "Your strength is"; stat(5); "D !"
PRINT "In this version, the strength of your character may not exceed 4 !!!"
a = stat(5) - 4: GOSUB schleife1
FOR i = 1 TO a
haha:
CLS
COLOR 7
FOR b = 1 TO 6: PRINT b; "."; stat$(b); ":"; stat(b)
NEXT b
INPUT "Where do you want to put a die instead "; c
IF c = 5 OR c < 1 OR c > 6 THEN GOTO haha
stat(c) = stat(c) + 1: stat(5) = stat(5) - 1
IF c = 1 THEN an = 1: en = 17
IF c = 2 THEN an = 18: en = 29
IF c = 3 THEN an = 30: en = 47
IF c = 4 THEN an = 48: en = 57
IF c = 6 THEN an = 63: en = 80
PRINT "Raising skills"; an; "-"; en; "."
FOR u = an TO en
skill(u) = skill(u) + 1
NEXT u
PRINT "Lowering skills 58 - 62 ."
FOR u = 58 TO 62
skill(u) = skill(u) - 1
NEXT u
GOSUB schleife1
NEXT i
CLS
LOCATE 12, 25: COLOR 2: PRINT "Now you are back again !"
RETURN

schleife1:
DO WHILE INKEY$ = "": LOOP
RETURN

fehler:
IF ERR = 55 THEN CLOSE #1: RESUME
IF ERR = 62 THEN GOTO dateialt
IF ERR = 53 THEN CLS  ELSE CLS : COLOR 4: PRINT "Unerwarteter Fehler.": END
COLOR 4
LOCATE 16, 25: PRINT "This Saved-Game does not exist !"
GOSUB schleife1
RESUME auswahl

viewgame:
CLS
f$ = ""
LOCATE 15, 30
COLOR 2: PRINT "View which Slot (A-H)"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "a" OR a$ = "A" THEN f$ = "a.bas"
IF a$ = "b" OR a$ = "B" THEN f$ = "b.bas"
IF a$ = "c" OR a$ = "C" THEN f$ = "c.bas"
IF a$ = "d" OR a$ = "D" THEN f$ = "d.bas"
IF a$ = "e" OR a$ = "E" THEN f$ = "e.bas"
IF a$ = "f" OR a$ = "F" THEN f$ = "f.bas"
IF a$ = "g" OR a$ = "G" THEN f$ = "g.bas"
IF a$ = "h" OR a$ = "H" THEN f$ = "h.bas"
IF f$ = "" THEN GOTO loadgame
OPEN f$ FOR INPUT AS #1
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
COLOR 4
PRINT name$: COLOR 7
PRINT "_________________________________________________________"
FOR i = 1 TO 3
LOCATE 2 + i, 10: PRINT stat$(i); ":"; stat(i) + lost; "D"
NEXT i
FOR i = 4 TO 6
LOCATE i - 1, 40: PRINT stat$(i); ":"; stat(i) + lost; "D"
NEXT i
PRINT "_________________________________________________________"
PRINT name$; "'s condition is ";
IF health$ = "Okay" THEN COLOR 2 ELSE COLOR 4
PRINT health$; : IF lost > 0 THEN PRINT " ( -"; STR$(lost); " D )" ELSE PRINT
COLOR 7
PRINT "_________________________________________________________"
PRINT "His weapon is :"; weap$; " which hits for"; dam; "D."
PRINT "His armor is :"; ac$; " which protects him with"; ac; "D."
PRINT "_________________________________________________________"
PRINT "He owns"; cred; "Credits and the following items:"
FOR i = 1 TO 10
IF rancor <> i THEN PRINT i; "."; item$(i)
IF rancor = i THEN COLOR 4: PRINT i; ".seems this item has been stolen": rancor = 0
COLOR 7
NEXT i
COLOR 14: PRINT name$; " has"; xp; "XP at the moment (-inofficial estimate)": COLOR 7
IF file$ = "space.bas" THEN a$ = "in orbit around" ELSE a$ = "on"
PRINT "He is "; a$; " "; : COLOR 4
IF planet$ = "Kosma" THEN PRINT "the galactic wheel.": COLOR 7 ELSE PRINT planet$; ".": COLOR 7
a$ = ""
IF rebel = -2 OR mis7 = -1 THEN COLOR 12: a$ = "He is being tempted by the DARK-SIDE."
IF rebel = -2 AND mis7 = -1 THEN COLOR 4: a$ = "He is being consumed by the DARK-SIDE."
IF mis9 = 0 AND rebel > -2 AND imper = -2 THEN COLOR 1: a$ = "He is a LIGHT-SIDE Character."
IF mis9 < 0 THEN COLOR 4: a$ = "He is a DARK-SIDE Character."
IF a$ = "" THEN COLOR 2: a$ = "He is a NO-SIDE Character."
PRINT a$
PRINT
COLOR 7: PRINT "Push any key to view his adventures."
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP

CLS
COLOR 14: PRINT "          A Chronology of "; name$; "'s adventures:": COLOR 1
PRINT
PRINT name$; "...": COLOR 7
IF jabba = 0 AND rebel > -2 THEN PRINT "...did nothing special, yet."
IF jabba < 0 THEN PRINT "...killed the Rancor."
IF jabba <= -3 THEN PRINT "...killed IG-88 for Jabba."
IF rebel = -2 THEN COLOR 4: PRINT "...gave away the secret rebel-hideout.": COLOR 7
IF lobot = -1 THEN COLOR 2: PRINT "...solved the problems on Cloud city.": COLOR 7
IF lobot = -2 THEN COLOR 4: PRINT "...solved the problems on Cloud city.": COLOR 7
IF mis15 < 0 THEN PRINT "...built his own droid."
IF mis2 < 0 THEN PRINT "...managed to repair the damaged Scout Walker on Hoth."
IF mis1 < -1 THEN PRINT "...destroyed a Wampa-family."
IF imper = -2 THEN COLOR 2: PRINT "...destroyed the Hangar of Echo-Base.": COLOR 7
IF mis4 = -4 THEN PRINT "...killed Glibba the Hutt."
IF jabba <= -9 THEN PRINT "...killed Boba Fett for Jabba."
IF mis5 = -1 THEN COLOR 12: PRINT "...fled the Corvette G'nabgib.": COLOR 7
IF mis5 < -3 THEN COLOR 2: PRINT "...destroyed the Corvette G'nabgib.": COLOR 7
IF mis10 < 0 THEN PRINT "...visited Sullust."
IF mis8 = -3 THEN COLOR 2: PRINT "...found a 'cow' for Fleet-Commander Lrac (Repus).": COLOR 7
IF mis10 = -2 THEN COLOR 2: PRINT "...talked to Lrac at Sullust.": COLOR 7
IF mis7 = -1 THEN COLOR 4: PRINT "...destroyed the ZX-7/2 Factory Station.": COLOR 7
IF mis9 < 0 THEN COLOR 4: PRINT "...was ordered to visit the Emperor on Coruscant.": COLOR 7
IF mis13 < 0 THEN PRINT "...found the location of Dagobah."
IF mis9 <= -2 THEN COLOR 7: PRINT "...visited Coruscant."
IF mis14 = -6 THEN PRINT "...became a Jedi."
IF mis14 = -11 THEN PRINT "...failed to become a Jedi."
IF ship = -2 THEN PRINT "...stole the DEATHWING."
IF ship = -2 THEN COLOR 4: PRINT "...destroyed the Galactic Wheel.": COLOR 7
IF mis20 = -1 THEN COLOR 4: PRINT "...killed the Rebel leaders.": COLOR 7
IF mis21 = -1 THEN COLOR 2: PRINT "...destroyed the Shield Generator on Endor."
IF mis21 = -1 THEN PRINT "...killed Vader and the Emperor.": COLOR 7
PRINT
COLOR 14: PRINT "Push 's' key to view "; name$; "'s skills.": COLOR 7
a$ = "": DO WHILE a$ = "": a$ = INKEY$
LOOP
IF a$ <> "s" AND a$ <> "S" THEN GOTO auswahl
FOR s = 1 TO 6
CLS
IF s = 1 THEN an = 1: en = 17
IF s = 2 THEN an = 18: en = 29
IF s = 3 THEN an = 30: en = 47
IF s = 4 THEN an = 48: en = 57
IF s = 5 THEN an = 58: en = 62
IF s = 6 THEN an = 63: en = 80
COLOR 4: PRINT stat$(s); "-related skills:": COLOR 7
FOR i = an TO en
PRINT STR$(i); "."; skill$(i); ":"; STR$(skill(i) + lost); "D"
NEXT i
GOSUB schleife1
NEXT s

CLS : GOTO auswahl

dateialt:
CLS : COLOR 4
LOCATE 16, 22: PRINT "This Save-Game is obsolete. Run conv.bat"
LOCATE 17, 29: PRINT "from the DOS-prompt"
GOSUB schleife1
RESUME auswahl

