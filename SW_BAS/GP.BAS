SCREEN 12
REM ------------GLIBBA's PALACE
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
file$ = "gp.bas"
REM routine
IF mis4 = -4 THEN COLOR 7: CLS : PRINT "After a thorough search, you come to the conclusion that nothing here": PRINT "is worth of your attention.": GOSUB schleife: GOSUB saver: RUN "ordmap.bas"
firsttime:
CLS : COLOR 7
IF mis4 < 0 THEN GOTO routine
PRINT "As you enter the plexiglass-tower, you are stopped by Glibba's thugs."
PRINT "A tall woman stands before you and orders you to leave:": COLOR 2
PRINT "I'm afraid you are at the wrong door. Now go back, before I have to"
PRINT "kill you.": COLOR 7
PRINT "Four thugs raise their weapons and wait for your response."
PRINT : COLOR 14: PRINT "1.Leave": COLOR 7: PRINT "2.Attack"
INPUT "Your command "; a
IF a = 1 THEN GOSUB saver: COLOR 2: PRINT "What a wise decision.": GOSUB schleife: RUN "ordmap.bas"
IF a = 2 THEN combat$ = "glibthug": GOSUB saver: RUN "fight.bas"
GOTO firsttime
routine:
CLS : COLOR 7
PRINT "You are in Glibba's audience-chamber. On the far end of the room Glibba"
PRINT "is lying on his throne. He can't deny being Jabba's brother, as you can "
PRINT "imagine."
PRINT "Several Elite-warriors are guarding him. The whole place looks clean and"
PRINT "reminds you of a hotel-lobby."
PRINT "The view from here is great - as the walls are made of glass."
COLOR 2
IF mis4 = -3 THEN PRINT "The climbing-pole is lying in the middle of the room. It has been chopped down." ELSE PRINT "In the middle of the room, there is a greasy pole leading upward."
COLOR 4
IF mis4 = -2 THEN PRINT "Glibba looks at you full of expectation."
IF mis4 = -3 THEN PRINT "People are laughing their asses of."
PRINT : COLOR 7
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Talk to Glibba"
IF mis4 = -2 THEN PRINT "3.Climb up the pole"
IF mis4 = -3 THEN PRINT "3.Take revenge (=switch to gore mode...)"
PRINT
PRINT "V.View Character"
PRINT "G.Save Game"
PRINT "S.Use skill"
PRINT "U.Use Item"
PRINT "Q.Quit Game": PRINT
PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB saver: RUN "ordmap.bas"
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "2" THEN GOTO talk
IF a$ = "3" AND mis4 = -2 THEN GOTO climb
IF a$ = "3" AND mis4 = -3 THEN GOTO revenge
GOTO routine

revenge:
COLOR 4: PRINT "You attack in a frenzy..."
GOSUB schleife
combat$ = "revglib": GOSUB saver: RUN "fight.bas"

talk:
DATA"My brother Jabba needs to be taught a lesson."
DATA"A nice climbing-pole, this is, is not ?"
DATA"You work for Jabba ?"
RESTORE talk
a = INT(RND * 3) + 1
FOR i = 1 TO a: READ a$: NEXT i
IF mis4 = -1 THEN a$ = "If you manage to climb that pole, I tell you all you want. Only a big climber will do. Is greasy. Is hard.": mis4 = -2
PRINT "Glibba looks at you amused and says:"; : COLOR 2: PRINT a$
GOSUB schleife: GOTO routine

climb:
PRINT : COLOR 4
PRINT "You try to climb up the greasy pole.": COLOR 7
GOSUB schleife
akt = skill(59): GOSUB roll
IF rolled < 10 THEN GOTO fall
PRINT "One meter...": GOSUB schleife
akt = skill(59): GOSUB roll
IF rolled < 12 THEN GOTO fall
PRINT "Two metres....": GOSUB schleife
akt = skill(59): GOSUB roll
IF rolled < 14 THEN GOTO fall
PRINT "Four metres.........": GOSUB schleife
akt = skill(59): GOSUB roll
IF rolled < 14 THEN GOTO verletzt
mis4 = -3
PRINT "As you are nearly at the top, Glibba gives one of his thugs a wink and the"
PRINT "thug chops down the pole with you on it."
PRINT "            [  this joke (c) 1996 by Anja ]": GOSUB schleife
akt = stat(5) + ac: GOSUB roll
IF rolled < 20 THEN GOTO verletzt
COLOR 2: PRINT "Luckily you are not hurt.": GOSUB schleife: GOTO routine
verletzt:
PRINT "You fall down..."
haha = lost: lost = lost + 1: GOSUB verwundet
COLOR 4: PRINT "You are "; health$; " !!!": GOSUB schleife: GOTO routine
fall:
PRINT "You fall down. The pole is very greasy indeed.": GOSUB schleife: GOTO routine

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
IF item$(a) = "Thermal Detonator" THEN GOTO therm
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
IF weap$ = "Vibro Axe" THEN dam = 3 + stat(5)
IF weap$ = "Lightsaber" THEN dam = 10
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

therm:
PRINT "As you raise your Thermal Detonator, Glibba starts to laugh.": COLOR 2
PRINT "'You think I as stupid as Jabba, you think ? Go on, use it..if you dare.'"
COLOR 7
PRINT "1.Put it away"
PRINT "2.Blow the whole room to hell"
INPUT "Your command "; a
IF a = 1 THEN COLOR 2: PRINT "'You think you cool, you think ?'": COLOR 7: GOSUB schleife: GOTO routine
IF a = 2 THEN COLOR 4: PRINT "The whole room is blasted, together with Glibba...and you..."
mis4 = -4: GOSUB schleife
akt = 10: GOSUB roll
op = rolled
akt = stat(5) + ac: GOSUB roll
IF rolled > schaden THEN COLOR 2: PRINT "You are not hurt while everyone else is dead in the room.": GOSUB schleife: GOSUB saver: RUN "ordmap.bas"
COLOR 4: IF op - 16 > rolled THEN PRINT "You are killed outright.": GOSUB schleife: RUN "starwars.bas"
IF op - 14 > rolled THEN PRINT "You are mortally wounded!": lost = lost + 3: GOSUB verwundet: GOTO ups
IF op - 12 > rolled THEN PRINT "You are seriously wounded!": lost = lost + 2: GOSUB verwundet: GOTO ups
IF op >= rolled THEN PRINT "You are wounded!": lost = lost + 1: GOSUB verwundet: GOTO ups
ups:
PRINT "Any evidence on who the Bounty Hunter is, or where he is, is destroyed."
PRINT "There is nothing more here to do..."
GOSUB schleife: GOSUB saver: COLOR 7
RUN "ordmap.bas"

REM ---------Use a skill
skills:
PRINT "If you know the number of the desired skill, then just enter it here."
PRINT "If you don't know it, just enter '0' to choose from the list."
INPUT "Your Command"; a
IF a < 0 OR a > 80 THEN CLS : GOTO skills
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
use = a
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "glibfight": GOSUB saver: RUN "fight.bas"
IF use = 26 THEN diff = 16: GOTO streetwise
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
IF weap$ = "Lightsaber" THEN PRINT "You can't modify a Lightsaber !": GOSUB schleife: GOTO routine
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
akt = 5
GOSUB roll
diff = diff + akt: RANDOMIZE TIMER
COLOR 2: b = INT(RND * 500) + 1
IF c >= diff THEN PRINT "You managed to steal in Glibba's tower.": cred = cred + b: PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A guard saw what you tried to do!!!": combat$ = "glibfight": GOSUB saver: GOSUB schleife: RUN "fight.bas"
DO WHILE INKEY$ = "": LOOP
GOTO routine

streetwise:
akt = skill(26)
GOSUB roll
IF rolled < diff THEN PRINT "This is Glibba's place. Nothin' more an' nothin' less.": GOSUB schleife: GOTO routine
PRINT "Glibba is known for pulling people's legs."
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

