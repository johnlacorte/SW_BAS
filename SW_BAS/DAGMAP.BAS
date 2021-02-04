REM ----------------Dagobah:
DIM map1(100, 100)
DIM map2(100, 100)
DIM map$(56, 19)
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
file$ = "dagmap.bas"
combat$ = ""
SCREEN 12: CLS
map1:
DATA "wwwwwwwwwwwwww00000000000000000wwwwwww0www000wwwwwwwwww"
DATA "wwwwwwww0www000000wwwww00000wwwww0000wwwwwwww00wwwww0ww"
DATA "wwww0000wwww0www0000wwww0000000000ww00000wwww000ww00www"
DATA "wwwwwww0000wwww0000wwwww00000www000000000000w0000wwwwww"
DATA "ww000000ww0000wwwww10000www00000000ww00www00000wwww0www"
DATA "www000000000000111111000000www000ww11w000000wwwwww000ww"
DATA "ww000wwwwwwwwww001110000000000www11111w0w0wwwwww00w00ww"
DATA "ww0000000110000wwww000wwww11www11111111w0wwwwwww000w00w"
DATA "www00w0011110000000www111wwwwwwwww111wwxww0ww0w0ww00000"
DATA "ww00000001100000000000wwwww1wwwwwwwwwwwwwww00w0w00ww0ww"
DATA "ww0wwwww000w0000000wwwwwww11111ww1wwwww111wwww00000w000"
DATA "www00001wwwwwwww0wwww0ww00wwwwww1www0w11111ww0wwww00ww0"
DATA "wwww0Y111000wwwwwww0ww0000ww0000wwwww0wwwwwcwwwwww0ww0w"
DATA "wwwwwww1wwwww0000www000wwwwww000www0000000www00www0wwww"
DATA "ww00000010000wwww000wwwww000000wwwwww0000wwww000ww000ww"
DATA "w000000000000000wwwwww0000000wwww00000wwww0wwww00ww0www"
DATA "wwwww0000wwwwwwwwwwwwwww000000ww0ww000www0www0ww00wwwww"
DATA "wwwwwwwwwwwwwwwwwwwwwwwwwwww0000wwwwwww00www00wwwwwwwww"
RESTORE map1
FOR i = 1 TO 18
READ a$
FOR a = 1 TO 55
map$(a, i) = MID$(a$, a, 1): c = 10
IF map$(a, i) = "1" THEN c = 1
IF map$(a, i) = "x" THEN c = 4
IF map$(a, i) = "w" THEN c = 2
IF map$(a, i) = "Y" AND mis14 < 0 THEN c = 4
LINE ((a * 8) - 8, (i * 16) - 16)-(a * 8, i * 16), c, BF
COLOR 0: PSET (a * 8 - 6, i * 16 - 10): PSET (a * 8 - 2, i * 16 - 4)
IF map$(a, i) = "c" AND mis14 < -1 THEN CIRCLE (a * 8 - 4, i * 16 - 8), 4, 0: PAINT (a * 8 - 4, i * 16 - 8), 0
NEXT a
NEXT i: op = 0
GET (0, 0)-(440, 150), map1
GET (0, 151)-(440, 288), map2
opf = 1

map:
IF opf = 0 THEN CLS  ELSE opf = 0
PUT (0, 0), map1, PSET
PUT (0, 151), map2, PSET

REM --------Routine
routine:
RANDOMIZE TIMER: a = INT(RND * 7) + 1
IF op = 1 AND a = 1 THEN GOTO begegnung
op = 0
COLOR 7: LOCATE y, x: PRINT "X"
GOSUB unten
a$ = ""
COLOR 4
IF map$(x, y) = "Y" AND mis14 < 0 THEN a$ = "You are standing outside a small hut."
IF map$(x, y) = "x" AND ship = -1 THEN a$ = "You are standing beside the " + ship$ + "."
IF map$(x, y) = "x" AND ship = -2 THEN a$ = "You are standing near your DROP-SHUTTLE."
IF map$(x, y) = "w" THEN a$ = "Strange sounds are echoing through this jungle."
IF map$(x, y) = "c" AND mis14 < -1 THEN a$ = "A sinister, foul-smelling cave is here."
IF a$ = "" THEN COLOR 2: PRINT "Strange sounds echo across the plains."
PRINT a$
COLOR 7: e = 0
PRINT "    8,6,2,4 to move about": e = 0
COLOR 4: PRINT "    V"; : COLOR 7: PRINT "iew Character"
COLOR 4: PRINT "    U"; : COLOR 7: PRINT "se an item"
PRINT "    Use a "; : COLOR 4: PRINT "S"; : COLOR 7: PRINT "kill"
PRINT "    Save "; : COLOR 4: PRINT "G"; : COLOR 7: PRINT "ame"
COLOR 4: IF map$(x, y) = "x" THEN e = -1: PRINT "    E"; : COLOR 7: PRINT "nter your ship."
COLOR 4: IF map$(x, y) = "Y" AND mis14 < 0 THEN e = -1: PRINT "    E"; : COLOR 7: PRINT "nter the hut."
COLOR 4: IF map$(x, y) = "c" AND mis14 < -1 THEN e = -1: PRINT "    E"; : COLOR 7: PRINT "nter the cave."
COLOR 1: LOCATE 24, 30: PRINT "    Q"; : COLOR 7: PRINT "uit Game"
a = time
DO WHILE a >= 100: a = a - 100: LOOP
a$ = ":" + STR$(a)
b$ = STR$(time)
IF LEN(b$) <= 3 THEN a$ = "00 " + a$
IF LEN(b$) = 4 THEN a$ = LEFT$(b$, 2) + a$
IF LEN(b$) = 5 THEN a$ = LEFT$(b$, 3) + a$
LINE (480, 0)-(640, 290), 0, BF
LOCATE 2, 60: COLOR 1: PRINT "Time "; : COLOR 2: PRINT a$
a$ = ""
DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "e" AND e = -1 THEN GOTO enter
IF a$ = "E" AND e = -1 THEN GOTO enter
IF a$ = "8" OR a$ = "6" OR a$ = "2" OR a$ = "4" THEN GOTO mover
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "Q" OR a$ = "q" THEN RUN "starwars.bas"
IF a$ = "G" OR a$ = "g" THEN GOTO savgam
GOTO routine

items:
CLS : COLOR 14
PRINT "Your backpack:"
PRINT "--------------": COLOR 7
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT " Which item "; a
IF a > 10 THEN a = 0
IF a < 1 OR a > 10 OR item$(a) = "" THEN COLOR 2: PRINT "What a sophisticated joke...": DO WHILE INKEY$ = "": LOOP: GOTO map
herrlich:
COLOR 4: PRINT "U"; : COLOR 7: PRINT "se / "; : COLOR 4: PRINT "D"; : COLOR 7: PRINT "rop / "; : COLOR 4: PRINT "R"; : COLOR 7: PRINT "earrange"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "u" OR a$ = "U" THEN GOTO herrlicher
IF a$ = "d" OR a$ = "D" THEN item$(a) = "": GOTO map
IF a$ = "r" OR a$ = "R" THEN GOTO rearrange
GOTO herrlich
rearrange:
INPUT "Change place with (1-10) "; b
IF b < 1 OR b > 10 THEN GOTO rearrange
SWAP item$(a), item$(b)
GOTO map
herrlicher:
CLS : GOSUB unten
PUT (0, 0), map1
PUT (0, 151), map2
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "Macrobinoculars" THEN GOTO schauen
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Lightsaber" THEN GOTO changweap
IF item$(a) = "Life-form Scanner" THEN GOTO scan
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO map
scan:
GOSUB unten
IF mis14 < 0 THEN PRINT "You detect no more intelligent life on this planet.": GOSUB schleife: GOTO map
mis14 = -1
PRINT "There is one spot on your scanner that could contain intelligent life.": PRINT "  Maybe it's worth looking after it."
GOSUB schleife
GOTO map1
schauen:
GOSUB unten
time = time + 1
PRINT "You scan the Horizon and see ";
DATA"nothing special."
DATA"a few birds west of your position."
DATA"nothing special."
DATA"space, the final frontier..."
DATA"nothing at all."
DATA"strange birds, chasing each other."
RANDOMIZE TIMER: RESTORE schauen
a = INT(RND * 7) + 1
FOR i = 1 TO a: READ a$: NEXT i
PRINT a$
GOSUB schleife: GOTO map
changweap:
b = 0
INPUT "Use this as your main weapon (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO map
IF a$ = "y" OR a$ = "Y" THEN SWAP weap$, item$(a): b = 1
IF b = 0 THEN GOTO changweap
IF weap$ = "SC-75 Rifle" THEN dam = 8
IF INSTR(weap$, "Hold-out Blaster") <> 0 THEN dam = 3
IF INSTR(weap$, "Blaster Rifle") <> 0 THEN dam = 6
IF INSTR(weap$, "Blaster Pistol") <> 0 THEN dam = 4
IF INSTR(weap$, "Heavy Blaster") <> 0 THEN dam = 5
IF weap$ = "Vibro Axe" THEN dam = 3 + stat(5)
IF weap$ = "Lightsaber" THEN dam = 10
IF INSTR(weap$, "modified") <> 0 THEN dam = dam + 1
GOTO map
changarm:
b = 0
INPUT "Use this as you main armor (y/n)"; a$
IF a$ = "N" OR a$ = "n" THEN GOTO map
IF a$ = "Y" OR a$ = "y" THEN SWAP ac$, item$(a): b = 1
IF item$(a) = "Nothing" THEN item$(a) = ""
IF b = 0 THEN GOTO changarm
IF INSTR(ac$, "Blast armor") <> 0 THEN ac = 2
IF INSTR(ac$, "Blast vest") <> 0 THEN ac = 1
IF INSTR(ac$, "Battle") <> 0 THEN ac = 4
IF INSTR(ac$, "damaged") <> 0 THEN ac = ac - 1
GOTO map

enter:
IF map$(x, y) = "x" THEN GOSUB saver: GOSUB unten: PRINT "You blast up into the sky.": GOSUB schleife: RUN "space.bas"
IF map$(x, y) = "Y" THEN GOSUB saver: GOSUB unten: PRINT "You enter the small hut...": GOSUB schleife: RUN "ye.bas"
IF map$(x, y) = "c" AND mis14 < -1 THEN GOSUB saver: GOSUB unten: PRINT "You enter a foul smelling cave...": GOSUB schleife: RUN "ct.bas"

mover:
a = x: b = y
IF a$ = "8" THEN c = x: d = y - 1
IF a$ = "6" THEN c = x + 1: d = y
IF a$ = "2" THEN c = x: d = y + 1
IF a$ = "4" THEN c = x - 1: d = y
IF c < 1 OR c > 55 OR d < 1 OR d > 18 THEN GOTO routine
IF map$(c, d) = "1" THEN COLOR 7: LOCATE 26, 3: PRINT "You stand in front of a dirty lake.": GOSUB schleife: GOTO routine
o = 10: op = 1
IF map$(x, y) = "x" THEN o = 4
IF map$(x, y) = "w" THEN o = 2
IF map$(x, y) = "1" THEN o = 1
IF map$(x, y) = "Y" AND mis14 < 0 THEN o = 4
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), o, BF
IF map$(x, y) = "c" AND mis14 < -1 THEN CIRCLE (x * 8 - 4, y * 16 - 8), 4, 0: PAINT (x * 8 - 4, y * 16 - 8), 0
time = time + 600
RANDOMIZE TIMER
time = time + INT(RND * 60) + 1
IF time > 2400 THEN time = time - 2400
COLOR 0: PSET (x * 8 - 6, y * 16 - 10): PSET (x * 8 - 2, y * 16 - 4)
x = c: y = d: GOTO routine

begegnung:
a$ = " A random encounter ! "
LINE (220, 220)-(435, 245), 4, BF
COLOR 7
LOCATE 15, 31: PRINT a$
GOSUB saver: GOSUB schleife: RUN "fight.bas"

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

REM ---------Save Game
savgam:
GOSUB unten
f$ = ""
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
IF f$ = "" THEN GOTO savgam
OPEN f$ FOR OUTPUT AS #1
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
GOTO routine

schleife:
DO WHILE INKEY$ = "": LOOP: RETURN

REM -----verwundet!!!
verwundet:
IF lost < 0 THEN lost = 0
IF lost > 6 THEN health$ = "dying"
IF lost < 7 THEN health$ = "seriously wounded"
IF lost < 4 THEN health$ = "wounded"
IF lost = 1 THEN health$ = "slightly wounded"
IF lost = 0 THEN health$ = "Okay"
a = lost - haha
FOR i = 1 TO 6
stat(i) = stat(i) - a
NEXT i
FOR i = 1 TO 80
skill(i) = skill(i) - a
NEXT i
RETURN

REM ----heilung
heilen:
COLOR 4: IF lost <= 0 THEN PRINT "You are not wounded!!!!": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO map
diff = lost * 3
akt = skill(74) + skill(71)
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB verwundet: DO WHILE INKEY$ = "": LOOP: GOTO map
COLOR 2: PRINT "The medpac did not help you."
DO WHILE INKEY$ = "": LOOP: GOTO map

REM --------------Roll dice
roll:
rolled = 0
FOR i = 1 TO akt
RANDOMIZE TIMER
a = INT(RND * 6) + 1
IF a = 6 AND i = 1 THEN i = i - 1
IF a = 1 AND i = 1 THEN i = i + 1: a = 0
IF akt = 0 THEN akt = 1
rolled = rolled + a
NEXT i
RETURN

REM --------ad bild
unten:
LINE (0, 289)-(640, 480), 0, BF
LOCATE 20, 3: COLOR 7
RETURN

REM ---------View character
viewchar:
CLS : COLOR 4
PRINT name$: COLOR 7
PRINT "_________________________________________________________"
FOR i = 1 TO 3
LOCATE 2 + i, 10: PRINT stat$(i); ":"; stat(i) + lost; "D"
NEXT i
FOR i = 4 TO 6
LOCATE i - 1, 40: PRINT stat$(i); ":"; stat(i) + lost; "D"
NEXT i
PRINT "_________________________________________________________"
PRINT "Your condition is ";
IF health$ = "Okay" THEN COLOR 2 ELSE COLOR 4
PRINT health$; : IF lost > 0 THEN PRINT " ( -"; STR$(lost); " D )" ELSE PRINT
COLOR 7
PRINT "_________________________________________________________"
PRINT "Your weapon is :"; weap$; " which hits for"; dam; "D."
PRINT "Your armor is :"; ac$; " which protects you with"; ac; "D."
PRINT "_________________________________________________________"
PRINT "You own"; cred; "Credits and the following items:"
FOR i = 1 TO 10
IF rancor <> i THEN PRINT i; "."; item$(i)
IF rancor = i THEN COLOR 4: PRINT i; ".seems this item has been stolen": rancor = 0
COLOR 7
NEXT i
COLOR 14: PRINT "You have"; xp; "XP left.": COLOR 7
PRINT "Push 's' key to view skill list."
a$ = "": DO WHILE a$ = "": a$ = INKEY$
LOOP
IF a$ <> "s" AND a$ <> "S" THEN CLS : GOTO map

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
GOSUB schleife
NEXT s

CLS : GOTO map

skills:
GOSUB unten
PRINT "If you know the number of the desired skill, then just enter it here."
PRINT "If you don't know it, just enter '0' to choose from the list."
INPUT "Your Command"; a
IF a < 0 OR a > 80 THEN GOSUB unten: GOTO skills
IF a > 0 THEN GOTO chosen
c = 1: FOR a = 1 TO 4
CLS : c = 0
FOR i = 1 TO 20
b = a * 20 + (i - 20)
c = c + 1: IF c = 3 THEN c = 1
COLOR c + 1
PRINT b; "."; skill$(b); "("; skill(b); "D)"
NEXT i
DO WHILE INKEY$ = "": LOOP
NEXT a
COLOR 7
wunsch:
INPUT "So what is your desire (1-80)"; a
IF a < 1 OR a > 80 THEN CLS : GOTO wunsch
chosen:
CLS : GOSUB unten
PUT (0, 0), map1
PUT (0, 151), map2
IF a = 64 THEN GOTO plaster
IF a = 63 THEN GOTO armor
PRINT "Of no use.": GOSUB schleife: GOSUB unten: GOTO routine

armor:
a = 0: FOR i = 1 TO 10
IF item$(i) = "Armor parts" THEN a = i
NEXT i
COLOR 4: IF a = 0 THEN PRINT "No replacement parts !": GOSUB schleife: GOTO map
IF INSTR(ac$, "damaged") = 0 THEN PRINT "Your main armor is not damaged !": GOSUB schleife: GOTO map
diff = 16: akt = skill(63): item$(a) = ""
GOSUB roll
IF rolled < diff THEN PRINT "It is still damaged !": GOSUB schleife: GOTO map
PRINT "You did it !": ac = ac + 1
IF INSTR(ac$, "vest") <> 0 THEN ac$ = "Blast vest"
IF INSTR(ac$, "armor") <> 0 THEN ac$ = "Blast armor"
IF INSTR(ac$, "Battle") <> 0 THEN ac$ = "Battle suit"
GOSUB schleife
GOTO map

plaster:
COLOR 4
a = 0: FOR i = 1 TO 10
IF item$(i) = "Blaster parts" THEN a = i
NEXT i
IF a = 0 THEN PRINT "You have no replacement parts !": GOSUB schleife: GOTO map
parts = a
IF INSTR(1, weap$, "modified") <> 0 THEN PRINT "Your main-weapon is modified to its limits !": GOSUB schleife: GOTO map
IF weap$ = "SC-75 Rifle" THEN PRINT "You can't modify a firearm !": GOSUB schleife: GOTO map
IF weap$ = "Vibro Axe" THEN PRINT "You can't modify a hand-to-hand-weapon !": GOSUB schleife: GOTO map
IF weap$ = "Lightsaber" THEN PRINT "You can't modify a Lightsaber !": GOSUB schleife: GOTO map
diff = dam * 5: item$(parts) = ""
akt = skill(64): GOSUB roll
IF rolled < diff THEN PRINT "Seems it didn't work.": GOSUB schleife: GOTO map
dam = dam + 1: weap$ = "modified " + weap$
PRINT "Yeah ! That's it!"
GOSUB schleife: GOTO map

