SCREEN 12
COLOR 7
REM   ---------Kari Spaceport
REM   -----------------------------
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
file$ = "ks.bas"
combat$ = ""
routine:
CLS : COLOR 7
PRINT "You are in "; : COLOR 4: PRINT "Kari"; : COLOR 7: PRINT ", the capital of Ord Mantell."
PRINT "Several posters are nailed to the walls of this Stellar-class spaceport, showing"
PRINT "'criminals' for which high rewards are offered by several people."
PRINT "The local police are patrolling the area."
PRINT "On the landing-platforms, ships from every part of the galaxy are parked."
IF ship = -1 THEN PRINT "Your ship, the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT " is waiting for you."
IF ship = -2 THEN PRINT "Your drop-shuttle is waiting here."
IF INSTR(weap$, "Blaster") <> 0 THEN GOTO forbidden:
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Board your ship"
PRINT "3.Enter bar"
PRINT "4.Visit a Medic"
PRINT "5.Have your ship repaired"
PRINT "6.Enter shop": PRINT
PRINT "V.View Character"
PRINT "G.Save Game"
PRINT "S.Use skill"
PRINT "U.Use an item": PRINT
PRINT "Q.Quit Game"
PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leave
IF a$ = "2" THEN GOTO abflug
IF a$ = "3" THEN GOTO bar
IF a$ = "6" THEN GOTO shop
IF a$ = "s" OR a$ = "S" THEN GOTO skill
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "g" OR a$ = "G" THEN GOSUB savgam: GOTO routine
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "4" THEN GOTO medic
IF a$ = "5" THEN COLOR 4: PRINT "SORRY, BUT WE`RE ON STRIKE (due to the Sparpaket...)": GOSUB schleife: GOTO routine
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
GOTO routine

forbidden:
COLOR 2: PRINT "'Hey you over there !'": COLOR 7: PRINT ; "As you turn around, the cop shouts:"
COLOR 2: PRINT "'Yes you with your Blaster !'": COLOR 7
PRINT "Several cops close in on you as one steps forward and says:"; : COLOR 2: PRINT "'Ahem, you"
PRINT "might know about the Blaster restriction on Ord Mantell. It is illegal for civ's"
PRINT "to wear energy-weapons on Ord Mantell.'": COLOR 7
PRINT : PRINT "1.Use another weapon"
PRINT "2.Attack the cops"
PRINT "3.Apologize and board your ship."
PRINT : INPUT "Your command "; a
IF a = 1 THEN GOTO uuu
IF a = 2 THEN combat$ = "cops": GOSUB saver: RUN "fight.bas"
IF a = 3 THEN GOTO abflug
CLS : GOTO forbidden
aroutine:
IF INSTR(weap$, "Blaster") <> 0 THEN COLOR 4 ELSE COLOR 2: PRINT "'Thank you.'": GOSUB schleife: GOTO routine
PRINT "'Okay, you wanted it that way !'": GOSUB schleife: combat$ = "cops": GOSUB saver: RUN "fight.bas"
uuu:
CLS
PRINT "Your backpack:"
PRINT "--------------"
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT " Which item "; a
IF a < 1 OR a > 10 OR item$(a) = "" THEN COLOR 2: PRINT "What a sophisticated joke...": DO WHILE INKEY$ = "": LOOP: CLS : GOTO forbidden
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF item$(a) = "SC-75 Rifle" THEN GOTO achangweap
PRINT "That cannot be used as a weapon.": DO WHILE INKEY$ = "": LOOP: CLS : GOTO forbidden
achangweap:
b = 0
INPUT "Use this as your main weapon (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN CLS : GOTO forbidden
IF a$ = "y" OR a$ = "Y" THEN SWAP weap$, item$(a): b = 1
IF b = 0 THEN GOTO changweap
IF weap$ = "SC-75 Rifle" THEN dam = 8
IF INSTR(weap$, "Hold-out Blaster") <> 0 THEN dam = 3
IF INSTR(weap$, "Blaster Rifle") <> 0 THEN dam = 6
IF INSTR(weap$, "Blaster Pistol") <> 0 THEN dam = 4
IF INSTR(weap$, "Heavy Blaster") <> 0 THEN dam = 5
IF weap$ = "Vibro Axe" THEN dam = 3 + stat(5)
IF INSTR(weap$, "modified") <> 0 THEN dam = dam + 1
GOTO aroutine

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
IF a$ <> "s" AND a$ <> "S" THEN GOTO routine

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

CLS : GOTO routine

schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

REM ---------Save Game
savgam:
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

leave:
CLS : COLOR 7: PRINT "As you leave you notice the eyes of many people lying on you."
PRINT "It seems as if they have never seen someone leaving town..."
GOSUB saver: GOSUB schleife: RUN "ordmap.bas"

abflug:
CLS : COLOR 7
PRINT "As you board the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT ", you are checked upon again."
PRINT "After a short search, the cops let you go."
COLOR 2: PRINT "'Bye, you're welcome in Kira anytime WITHOUT Blasters,...'": COLOR 7
PRINT "Ignoring the cops you power up the engines and wait for the permission to"
PRINT "lift off."
PRINT "(...)"
COLOR 2: PRINT "<Crack> This is Kira-spaceport Tower Alpha. Permission granted <crack> to"
PRINT "lift off. <Crack> Do not try to hyperspace while still in our atmosphere !"
COLOR 7: PRINT "The comm falls silent as you blast out into the rainy night."
GOSUB schleife: GOSUB saver: RUN "space.bas"

REM ---------Use an item
items:
CLS
PRINT "Your backpack:"
PRINT "--------------"
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT " Which item "; a
IF a > 10 THEN a = 0
IF bs = -1 THEN bs = 0: RETURN
IF a < 1 OR a > 10 OR item$(a) = "" THEN COLOR 2: PRINT "What a sophisticated joke...": DO WHILE INKEY$ = "": LOOP: GOTO routine
herrlich:
COLOR 4: PRINT "U"; : COLOR 7: PRINT "se / "; : COLOR 4: PRINT "D"; : COLOR 7: PRINT "rop / "; : COLOR 4: PRINT "R"; : COLOR 7: PRINT "earrange"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "u" OR a$ = "U" THEN GOTO herrlicher
IF a$ = "d" OR a$ = "D" THEN item$(a) = "": GOTO routine
IF a$ = "r" OR a$ = "R" THEN GOTO rearrange
GOTO herrlich
rearrange:
INPUT "Change place with (1-10) "; b
IF b < 1 OR b > 10 THEN GOTO rearrange
SWAP item$(a), item$(b)
GOTO routine
herrlicher:
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO routine
changweap:
b = 0
INPUT "Use this as your main weapon (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO routine
IF a$ = "y" OR a$ = "Y" THEN SWAP weap$, item$(a): b = 1
IF b = 0 THEN GOTO changweap
IF weap$ = "SC-75 Rifle" THEN dam = 8
IF INSTR(weap$, "Hold-out Blaster") <> 0 THEN dam = 3
IF INSTR(weap$, "Blaster Rifle") <> 0 THEN dam = 6
IF INSTR(weap$, "Blaster Pistol") <> 0 THEN dam = 4
IF INSTR(weap$, "Heavy Blaster") <> 0 THEN dam = 5
IF weap$ = "Lightsaber" THEN dam = 10
IF weap$ = "Vibro Axe" THEN dam = 3 + stat(5)
IF INSTR(weap$, "modified") <> 0 THEN dam = dam + 1
GOTO routine
changarm:
b = 0
INPUT "Use this as you main armor (y/n)"; a$
IF a$ = "N" OR a$ = "n" THEN GOTO routine
IF a$ = "Y" OR a$ = "y" THEN SWAP ac$, item$(a): b = 1
IF item$(a) = "Nothing" THEN item$(a) = ""
IF b = 0 THEN GOTO changarm
IF INSTR(ac$, "Blast armor") <> 0 THEN ac = 2
IF INSTR(ac$, "Blast vest") <> 0 THEN ac = 1
IF INSTR(ac$, "Battle") <> 0 THEN ac = 4
IF INSTR(ac$, "damaged") <> 0 THEN ac = ac - 1
GOTO routine

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
COLOR 4: IF lost <= 0 THEN PRINT "You are not wounded!!!!": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO routine
diff = lost * 3
akt = skill(74) + skill(71)
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB verwundet: DO WHILE INKEY$ = "": LOOP: GOTO routine
COLOR 2: PRINT "The medpac did not help you."
DO WHILE INKEY$ = "": LOOP: GOTO routine

REM ---------Use a skill
skill:
PRINT "If you know the number of the desired skill, then just enter it here."
PRINT "If you don't know it, just enter '0' to choose from the list."
INPUT "Your Command"; a
IF a < 0 OR a > 80 THEN CLS : GOTO skill
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
use = a: IF bs = -1 THEN bs = 0: RETURN
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "cops": GOSUB saver: RUN "fight.bas"
IF use = 26 THEN diff = 24: GOTO streetwise
IF use = 14 THEN diff = 22: GOTO pick
IF use = 64 THEN GOTO plaster
IF use = 63 THEN GOTO armor
PRINT "Of no use."
DO WHILE INKEY$ = "": LOOP: GOTO routine

armor:
a = 0: FOR i = 1 TO 10
IF item$(i) = "Armor parts" THEN a = i
NEXT i
COLOR 4: IF a = 0 THEN PRINT "No replacement parts !": GOSUB schleife: GOTO routine
IF INSTR(ac$, "damaged") = 0 THEN PRINT "Your main armor is not damaged !": GOSUB schleife: GOTO routine
diff = 16: akt = skill(63): item$(a) = ""
GOSUB roll
IF rolled < diff THEN PRINT "It is still damaged !": GOSUB schleife: GOTO routine
PRINT "You did it !": ac = ac + 1
IF INSTR(ac$, "vest") <> 0 THEN ac$ = "Blast vest"
IF INSTR(ac$, "armor") <> 0 THEN ac$ = "Blast armor"
IF INSTR(ac$, "Battle") <> 0 THEN ac$ = "Battle suit"
GOSUB schleife
GOTO routine

plaster:
COLOR 4
a = 0: FOR i = 1 TO 10
IF item$(i) = "Blaster parts" THEN a = i
NEXT i
IF a = 0 THEN PRINT "You have no replacement parts !": GOSUB schleife: GOTO routine
parts = a
IF INSTR(weap$, "modified") <> 0 THEN PRINT "Your main-weapon is modified to its limits !": GOSUB schleife: GOTO routine
IF weap$ = "SC-75" THEN PRINT "You can't modify a firearm !": GOSUB schleife: GOTO routine
IF weap$ = "Vibro Axe" THEN PRINT "You can't modify a hand-to-hand-weapon !": GOSUB schleife: GOTO routine
IF weap$ = "Lightsaber" THEN PRINT "You can't modify a Lightsaber": GOSUB schleife: GOTO routine
diff = dam * 5: item$(parts) = ""
akt = skill(64): GOSUB roll
IF rolled < diff THEN PRINT "Seems it didn't work.": GOSUB schleife: GOTO routine
dam = dam + 1: weap$ = "modified " + weap$
PRINT "Yeah ! That's it!"
GOSUB schleife: GOTO routine

pick:
akt = skill(14)
GOSUB roll
c = rolled
akt = 3
GOSUB roll
diff = diff + akt: RANDOMIZE TIMER
COLOR 2: b = INT(RND * 500) + 1
IF c >= diff THEN cred = cred + b: PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A cop saw what you tried to do!!!": combat$ = "cops": GOSUB saver: GOSUB schleife: RUN "fight.bas"
DO WHILE INKEY$ = "": LOOP
GOTO routine

streetwise:
akt = skill(26)
GOSUB roll
IF rolled < diff THEN PRINT "Kari. Wow. And now what ?": GOSUB schleife: GOTO routine
PRINT "Glibba the Hutt is likely to have contacts in town. Maybe they know something."
GOSUB schleife: GOTO routine

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

medic:
COLOR 2: IF lost <= 0 THEN PRINT "But you are not wounded !": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO routine
pr = lost * 800: haha = lost
PRINT : PRINT " After examining you, Dr.McCoy demands"; pr; "credits."
IF cred < pr THEN COLOR 4: PRINT " You don't have enough money!": DO WHILE INKEY$ = "": LOOP: GOTO routine
ahem:
INPUT " Pay this excessive price (y/n)"; a$
IF a$ = "y" OR a$ = "Y" THEN lost = 0: COLOR 2: PRINT " You feel a lot better now. (Your purse feels a lot worse, actually)": DO WHILE INKEY$ = "": LOOP: GOSUB verwundet: cred = cred - pr: GOTO routine
IF a$ = "n" OR a$ = "N" THEN GOTO routine
GOTO ahem

bar:
CLS : COLOR 7
PRINT "You are in "; : COLOR 4: PRINT "Captain Silver's cabin"; : COLOR 7: PRINT "."
PRINT "It is a low class cantina whose owner Captain Silver once was a smuggler."
PRINT "Cops are standing at the bar. They seem to be everywhere around Kari. Strange."
PRINT "What seems most disturbing around the place, is that not one guy here is"
PRINT "drunk or at least nearly drunk. Everyone is clean, nice and sober."
COLOR 15
PRINT "          --Food--  10 Cr.-"
PRINT "          --Ale.--   5 Cr.-"
uu = 0: oo = 0: FOR i = 1 TO 10
IF INSTR(item$(i), " for ") <> 0 THEN uu = -1
IF item$(i) = "" AND uu = 0 THEN oo = i
NEXT i
IF ship = -1 AND oo > 0 AND uu = 0 AND INT(RND * 3) + 1 = 1 THEN GOSUB geschaeft
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Order a drink"
PRINT "3.Order food": PRINT
PRINT "S.Use skill"
PRINT "U.Use item": PRINT
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO drink
IF a$ = "3" THEN GOTO food
IF a$ = "s" OR a$ = "S" THEN GOTO skilll
IF a$ = "u" OR a$ = "U" THEN GOTO itemm
GOTO bar
drink:
IF cred < 5 THEN PRINT "Not enough money !": GOSUB schleife: GOTO bar
cred = cred - 5
PRINT "Captain Silver hands you his Correllian Whiskey and whispers:"; : COLOR 2
DATA"Boy, this is the finest ale in this system."
DATA"Burp."
DATA"Even Glibba buys this ale, if you get me."
DATA"Sir Lancelot of Camelot, that's my real name."
DATA"Them cops kill my business."
DATA"You are the only customer here, that orders drinks."
DATA"'ve you heard of the fleet massing off Sullust ?"
DATA"Fortunately the Empire hasn't found its way here...yet."
RANDOMIZE TIMER: RESTORE drink
a = INT(RND * 7) + 1
FOR i = 1 TO a: READ a$: NEXT i
PRINT a$
IF INSTR(a$, "Sullust") <> 0 AND mis3 = 0 THEN mis3 = -1: COLOR 4: PRINT "What's he talking about Sullust ?"
GOSUB schleife: GOTO bar

food:
IF cred < 10 THEN PRINT "Not enough money !": GOSUB schleife: GOTO bar
PRINT "Captain Silver hands you a Sabre Tiger-Steak."
cred = cred - 10
GOSUB schleife: GOTO bar

skilll:
bs = -1: GOSUB skill
IF use = 14 THEN GOTO steal
IF use = 1 OR use = 2 OR use = 8 OR use = 9 OR use = 10 OR use = 11 THEN combat$ = "cops": GOSUB saver: RUN "fight.bas"
PRINT "Of no use."
GOSUB schleife: GOTO bar
steal:
akt = skill(14): diff = 28
GOSUB roll
IF rolled < diff THEN COLOR 4: PRINT "You are spotted by a cop !!": combat$ = "cops": GOSUB schleife: GOSUB saver: RUN "fight.bas"
a = INT(RND * 100) + 10
cred = cred + a: PRINT "You stole"; a; "credits."
GOSUB schleife: GOTO bar

itemm:
bs = -1: GOSUB items
PRINT "Of no use here."
GOSUB schleife: GOTO bar

shop:
CLS : COLOR 7
PRINT "You enter a shopping area."
PRINT "Cops are patrolling the area with heavy weapons."
PRINT "  You can:": COLOR 14
PRINT "1. Leave ": COLOR 7
PRINT "2. Buy something"
PRINT "3. Sell something": PRINT
PRINT "S. Use a skill"
PRINT "U. Use an item": PRINT
COLOR 7: PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN CLS : GOTO routine
IF a$ = "2" THEN GOTO shopbuy
IF a$ = "3" THEN GOTO shopsell
IF a$ = "s" OR a$ = "S" THEN GOTO shopskill
IF a$ = "u" OR a$ = "U" THEN GOTO shopitem
GOTO shop

shopitem:
bs = -1: GOSUB items
PRINT "Of no use.": GOSUB schleife: GOTO shop

shopskill:
bs = -1: GOSUB skill
IF use = 48 THEN GOTO bargain
IF use = 1 OR use = 2 OR use = 9 OR use = 10 OR use = 11 THEN combat$ = "cops": GOSUB saver: RUN "fight.bas"
IF use = 14 THEN GOTO shopsteal
PRINT "Of no use.": GOSUB schleife: GOTO shop

shopsteal:
akt = skill(14): diff = 30
GOSUB roll
IF rolled < diff THEN COLOR 4: PRINT "Stop the thief !!!!": GOSUB schleife: combat$ = "cops": GOSUB saver: RUN "fight.bas"
a = INT(RND * 300) + 300: cred = cred + a
PRINT "You stole"; a; "credits."
GOSUB schleife: GOTO shop
bargain:
akt = skill(48): GOSUB roll
COLOR 4: a = 0: diff = 28
IF rolled >= diff AND billig = 0 THEN a = 1: billig = -1: PRINT "You clervely act and the shopkeeper promises to sell everything a bit cheaper."
IF rolled < diff THEN COLOR 2: PRINT "'Don't insult me! My ware is cheap already !'"
IF billig = -1 AND a = 0 THEN COLOR 2: PRINT "'I can't give you anything cheaper than I already do!"
COLOR 7: a = 0
DO WHILE INKEY$ = "": LOOP
GOTO shop

shopbuy:
CLS : COLOR 7
PRINT "The clerk lists his offers:"; : COLOR 2: PRINT "'Now ?'"
COLOR 14
PRINT "0.Leave": COLOR 7
PRINT "1.Comlink                   280 Cr."
PRINT "2.Medpac                    500 Cr."
PRINT "3.Datapad                   100 Cr."
PRINT "4.Umbrella                   50 Cr."
PRINT "5.Breathing mask            600 Cr."
PRINT "6.Blast vest                250 Cr."
PRINT "7.Vibro Axe                 900 Cr."
PRINT "8.Life-form Scanner        1000 Cr."
IF billig = -1 THEN COLOR 2: PRINT "'10 percent is all I can do !'"
PRINT : PRINT "Your purse tells you, that you've got"; : COLOR 4: PRINT cred; : COLOR 7: PRINT "credits left."
INPUT "Your command"; a
erk$ = "": IF a = 0 THEN GOTO shop
IF a < 1 OR a > 8 THEN GOTO shopbuy
IF a = 1 THEN it$ = "Comlink": pr = 280: erk$ = "A medium range personal communicator."
IF a = 2 THEN it$ = "Medpac": pr = 500: erk$ = "Heal yourself in time with this device."
IF a = 3 THEN it$ = "Datapad": pr = 100: erk$ = "Your personal computer will be with you wherever you go."
IF a = 4 THEN it$ = "Umbrella": pr = 50: erk$ = "This will protect you from Ord Mantell's nasty weather."
IF a = 5 THEN it$ = "Breathing mask": pr = 600: erk$ = "This device will allow breathing when there is no Type I Atmosphere."
IF a = 6 THEN it$ = "Blast vest": pr = 250
IF a = 7 THEN it$ = "Vibro Axe": pr = 900
IF a = 8 THEN it$ = "Life-form Scanner": pr = 1000: erk$ = "This device lets you detect intelligent life within a radius of many kilometers."
IF erk$ <> "" THEN PRINT erk$
quest:
IF billig = -1 THEN GOTO prozente ELSE GOTO rprprp
prozente:
a = pr: a = a / 10: pr = pr - a: pr = INT(pr)
rprprp:
COLOR 2: PRINT "'Pay me"; pr; "credits, sir.'": COLOR 7
IF cred < pr THEN COLOR 4: PRINT "As you show him your purse, he looks at you and says:"; : COLOR 2: PRINT "'I am sorry, sir, but it is not THAT cheap.'": COLOR 4: PRINT "He turns away from you, talking to another customer.": DO WHILE INKEY$ = "": LOOP: billig = 0: GOTO shopbuy
COLOR 2: INPUT "Is this okay (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO shopbuy
IF a$ <> "y" OR a$ <> "Y" THEN GOTO backpack
GOTO quest
backpack:
CLS
COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it (0 to go back)"; a
IF a = 0 THEN GOTO shopbuy
IF a < 1 OR a > 10 THEN GOTO backpack
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE GOTO backpack
cred = cred - pr
item$(a) = it$
COLOR 2: PRINT "'Thank you very much. Live long and prosper.'"
COLOR 7
DO WHILE INKEY$ = "": LOOP: GOTO shopbuy
shopsell:
CLS
COLOR 7: PRINT "The fat man eyes you suspiciously,"; : COLOR 2: PRINT "'What is it, that you think I will buy from you ?'"
COLOR 7
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT "What do you want to sell (0-go back)"; a
pr = 0
IF a = 0 THEN GOTO shop
IF a < 1 OR a > 10 OR item$(a) = "" THEN GOTO shopsell
IF INSTR(item$(a), "Kari") <> 0 THEN pr = 8000: COLOR 2: PRINT "Good ! Your payment is 8000 Cr."
IF INSTR(item$(a), " for ") <> 0 AND pr = 0 THEN COLOR 2: PRINT "Sorry. This is NOT the destiny of your cargo.": GOSUB schleife: GOTO shopsell
IF INSTR(item$(a), "damaged") <> 0 THEN pr = 20: COLOR 2: PRINT "'This f--king crap is damaged !"
IF INSTR(item$(a), "modified") <> 0 THEN pr = 2000: COLOR 2: PRINT "'Blasters are illegal. How much do you want ?'"
IF item$(a) = "Blaster Rifle" THEN pr = 0: COLOR 2: PRINT "'Blasters are illegal !!!'"
IF item$(a) = "Vibro Axe" THEN pr = 200: COLOR 2: PRINT "'Ah, okay, I'll take it.'."
IF item$(a) = "Thermal Detonator" THEN pr = 1000: COLOR 2: PRINT "'Very rare that weapon.'"
COLOR 2: IF pr = 0 THEN PRINT "I will not buy this.": GOSUB schleife: GOTO shopsell
PRINT "'I can pay you"; pr; "creds, kiddo.'"
IF pr < 8000 THEN pr = pr + INT(RND * (pr / 2)) + 1
INPUT "'How much do you want for it'"; b
IF b = 0 THEN GOTO shopsell
IF b <= 0 THEN b = 0: COLOR 2: PRINT "I take everything, if it's for free."
IF b > pr THEN PRINT "'Have you studied the prices on the local market ? I bet not.'"
IF b <= pr THEN item$(a) = "": PRINT "'Here you are.'": COLOR 7: PRINT "He takes his purse out and pays you.": cred = cred + b
COLOR 7: DO WHILE INKEY$ = "": LOOP
GOTO shopsell

geschaeft:
COLOR 2: PRINT "'Shh, hey trader !'"; : COLOR 7: PRINT " someone whispers."
PRINT "Ignore (y/n) ?"
gess:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "Y" OR a$ = "y" THEN RETURN
IF a$ = "n" OR a$ = "N" THEN COLOR 2 ELSE GOTO gess
PRINT "'I need you for a little cargo run :";
DATA "Spice","Narcotics","Foodstuffs","Robot parts","Hydro-screwdrivers"
DATA"Hydrogen","Holos","Narcotics","Narcotics","Narcotics","Narcotics"
tos:
DATA" for Mos Eisley"," for Cloud-City"
RANDOMIZE TIMER
a = INT(RND * 11) + 1
RESTORE gess
FOR i = 1 TO a: READ cargo$: NEXT i
RANDOMIZE TIMER: RESTORE tos
a = INT(RND * 2) + 1: FOR i = 1 TO a: READ a$: NEXT i
cargo$ = cargo$ + a$
PRINT cargo$
gesa:
COLOR 7: PRINT "Accept (y/n) ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO okay
IF a$ = "n" OR a$ = "N" THEN RETURN
GOTO gesa
okay:
item$(oo) = cargo$
PRINT "Good. Be sure to deliver your cargo soon."
RETURN

