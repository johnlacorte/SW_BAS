SCREEN 12
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
file$ = "iv.sw"
routine:
CLS : COLOR 7
PRINT "You are in the hangar of the "; : COLOR 4: PRINT "ISD Invincible"; : COLOR 7: PRINT ". Beside your craft, dozens"
PRINT "of Tie-Fighters, Tie-Interceptors, Tyderian Shuttles and even some strange "
PRINT "Tie-models that you've never seen before, are docked here."
PRINT "Technicans are rushing from craft to craft. Several Tie-pilots are entering"
PRINT "the area with their helmets in their hands, getting ready for a patrol."
IF mis9 = -2 THEN COLOR 2: PRINT "Two long rows of Stormtroopers indicate your way to the throne-room.": COLOR 7
IF planet$ = "Endor" THEN COLOR 2: PRINT "'We have arrived in the Endor-system. Condition "; : COLOR 4: PRINT "RED"; : COLOR 2: PRINT ". Everyone prepare": PRINT "for battle. Captain "; name$; ", your transfer for the sanctuarium": PRINT "moon is due any minute now !'"
PRINT
COLOR 14
IF planet$ = "Endor" THEN PRINT "1.Report for planetary shuttle": GOTO juu
IF ship = -1 THEN PRINT "1.Enter your ship" ELSE PRINT "1.Enter your drop-shuttle"
juu:
COLOR 7: PRINT "2.Enter throne-room"
PRINT "3.Talk to an Imperial"
PRINT
PRINT "G.Save Game"
PRINT "S.Use Skill"
PRINT "U.Use item"
PRINT "Q.Quit Game"
PRINT "V.View character"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" AND planet$ <> "Endor" THEN GOTO leave
IF a$ = "2" THEN GOTO throne
IF a$ = "3" THEN GOTO talk
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "1" AND planet$ = "Endor" THEN GOTO landen
GOTO routine

landen:
x = 38: y = 15: mis17 = -1: mis19 = -1
GOSUB saver
RUN "enmap.sw"

leave:
CLS : COLOR 7
PRINT "You board your "; : IF ship = -1 THEN PRINT "ship";  ELSE PRINT "shuttle";
PRINT "."
COLOR 2: PRINT "'This is hangar control &h23. Prepare to be catapulted out...'": COLOR 7
PRINT "Then with an enormous acceleration you are shot out into the void.": COLOR 2
PRINT "'ISD Invincible wishes you a pleasent flight, commander.'"
GOSUB schleife: GOSUB saver: RUN "space.sw"

throne:
IF planet$ = "Endor" THEN COLOR 4: PRINT "The Emperor and Vader have already left for the Deathstar.": GOSUB schleife: GOTO routine
CLS : COLOR 7
PRINT "Two "; : COLOR 4: PRINT "royal guards"; : COLOR 7: PRINT " in red battle-suits escort you before the"
PRINT "Emperor. His chair slowly spins around until the old man looks in your face."
IF mis14 > -6 THEN COLOR 2: PRINT "'Young man. You should try to obtain a lightsaber and the ability to use it.": PRINT "You will need it on your mission. Now leave.'": GOSUB schleife: GOTO routine
PRINT "Darth Vader is standing beside Palpatine."
IF mis9 < -2 THEN GOTO schonda
mis9 = -3
COLOR 2: PRINT "'So you are the brave young fighter, that blew up the Calamarian shipyard. "
PRINT "Excellent. I like performances like this."
IF mis14 = -6 THEN PRINT "Lord Vader told me about your great achievment in becoming a dark-side adept." ELSE PRINT "Unfortunately you were not able to feel the dark-side flow. But that doesn't": PRINT "matter. Your experience will be of great value to us."
COLOR 7: PRINT "The Emperor grins: "; : COLOR 2
PRINT "With your help we will deliver a final blow to the"
PRINT "rebel alliance. A new deathstar is being built in the ENDOR-System. I made "
PRINT "sure that the rebels believe, that it is not yet armed. But -hehehe- it is !"
PRINT "They will come to destroy the Deathstar, but our fleet AND the Deathstar will"
PRINT "finish them off.": GOSUB schleife
PRINT "Your mission will be to finish off the rebel commandos on the surface of the"
PRINT "sanctuarian moon, where the shield-generator for the Deathstar is located."
PRINT "Under no circumstances is the generator to be destroyed ! I myself will be"
PRINT "on the Deathstar together with Lord Vader to watch the final destruction"
PRINT "of the rebel-fleet."
GOSUB schleife
schonda:
COLOR 7: PRINT "He nods at you."; : COLOR 2: PRINT "Soon we will hyperspace to the Endor-system."
COLOR 7: PRINT
PRINT "  1.Wait for the jump"
PRINT "  2."; : COLOR 2: PRINT "I'll be back for the jump.": COLOR 7
haha:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO jump
IF a$ = "2" THEN COLOR 2: PRINT "Be back soon !": GOSUB schleife: GOTO routine
GOTO haha

talk:
PRINT "You fetch yourself a ";
DATA"technican","Stormtrooper","pilot","guard"
RANDOMIZE TIMER: a = INT(RND * 4) + 1
RESTORE talk: FOR i = 1 TO a: READ a$: NEXT i
PRINT a$; ".": a$ = "": INPUT "Ask him about what "; a$
IF a$ = "" THEN PRINT "Disappointed he leaves.": GOSUB schleife: GOTO routine
IF INSTR(a$, "mperor") <> 0 OR INSTR(a$, "MPEROR") <> 0 THEN GOTO emperor
IF INSTR(a$, "odel") <> 0 OR INSTR(a$, "ODEL") <> 0 THEN GOTO ties
IF INSTR(a$, "ebel") <> 0 OR INSTR(a$, "EBEL") <> 0 THEN GOTO rebels
IF INSTR(a$, "ader") <> 0 OR INSTR(a$, "ADER") <> 0 OR INSTR(a$, "arth") <> 0 OR INSTR(a$, "ARTH") <> 0 THEN GOTO vader
IF INSTR(a$, "orce") <> 0 OR INSTR(a$, "ORCE") <> 0 THEN GOTO force
IF INSTR(a$, "orusc") <> 0 OR INSTR(a$, "ORUSC") <> 0 THEN GOTO coruscant
IF INSTR(a$, "nvinci") <> 0 OR INSTR(a$, "NVINCI") <> 0 THEN GOTO invincible
IF INSTR(a$, "dmiral") <> 0 OR INSTR(a$, "DMIRAL") <> 0 OR INSTR(a$, "hrawn") <> 0 OR INSTR(a$, "HRAWN") <> 0 THEN GOTO thrawn
IF INSTR(a$, "aarin") <> 0 OR INSTR(a$, "AARIN") <> 0 THEN GOTO zaarin
IF INSTR(a$, "ndor") <> 0 OR INSTR(a$, "NDOR") <> 0 THEN GOTO dorr

COLOR 2: PRINT "'Sorry, but I don't know what to tell you about that ...'": GOSUB schleife: GOTO routine

dorr:
mis16 = -1: COLOR 2: PRINT "The Endor-System will see the end of the rebellion !!!": GOSUB schleife: GOTO routine

zaarin:
COLOR 2: PRINT "This TRAITOR ! Don't mention his name aboard this ship !": GOSUB schleife: GOTO routine

thrawn:
COLOR 2: PRINT "Thrawn was promoted to Grand Admiral because he hunted down the traitor"
PRINT "Zaarin and killed him for the Emperor.": GOSUB schleife: GOTO routine

invincible:
COLOR 2: PRINT "The 'Invincible' is a Super-Stardestroyer. As this she is the flagship of the"
PRINT "Emperor's fleet. Nothing can withstand her firepower for more than a few "
PRINT "minutes. Fleet Admiral Thrawn is the commander of this ship."
GOSUB schleife: GOTO routine

emperor:
COLOR 2: PRINT "The Emperor rules wisely over many, many systems. With his help, the might"
PRINT "of the empire will soon crush the rebellion. I have heard, that He even"
PRINT "now works on the final destruction of the rebel-scum."
GOSUB schleife: GOTO routine

ties:
COLOR 2: PRINT "These Ties you see over there are our new top-secret models. They are called"
PRINT "the Tie-Advanced and have been built to match the rebel X-Wings in speed and"
PRINT "firepower and in addition to this they are equipped with shield-systems and"
PRINT "are capable of hyperspacing. This at last will turn the tide !"
GOSUB schleife: GOTO routine

rebels:
COLOR 2: PRINT "These bastards ! They are sabotaging ships and attacking civilian freighters."
PRINT "My homeworld has been destroyed by rebel cruisers. We must protect the "
PRINT "core-worlds from the same destiny !"
GOSUB schleife: GOTO routine

vader:
COLOR 2: PRINT "Lord Vader, the black Lord of the Sith, is the right hand of Emperor Palpatine"
PRINT "He is causing fear in all of us but he is a great fighter and servant of an"
PRINT "old religion, which is called the 'force', if I am right."
IF mis14 >= -1 THEN PRINT "Right now he is on a secret mission for the emperor and has not returned yet." ELSE PRINT "Not long ago he returned from a secret mission concerning a new adept, I": PRINT "think."
GOSUB schleife: GOTO routine

force:
COLOR 2: PRINT "That old religion ? I'm sorry, but I don't know much about it except that"
PRINT "Lord Vader uses it."
GOSUB schleife: GOTO routine

coruscant:
COLOR 2: PRINT "Coruscant is the home-world of our Emperor. Usually he is in his palace"
PRINT "on the surface. But as far as I know, we are going to leave soon for a final"
PRINT "strike against the rebellion. The emperor wants to see the end of these puny"
PRINT "terrorists with his own eyes."
GOSUB schleife: GOTO routine

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
use = a
IF bs = -1 THEN RETURN
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
skills:
PRINT "If you know the number of the desired skill, then just enter it here."
PRINT "If you don't know it, just enter '0' to choose from the list."
INPUT "Your Command"; a
IF a < 0 OR a > 80 THEN CLS :  GOTO skills
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
IF bs = -1 THEN RETURN
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

jump:
COLOR 4: PRINT "You wait a few days until the Invincible is ordered to join the fleet in the"
PRINT "ENDOR-System...": GOSUB schleife
CLS
FOR i = 1 TO 80
RANDOMIZE TIMER
c = INT(RND * 2) + 1: IF c = 1 THEN c = 7
IF c = 2 THEN c = 15
a = INT(RND * 640) + 1
b = INT(RND * 480) + 1
PSET (a, b), c
NEXT i
DO WHILE INKEY$ = "": LOOP
FOR i = 1 TO 500
c = INT(RND * 16)
CIRCLE (320, 240), i, c
NEXT i
FOR i = 1 TO 500
CIRCLE (320, 240), i, 0
NEXT i
CLS : PSET (20, 80), 15
PSET (150, 10), 15
PSET (600, 300), 15
COLOR 2: CIRCLE (690, -20), 240: PAINT (639, 0), 2
CIRCLE (400, 300), 80, 15
LINE (320, 300)-(480, 300), 15
CIRCLE (420, 260), 20, 15, , , .9
PSET (420, 260), 15
COLOR 2: LOCATE 27, 2: PRINT "'Deathstar control here, it was about time you arrived. The rebels will arrive"
LOCATE 28, 6: PRINT "soon. You should transfer the secret agent to the surface right now !'": GOSUB schleife
endor:
planet$ = "Endor"
GOTO routine

