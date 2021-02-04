REM ----------------Minos IV
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
file$ = "minosmap.bas"
combat$ = ""
SCREEN 12: CLS
map1:
DATA "0000000000000000000000000000000000000000000000000000000"
DATA "000000000000000000ddd0000000000000000000000000000000000"
DATA "0000000000h000dddddddddd0000000000000000000000000000000"
DATA "0000000000000ddddddddddddddddd0000000000000000000000000"
DATA "000000000000dddddddLdddddddddddd00000000H00000000000000"
DATA "00000000000dddddddddddddddddddh000000000000000000000000"
DATA "0000000h00000000ddddddddddddd000000h0000000000000000000"
DATA "00000000000000000000dddddddd000000000000000000000000000"
DATA "00000000000000000000000h0000000000000000000h00000000000"
DATA "00000000000h0000000000000000000000000000000000000000000"
DATA "0000000000000000000000000000000000000000000000000000000"
DATA "00000000000000000dddd00dd000000000000000000000000000000"
DATA "0000000000h0000ddddddd0ddd00h000000000h0000000000000000"
DATA "00000000000000000hddddddddd0000000000000000000000000000"
DATA "0000000000000000000ddddddd00000000000000000000000000000"
DATA "000000000000000000000dddd000000000000000000000000000000"
DATA "0000000000000000000000000000000000000000000000000000000"
DATA "0000000000000000000000000000000000000000000000000000000"
RESTORE map1
FOR i = 1 TO 18
READ a$
FOR a = 1 TO 55
map$(a, i) = MID$(a$, a, 1): c = 6
IF map$(a, i) = "d" THEN c = 14
LINE ((a * 8) - 8, (i * 16) - 16)-(a * 8, i * 16), c, BF
COLOR 0: PSET (a * 8 - 6, i * 16 - 10): PSET (a * 8 - 2, i * 16 - 4)
IF map$(a, i) = "h" OR map$(a, i) = "H" THEN CIRCLE ((a * 8) - 4, (i * 16) - 8), 3, 0
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
RANDOMIZE TIMER: a = INT(RND * 10) + 1
IF op = 1 AND a = 1 THEN GOTO begegnung
op = 0
COLOR 7: LOCATE y, x: PRINT "X"
GOSUB unten
breath = 0: FOR i = 1 TO 10
IF item$(i) = "Breathing mask" THEN breath = 1
NEXT i
IF breath = 0 THEN COLOR 4: PRINT "You suffocate due to poison-gas. It takes you about ten minutes to die.": GOSUB schleife: RUN "starwars.bas"
a$ = ""
COLOR 4
IF map$(x, y) = "L" AND ship = -1 THEN a$ = "Your ship is here waiting for you."
IF map$(x, y) = "L" AND ship = -2 THEN a$ = "Your shuttle is here waiting for you."
IF map$(x, y) = "h" THEN a$ = "You are standing in a desolate village. Nobody has been here for months."
IF map$(x, y) = "H" THEN a$ = "You are standing between a few huts, that look quite new."
IF map$(x, y) = "d" THEN a$ = "You are moving through a desert."
IF map$(x, y) = "0" THEN a$ = "Even through your breath-mask, you can smell the foul gas."
PRINT a$
COLOR 7: e = 0
PRINT "    8,6,2,4 to move about": e = 0
COLOR 4: PRINT "    V"; : COLOR 7: PRINT "iew Character"
COLOR 4: PRINT "    U"; : COLOR 7: PRINT "se an item"
PRINT "    Use a "; : COLOR 4: PRINT "S"; : COLOR 7: PRINT "kill"
PRINT "    Save "; : COLOR 4: PRINT "G"; : COLOR 7: PRINT "ame"
COLOR 4: IF map$(x, y) = "H" OR map$(x, y) = "L" OR map$(x, y) = "h" THEN e = -1: PRINT "    E"; : COLOR 7: PRINT "nter."
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
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "Macrobinoculars" THEN GOTO schauen
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO map

schauen:
CLS
PUT (0, 0), map1
PUT (0, 151), map2
GOSUB unten
time = time + 1
PRINT "You scan the Horizon and see ";
DATA"several huts."
DATA"small reptiles moving through the desert."
DATA"nothing special."
DATA"space, the final frontier..."
DATA"nothing at all."
DATA"a huge creature moving among some huts."
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
IF map$(x, y) = "h" THEN GOTO huts
IF map$(x, y) = "H" THEN GOTO village
IF map$(x, y) = "L" THEN GOSUB unten: PRINT "You blast up into the sky...": GOSUB schleife: GOSUB saver: RUN "space.bas"

mover:
a = x: b = y
IF a$ = "8" THEN c = x: d = y - 1
IF a$ = "6" THEN c = x + 1: d = y
IF a$ = "2" THEN c = x: d = y + 1
IF a$ = "4" THEN c = x - 1: d = y
IF c < 1 OR c > 55 OR d < 1 OR d > 18 THEN GOTO routine
o = 6: op = 1
IF map$(x, y) = "d" THEN o = 14
IF map$(x, y) = "0" THEN o = 6
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), o, BF
IF map$(x, y) = "h" OR map$(x, y) = "H" THEN CIRCLE ((x * 8) - 4, (y * 16) - 8), 3, 0
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
IF a = 64 THEN GOTO plaster
IF a = 63 THEN GOTO armor
PRINT "Of no use.": GOSUB schleife: GOSUB unten: GOTO map

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

huts:
GOSUB unten
PRINT "This village seems to be long abondoned. You don't find more than a few"
PRINT "  Tauri-skeletons."
GOSUB schleife: GOSUB unten: GOTO routine

village:
GOSUB unten
IF mis11 < 0 THEN GOTO village1
PRINT "As you search through the village, you are attacked by five bulls."
GOSUB schleife: combat$ = "bulls": GOSUB saver: RUN "fight.bas"
village1:
PRINT "You find nothing special.Seems these bulls were the only inhabitants."
GOSUB schleife: GOTO routine

