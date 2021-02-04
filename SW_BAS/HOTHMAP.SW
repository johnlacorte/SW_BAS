REM ----------------HOTH:
DIM map1(100, 100)
DIM map2(100, 100)
DIM map$(56, 19)
REM   ---Charakterwerte holen------
DIM skill$(80), skill(80), cargo$(30)
OPEN "inter.sw" FOR INPUT AS #1
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
file$ = "hothmap.sw"
SCREEN 12: CLS
map1:
DATA "0000000000000000tt0000000000000000000000000000000000000"
DATA "0000000B00000000tt000000000bbb0000000000b00000000000000"
DATA "0000b00b00000000tt0000b000b0w0bb00000000000000000000000"
DATA "0000000000000000tt0000000b000000bbb00000000000000000000"
DATA "000b000000w00000tt0000000b000b00000b000bbb00b0000000000"
DATA "00000000bb0bb000tt00000000bbb00b0000bbb000b000000000000"
DATA "00000b00bEEEb000tt00000000000000000000b0L00000000000000"
DATA "00000000bEEE0000tt00000000000000000000b000b000000000000"
DATA "00000000bEEEb000tt000000000b00000b00000bbb0000000000000"
DATA "000b000bbbbbb000tt000000000000000000000000000b000000000"
DATA "000000000000b000tt000000000000b000000000b00000000000000"
DATA "00000b0000000000tt0000000000000000000000000b00000000000"
DATA "0000000000b00000tt0000000000000000000000000000000000000"
DATA "000b000b00000000tt00000000000000000000b0000000000000000"
DATA "00000b0000000000tt0000000000000000000b0b0000000b0000000"
DATA "0000000000000000tt000b0000000000000000b00b0000000000000"
DATA "0000000000b00000tt0000000000000b00000000000000000000b00"
DATA "0000000000000000tt000000000000000b000000000000000000000"
RESTORE map1
FOR i = 1 TO 18
READ a$
FOR a = 1 TO 55
map$(a, i) = MID$(a$, a, 1): c = 15
IF map$(a, i) = "0" THEN c = 15
IF map$(a, i) = "L" AND mis9 < 0 AND imper = 0 THEN map$(a, i) = "0"
IF map$(a, i) = "L" THEN c = 9
IF map$(a, i) = "b" THEN c = 7
IF map$(a, i) = "E" THEN c = 1
LINE ((a * 8) - 8, (i * 16) - 16)-(a * 8, i * 16), c, BF
COLOR 0: PSET (a * 8 - 6, i * 16 - 10): PSET (a * 8 - 2, i * 16 - 4)
IF map$(a, i) = "t" THEN LINE (a * 8 - 4, i * 16 - 16)-(a * 8 - 4, i * 16), 0
IF map$(a, i) = "B" AND mis1 < 0 THEN CIRCLE (a * 8 - 4, i * 16 - 8), 4, 0: PAINT (a * 8 - 4, i * 16 - 8), 0
NEXT a
NEXT i: op = 0
COLOR 7
GET (0, 0)-(440, 150), map1
GET (0, 151)-(440, 288), map2
IF combat$ = "wampa" THEN GOTO cave
opf = 1

map:
IF opf = 0 THEN CLS  ELSE opf = 0
PUT (0, 0), map1, PSET
PUT (0, 151), map2, PSET

REM --------Routine
routine:
IF op = 1 THEN uk = 0 ELSE GOTO orsch
FOR i = 1 TO 10
IF item$(i) = "Glowrod" THEN uk = 1
NEXT i
IF uk = 1 THEN GOTO orsch
akt = 6: GOSUB roll
kalt = rolled
akt = stat(5) + ac: GOSUB roll
IF rolled < kalt THEN COLOR 4 ELSE GOTO orsch
haha = lost: lost = lost + 1: GOSUB verwundet: GOSUB unten: COLOR 9: PRINT "You are slowly freezing to death ! You need something to warm you."
IF lost >= 15 THEN COLOR 9: PRINT "You have died from exposure to frost !": GOSUB schleife: RUN "starwars.bas"
GOSUB schleife: GOSUB unten
orsch:
o = 8
RANDOMIZE TIMER: a = INT(RND * o) + 1
IF op = 1 AND a = 1 THEN GOTO begegnung
op = 0
COLOR 7: LOCATE y, x: PRINT "X"
GOSUB unten
a$ = ""
COLOR 2: e = 0
IF map$(x, y) = "w" AND mis2 = -2 AND x < 20 THEN a$ = "Your captured Scout-Walker is here.": e = -1
IF map$(x, y) = "w" AND mis2 = -1 AND x > 20 THEN a$ = "Your captured Scout-Walker is here.": e = -1
IF map$(x, y) = "w" AND mis2 = 0 THEN a$ = "An abandoned Scout-Walker is here.": e = -1
IF map$(x, y) = "t" THEN a$ = "You cross trenches full of Imperial troops.": x = x + 1: combat$ = "troops": GOSUB saver: PRINT a$: COLOR 4: PRINT "   They attack you !!!!": GOSUB schleife: RUN "fight.sw"
IF map$(x, y) = "E" THEN a$ = "You are standing outside ECHO-Base. Snow-Troopers cover the entrance.": e = -1
IF map$(x, y) = "B" THEN a$ = "You are standing outside a cave.": e = -1: IF mis1 = 0 THEN mis1 = -1
IF map$(x, y) = "L" AND ship = -1 THEN a$ = "You are standing at the bottom of a crater. Your ship is here.": e = -1
IF map$(x, y) = "L" AND ship = -2 THEN a$ = "You are standing at the bottom of a crater. Your dropshuttle is here.": e = -1
IF a$ = "" AND uk = 0 THEN PRINT "You are freezing !!!."
IF a$ = "" AND uk = 1 THEN PRINT "The Glowrod warms you in this snowstorm."
COLOR 2: PRINT a$
COLOR 7
PRINT "    8,6,2,4 to move about"
COLOR 4: PRINT "    V"; : COLOR 7: PRINT "iew Character"
COLOR 4: PRINT "    U"; : COLOR 7: PRINT "se an item"
PRINT "    Use a "; : COLOR 4: PRINT "S"; : COLOR 7: PRINT "kill"
PRINT "    Save "; : COLOR 4: PRINT "G"; : COLOR 7: PRINT "ame"
COLOR 4: IF e = -1 THEN PRINT "    E"; : COLOR 7: PRINT "nter."
COLOR 1: LOCATE 24, 30: PRINT "    Q"; : COLOR 7: PRINT "uit Game"
a = time: COLOR 7
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
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "G" OR a$ = "g" THEN GOTO savgam
GOTO routine

enter:
IF map$(x, y) = "L" THEN GOSUB saver: GOSUB unten: PRINT "After cleaning your ship from the snow, you lift off in a blizzard.": GOSUB schleife: RUN "space.sw"
IF map$(x, y) = "B" THEN GOSUB unten: PRINT "You enter the sinister cave.": GOSUB schleife: GOTO cave
IF map$(x, y) = "E" THEN GOSUB saver: GOSUB unten: PRINT "You enter ECHO-Base.": GOSUB schleife: GOTO echobase
IF map$(x, y) = "w" THEN GOTO walker:

echobase:
GOSUB unten
COLOR 4: PRINT "As you enter, you are checked by Army-Troopers...": GOSUB schleife
a = 0: FOR i = 1 TO 10
IF item$(i) = "Security Pass" THEN a = -1
NEXT i
IF a = 0 THEN COLOR 2: PRINT "'Red Alert ! Get this spy! He has no Sec-Pass !!!!'": COLOR 7: PRINT "You are attacked...": GOSUB schleife: combat$ = "troops": GOSUB saver: RUN "fight.sw"
COLOR 2: PRINT "'Your sec-pass is okay, well go in.'": GOSUB schleife
GOSUB saver: RUN "eb.sw"

cave:
combat$ = ""
GOSUB unten
IF mis1 = -1 THEN COLOR 15: PRINT "  You are attacked by Wampa-Ice-creatures !": combat$ = "wampa": GOSUB saver: GOSUB schleife: RUN "fight.sw"
COLOR 7: PRINT "  Bones and skulls are scattered all around the cave."
PRINT "  1.Leave"
PRINT "  2.Search the area"
frg:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO search
GOTO frg
search:
diff = 10
akt = skill(56): IF mis1 = -3 THEN akt = 0
GOSUB roll
IF rolled < diff THEN COLOR 2: PRINT "  You find nothing special.": GOSUB schleife: GOTO cave
COLOR 4: PRINT "  You find an Imperial Security Pass for Echo Base among the remains."
it$ = "Security Pass"
COLOR 7: PRINT "  Take it (y/n)?"
frak:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO cave
IF a$ = "y" OR a$ = "Y" THEN GOTO mhm
GOTO frak
mhm:
CLS
COLOR 14: PRINT "Put the "; it$; " where ?"
COLOR 7: FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
COLOR 14
INPUT "Your Command "; a
IF a < 1 OR a > 10 THEN GOTO mhm
IF item$(a) = "" THEN item$(a) = it$: mis1 = -3: GOTO map
COLOR 4: PRINT "Drop the "; item$(a); " (y/n) ?"
abc:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN item$(a) = it$: mis1 = -3: GOTO map
IF a$ = "n" OR a$ = "N" THEN GOTO mhm
GOTO abc

walker:
GOSUB unten
IF mis2 < 0 THEN COLOR 2: PRINT "Cross the trenches (y/n)?" ELSE GOTO repair
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO jaja
IF a$ = "n" OR a$ = "N" THEN GOTO routine
GOTO walker
jaja:
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), 15, BF
COLOR 0: PSET (x * 8 - 6, y * 16 - 10): PSET (x * 8 - 2, y * 16 - 4)
IF y = 3 THEN x = 11: y = 5: mis2 = -2: GOTO wtrr
IF x = 11 THEN x = 29: y = 3: mis2 = -1
wtrr:
COLOR 4: PRINT "  The troops ignore you as you cross the trenches in the Scout Walker."
PRINT "  When you arrive on the other side, you get out."
GOSUB schleife
GOTO routine
repair:
GOSUB unten
COLOR 4: PRINT "The Walker is damaged !": COLOR 2: PRINT "Try to repair (y/n)?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO riper
GOTO routine
riper:
akt = skill(80): diff = 18: GOSUB roll
FOR i = 1 TO 10
IF item$(i) = "Engineering Kit" THEN diff = 6
NEXT i
IF rolled < diff THEN COLOR 4: PRINT "  No, no, it seems this Vehicle is beyond your knowledge.": GOSUB schleife: GOTO routine
mis2 = -1: PRINT "  Okay, the weapon systems are still broken, but it seems that this baby will"
PRINT "  walk once again."
GOSUB schleife: GOTO routine

begegnung:
a$ = " A random encounter ! "
LINE (220, 220)-(435, 245), 4, BF
COLOR 7
LOCATE 15, 31: PRINT a$
GOSUB saver: GOSUB schleife: RUN "fight.sw"

schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

REM ---------Saver Subroutine
saver:
OPEN "inter.sw" FOR OUTPUT AS #1
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
IF a$ = "a" OR a$ = "A" THEN f$ = "a.sw"
IF a$ = "b" OR a$ = "B" THEN f$ = "b.sw"
IF a$ = "c" OR a$ = "C" THEN f$ = "c.sw"
IF a$ = "d" OR a$ = "D" THEN f$ = "d.sw"
IF a$ = "e" OR a$ = "E" THEN f$ = "e.sw"
IF a$ = "f" OR a$ = "F" THEN f$ = "f.sw"
IF a$ = "g" OR a$ = "G" THEN f$ = "g.sw"
IF a$ = "h" OR a$ = "H" THEN f$ = "h.sw"
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

mover:
a = x: b = y
IF a$ = "8" THEN c = x: d = y - 1
IF a$ = "6" THEN c = x + 1: d = y
IF a$ = "2" THEN c = x: d = y + 1
IF a$ = "4" THEN c = x - 1: d = y
IF c < 1 OR c > 55 OR d < 1 OR d > 18 THEN GOTO routine
IF map$(c, d) = "b" THEN COLOR 7: LOCATE 26, 3: PRINT "You stand before a high rock-cliff.": GOSUB schleife: GOTO routine
o = 15: op = 1
IF map$(x, y) = "L" THEN o = 9
IF map$(x, y) = "E" THEN o = 1
IF map$(x, y) = "B" AND mis1 < 0 THEN o = 15
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), o, BF
IF map$(x, y) = "t" THEN LINE (a * 8 - 4, i * 16 - 16)-(a * 8 - 4, i * 16), 0
IF mis1 < 0 AND map$(x, y) = "B" THEN CIRCLE (x * 8 - 4, y * 16 - 8), 4, 0: PAINT (x * 8 - 4, y * 16 - 8), 0
time = time + 600
RANDOMIZE TIMER
time = time + INT(RND * 60) + 1
IF time > 2400 THEN time = time - 2400
COLOR 0: PSET (x * 8 - 6, y * 16 - 10): PSET (x * 8 - 2, y * 16 - 4)
x = c: y = d: GOTO routine

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
IF a = 27 THEN GOTO survival
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

survival:
diff = 15
akt = skill(27)
GOSUB roll
IF rolled < diff THEN GOSUB unten: COLOR 4: PRINT "You're not sure you know what you should do now.": GOSUB schleife: GOSUB unten: GOTO map
GOSUB unten: COLOR 2
PRINT "You need something to warm yourself !!!": GOSUB schleife: GOSUB unten: GOTO map

REM --------ad bild
unten:
LINE (0, 289)-(640, 480), 0, BF
LOCATE 20, 3: COLOR 7
RETURN

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
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF item$(a) = "Macrobinoculars" THEN GOTO schauen
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO map
schauen:
CLS
PUT (0, 0), map1
PUT (0, 151), map2
GOSUB unten
IF x < 12 AND y < 6 THEN COLOR 4: PRINT "You can make out a Wampa-creature coming out of a cave in a rock north": PRINT "   of Echo Base. Maybe that's where they're hiding.": GOTO hupfen
COLOR 4: PRINT "You are not able to see further than 100 metres through the snow storm."
GOSUB schleife: GOTO map
hupfen:
IF mis1 = 0 THEN mis1 = -1
GOSUB schleife: GOTO map1
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

