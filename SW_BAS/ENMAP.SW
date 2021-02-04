REM ----------------ENDOR:
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
CLS : impolt = 1
file$ = "enmap.sw"
combat$ = ""
SCREEN 12: CLS
map1:
DATA "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"
DATA "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww00000wwwww000www"
DATA "wwwww0wwwwwwwwwwwww00wwwwwwwwww000000000000000wwww000w0"
DATA "ww0w0w0wwwwEwwwwwww0000000000000000wwwwww000000www00000"
DATA "w0www00000wwwwwww0000wwwwwwwwwwww0www000000000ww0www000"
DATA "000www00000wwww000w000000wwwwwwwwwww0000000000wwwww0000"
DATA "0000www00000ww000www00000000ww000000wwwwwwwwwwww00www00"
DATA "ww0www000000w00000w0000000ww00000000000000wwww00000w000"
DATA "wwwwwww00www000w00000000ww000m0000wwww000wwww000000ww00"
DATA "wwwwww0000ww00000w00wwww00000000wwwwwwwwwwwwwww0000000b"
DATA "ww0wwww00wwww0000www000000wwwwwwwwww0000000wwwwwwww0000"
DATA "wwwwwwww0000wwwww00000000000000m00g0000g000000000000000"
DATA "wwww0wwwwwwwwwwwwwwww00000m0000000g00m0m00000m000000000"
DATA "wwww00000000wwwwwwwwwwwww0000g0m000m000m00g0000g0000000"
DATA "ww000000000000000wwwww0000000000gm000B000m000g000000000"
DATA "www000wwwwwwwwwwwwww00ww00m000g0000m000m000m00000000000"
DATA "wwww0000wwwwwwwwwwwwww0wwww000000g0m0m0000g000000000000"
DATA "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww00000g00000000000000000"
RESTORE map1
FOR i = 1 TO 18
READ a$
FOR a = 1 TO 55
map$(a, i) = MID$(a$, a, 1): c = 10
IF map$(a, i) = "g" AND mis19 = -1 THEN map$(a, i) = "0"
IF map$(a, i) = "B" AND mis17 < 0 THEN c = 8
IF map$(a, i) = "0" THEN c = 10
IF map$(a, i) = "w" THEN c = 2
IF map$(a, i) = "E" AND mis18 = 0 THEN c = 2
IF map$(a, i) = "E" AND mis18 < 0 THEN c = 4
LINE ((a * 8) - 8, (i * 16) - 16)-(a * 8, i * 16), c, BF
COLOR 0: PSET (a * 8 - 6, i * 16 - 10): PSET (a * 8 - 2, i * 16 - 4)
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
RANDOMIZE TIMER: a = INT(RND * 5) + 1
IF op = 1 AND a = 1 THEN GOTO begegnung
op = 0
COLOR 7: LOCATE y, x: PRINT "X"
GOSUB unten

REM Guardtower ?
gt = 0
IF map$(x, y) = "g" THEN gt = 1
IF map$(x + 1, y) = "g" THEN gt = 1
IF map$(x - 1, y) = "g" THEN gt = 1
IF map$(x, y + 1) = "g" THEN gt = 1
IF map$(x, y - 1) = "g" THEN gt = 1
IF map$(x + 1, y + 1) = "g" THEN gt = 1
IF map$(x + 1, y - 1) = "g" THEN gt = 1
IF map$(x - 1, y - 1) = "g" THEN gt = 1
IF map$(x - 1, y - 1) = "g" THEN gt = 1
IF gt = 1 THEN GOSUB guardtower

REM Mine ?
mi = 0
IF map$(x, y) = "m" THEN mi = 1
RANDOMIZE TIMER
IF mi = 0 THEN GOTO keinemine
akt = stat(4): GOSUB roll
IF rolled < 17 THEN map$(x, y) = "0": GOSUB mine

keinemine:
a$ = ""
COLOR 4
IF map$(x, y) = "E" THEN a$ = "You are standing in a crowded Ewok-village.": IF mis18 = 0 THEN mis18 = -1
IF map$(x, y) = "E" AND mis20 = -1 THEN a$ = "You are standing in what once was an Ewok-village."
IF map$(x, y) = "B" AND mis21 = 0 THEN a$ = "You are in the heavily guarded bunker-complex.": IF mis17 = 0 THEN mis17 = -1
IF map$(x, y) = "B" AND mis21 = -1 THEN a$ = "You are standing in the smoking remains of the shield-generator."
IF map$(x, y) = "0" THEN COLOR 2: a$ = "You are standing on a clearing."
IF map$(x, y) = "w" THEN COLOR 2: a$ = "You are moving through dense woods."
IF a$ = "" THEN COLOR 2: a$ = "You are standing on a clearing."
PRINT a$
IF map$(x, y) = "E" AND mis9 < 0 AND mis20 = 0 THEN COLOR 1: PRINT "  You are attacked by the leading rebels !": combat$ = "finalebîs": GOSUB saver: GOSUB schleife: RUN "fight.sw"
COLOR 7: e = 0: blow = 0
PRINT "    8,6,2,4 to move about": e = 0
COLOR 4: PRINT "    V"; : COLOR 7: PRINT "iew Character"
COLOR 4: PRINT "    U"; : COLOR 7: PRINT "se an item"
PRINT "    Use a "; : COLOR 4: PRINT "S"; : COLOR 7: PRINT "kill"
PRINT "    Save "; : COLOR 4: PRINT "G"; : COLOR 7: PRINT "ame"
COLOR 4: IF map$(x, y) = "B" AND mis9 = 0 AND mis21 = 0 THEN blow = -1: PRINT "    B"; : COLOR 7: PRINT "low up the shield-generator."
COLOR 4: IF (map$(x, y) = "E" AND mis20 = 0 AND mis9 = 0) OR (map$(x, y) = "B" AND mis21 = 0 AND mis9 < 0) THEN e = -1: PRINT "    E"; : COLOR 7: PRINT "nter."
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
IF a$ = "b" AND blow = -1 THEN GOTO blowup
IF a$ = "B" AND blow = -1 THEN GOTO blowup
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
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO map

schauen:
GOSUB unten
time = time + 1
PRINT "You scan the Horizon and see ";
DATA"nothing special."
DATA"a few ewoks north of your position."
DATA"nothing special."
DATA"space, the final frontier..."
DATA"nothing at all."
DATA"An imperial scout party to the south."
RANDOMIZE TIMER: RESTORE schauen
a = INT(RND * 7) + 1: pussy = 0
FOR i = 1 TO a: READ a$: NEXT i
IF mis18 = 0 AND x < 21 AND y < 8 THEN a$ = "a small Ewok-village !": mis18 = -1: pussy = 1
IF mis17 = 0 AND x > 23 AND y > 10 THEN a$ = "a heavily guarded imperial bunker !": mis17 = -1: pussy = 1
PRINT a$
GOSUB schleife
IF pussy = 0 THEN GOTO map ELSE GOTO map1
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
IF weap$ = "modified Bowcaster" THEN dam = 7
IF INSTR(weap$, "modified") <> 0 THEN dam = dam + 1
GOTO map
changarm:
b = 0
INPUT "Use this as your main armor (y/n)"; a$
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
IF map$(x, y) = "B" THEN GOTO bunker
IF map$(x, y) = "E" THEN GOTO village
GOTO routine

bunker:
CLS : COLOR 7
PRINT "You are in the bunker complex. Guards check your ID and nod smiling."
IF mis20 = -1 THEN GOTO endeboes
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Ask about the proceedings of the battle"
PRINT "3.Visit the medic droid"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO map
IF a$ = "2" THEN GOTO askabout
IF a$ = "3" THEN GOTO medic
GOTO bunker
medic:
COLOR 4: PRINT "The Medic-droid examines you...": COLOR 2
IF lost = 0 THEN PRINT "You are in a good shape for a human.": GOSUB schleife: GOTO bunker
PRINT "Ah, I see. Let me fix this problem you have."
COLOR 7: PRINT "The droid heals you."
haha = lost: lost = 0: PRINT "You are fully healed."
GOSUB verwundet: GOSUB schleife: GOTO bunker
askabout:
IF hochzeit = -1 THEN COLOR 2: PRINT "Nothing new has happened since your last visit.": GOSUB schleife: GOTO bunker
hochzeit = -1
DATA"The rebels have arrived and we have already destroyed one heavy Cruiser."
DATA"We have destroyed the rebel's medical frigate !"
DATA"Our Tie-Advanceds are delivering final blows to a second cruiser."
DATA"The Deathstar finished off a third cruiser."
DATA"The rebels stand no chance. But they are not yet surrendering."
DATA"Nearly the whole fleet is destroyed by now."
DATA"If the rebels can't lower our shields soon, the rebellion will be history."
IF mis23 < 7 THEN mis23 = mis23 + 1
RESTORE askabout
FOR i = 1 TO mis23
READ a$: NEXT i
PRINT a$
GOSUB schleife: GOTO bunker

village:
CLS : COLOR 7
IF mis21 = -1 THEN GOTO endegut
PRINT "You are in a small Ewok-village that is hidden in the trees. Rebel Commandos"
PRINT "are already here gathering their forces."
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Talk to Rebels"
PRINT "3.Talk to Ewoks"
PRINT "4.Visit an Ewok-healer"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO map
IF a$ = "2" THEN GOTO talkrebel
IF a$ = "3" THEN GOTO talkewok
IF a$ = "4" THEN GOTO ewokhealer
GOTO village
ewokhealer:
COLOR 4: PRINT "The shaman examines you...": COLOR 2
IF lost = 0 THEN PRINT "You are in a good shape for a human.": GOSUB schleife: GOTO village
PRINT "Ah, I see. Let me fix this problem you have."
COLOR 7: PRINT "The shaman heals you using strange herbs."
haha = lost: lost = 0: PRINT "You are fully healed."
GOSUB verwundet: GOSUB schleife: GOTO village
talkrebel:
COLOR 2
IF mis22 = 0 THEN mis22 = -1: COLOR 2: PRINT "'We have a problem with the enemy artillery. As long as it is active," ELSE PRINT "'We gotta move !'": GOSUB schleife: GOTO village
PRINT "we can't get near the bunker. But we don't have the manpower to destroy the"
PRINT "artillery sites.'": GOSUB schleife: GOTO village

talkewok:
a$ = ""
IF mis22 = -1 THEN a$ = "We will destroy the artillery sites for you if you chase the Imperials away from our planet !": mis22 = -2: mis19 = -1
DATA"The bunker is guarded by mines and artillery"
DATA"I am Wicket, I am a mighty warrior"
DATA"Beware of the giant wolves in the woods !"
DATA"You are welcome to join our tribe !"
DATA"Our shaman will heal you if the need should arise."
RESTORE talkewok
IF a$ = "" THEN RANDOMIZE TIMER: a = INT(RND * 5) + 1: FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
GOSUB schleife: GOTO village

blowup:
det = 0
FOR i = 1 TO 10
IF item$(i) = "Detonite-Pack" THEN det = i
NEXT i
GOSUB unten: IF det = 0 THEN COLOR 4: PRINT "Nothing to blow it with !": GOSUB schleife: GOTO routine
item$(det) = ""
COLOR 15: PRINT "BOOM !": GOSUB schleife: COLOR 1: PRINT "   Suddenly you have feeling that you are needed on the Deathstar and steal": PRINT "   a shuttle to fly up to the Emperor !": xp = xp + 3000: GOSUB schleife: COLOR 2: PRINT "   'I am coming to get you, Imperator !'"
GOSUB schleife: GOTO deathstar
deathstar:
CLS
COLOR 7: PRINT "You are in the hangar of the mighty second "; : COLOR 4: PRINT "Deathstar"; : COLOR 7: PRINT "."
PRINT "Pilots are rushing to their Ties. The battle seems to run well for your"
PRINT "friends, so far."
PRINT "A sign indicates: "; : COLOR 2: PRINT "This way to the Endkampf ->": COLOR 7
GOSUB schleife
PRINT "You follow the sign. Suddenly you are attacked."
mis21 = -1: combat$ = "finalegut": GOSUB saver: GOSUB schleife: RUN "fight.sw"

mover:
a = x: b = y
IF a$ = "8" THEN c = x: d = y - 1
IF a$ = "6" THEN c = x + 1: d = y
IF a$ = "2" THEN c = x: d = y + 1
IF a$ = "4" THEN c = x - 1: d = y
IF c < 1 OR c > 55 OR d < 1 OR d > 18 THEN GOTO routine
IF map$(c, d) = "1" THEN COLOR 7: LOCATE 26, 3: PRINT "You stand in front of a dirty lake.": GOSUB schleife: GOTO routine
o = 10: op = 1
IF map$(x, y) = "E" THEN o = 4
IF map$(x, y) = "w" THEN o = 2
IF map$(x, y) = "0" THEN o = 10
IF map$(x, y) = "B" THEN o = 8
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), o, BF
IF map$(x, y) = "c" AND mis14 < -1 THEN CIRCLE (x * 8 - 4, y * 16 - 8), 4, 0: PAINT (x * 8 - 4, y * 16 - 8), 0
time = time + 600
RANDOMIZE TIMER
time = time + INT(RND * 60) + 1
IF time > 2400 THEN time = time - 2400: RANDOMIZE TIMER: a = INT(RND * 3) + 1: IF a = 1 THEN hochzeit = 0
COLOR 0: PSET (x * 8 - 6, y * 16 - 10): PSET (x * 8 - 2, y * 16 - 4)
x = c: y = d: GOTO routine

begegnung:
a$ = " You are surprised ! "
LINE (220, 220)-(435, 245), 4, BF
COLOR 7
LOCATE 15, 31: PRINT a$
GOSUB saver: GOSUB schleife: RUN "fight.sw"

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

guardtower:
GOSUB unten
COLOR 4: PRINT "You are being fired upon by hidden snipers with heavy artillery !": GOSUB schleife
akt = 8: GOSUB roll
hit = rolled
hiitt:
akt = stat(5) + ac: GOSUB roll
resist = rolled
IF hit < resist THEN COLOR 2: PRINT "   Nothing happened to you.": GOTO weirrr
COLOR 4: IF hit - 16 > resist THEN PRINT "   You are killed outright.": GOSUB schleife: RUN "starwars.bas"
IF hit - 14 > resist THEN PRINT "   You are mortally wounded!": lost = lost + 3: GOSUB verwundet: GOTO weirrr
IF hit - 12 > resist THEN PRINT "   You are seriously wounded!": lost = lost + 2: GOSUB verwundet: GOTO weirrr
IF hit >= resist THEN PRINT "   You are wounded!": lost = lost + 1: GOSUB verwundet: GOTO weirrr
weirrr:
GOSUB schleife
GOSUB unten
RETURN

mine:
GOSUB unten
COLOR 4: PRINT "You stepped on a mine and are caught in a fireball !": GOSUB schleife
akt = 14: GOSUB roll
GOTO hiitt

endeboes:
CLS
COLOR 4: PRINT "Lord Vader"; : COLOR 7: PRINT " and "; : COLOR 4: PRINT "Emperor Palpatine "; : COLOR 7: PRINT "are here to congratulate you on your mission."
COLOR 2: PRINT "'You did well there, young "; name$; "."
PRINT "I promote you to the rank of "; : COLOR 1: PRINT "GENERAL"; : COLOR 2: PRINT " of the royal guards.": COLOR 7
PRINT "Then Palpatine nods to Vader and leaves. Vader turns to you and whispers to"
PRINT "you:": GOSUB schleife
COLOR 3: PRINT : PRINT "                                 TO BE CONTINUED.....": GOSUB schleife
GOTO wonsav

endegut:
CLS
PRINT "As you arrive at the Ewok-village, the tale of your noble deeds has already"
PRINT "arrived. Hundreds of rebels are celebrating the triumph over the evil Empire."
PRINT "Even your friend Repus Lrac is here. By his side is a small cow. He smiles:": COLOR 2
PRINT "There are cows on this planet ! Grrrrrreat ! <MU> !": COLOR 7
GOSUB schleife: PRINT "The rebel fleet has won and the Deathstar is destroyed.": GOSUB schleife
PRINT "  You are now a true Jedi.": GOSUB schleife
PRINT "          You killed Darth Vader (someone else's father).": GOSUB schleife
PRINT "                  And Emperor Palpatine is dead !": GOSUB schleife: COLOR 1
PRINT "                         isn't he ?": GOSUB schleife: COLOR 3
PRINT : PRINT "                                       TO BE CONTINUED........"
wonsav:
CLS : COLOR 7
PRINT "Your character will be saved now for converting into "
PRINT
PRINT : COLOR 5: PRINT
PRINT "                                 Star Wars II"
a$ = "The Return Of " + name$
a = LEN(a$) / 2: LOCATE 7, 40 - a: PRINT a$
COLOR 7: FOR i = 1 TO 5: PRINT : NEXT i
INPUT "Enter a filename (no extension, max 8 letters) "; fin$
IF LEN(fin) > 8 THEN GOTO wonsav
IF INSTR(fin$, ".") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "î") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "Å") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "ô") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "ö") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "#") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, ",") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, ";") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, ":") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "?") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF INSTR(fin$, "\") <> 0 THEN COLOR 4: PRINT "Illegal filename !": GOSUB schleife: GOTO wonsav
IF fin$ = "" THEN GOTO wonsav
fin$ = fin$ + ".won"
OPEN fin$ FOR OUTPUT AS #1
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
CLS : RUN "as.sw"




