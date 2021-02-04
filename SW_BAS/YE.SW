SCREEN 12
COLOR 7
REM   ---------Yoda's /Vader's Hut
REM   -----------------------------
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
INPUT #1, dam, rebel, imper, jabba, x, Y, rancor
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
file$ = "ye.sw"
combat$ = ""
IF mis9 < 0 THEN geg$ = "Darth Vader" ELSE geg$ = "Yoda"
COLOR 7: PRINT "You enter a small hut. A feeling of endless pain and darkness surrounds you."
PRINT "You can feel the ";
COLOR 1: IF geg$ = "Yoda" THEN PRINT "light side of the force";  ELSE COLOR 4: PRINT "dark side of the force";
COLOR 7: PRINT " flooding the place."
PRINT "Out of another room you can hear ";
IF mis14 = -6 THEN geg$ = "": PRINT "nothing."
IF geg$ = "Yoda" THEN PRINT "someone coughing." ELSE IF geg$ = "Darth Vader" THEN PRINT "a fearsome breathing apparatus."
PRINT "Do you enter the room (y/n) ?"
enter:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN CLS : GOTO routine
IF a$ = "n" OR a$ = "N" THEN PRINT "You leave...": GOSUB schleife: GOSUB saver: RUN "dagmap.sw"
GOTO enter
routine:
IF mis14 = -6 THEN PRINT " The room is empty.": GOSUB schleife: GOSUB saver: RUN "dagmap.sw"
CLS : COLOR 7
PRINT "You are in a narrow room, that is filled with smoke. The smoke has a strange"
PRINT "smell, at first you think that you will suffocate, but then the smoke lightens"
PRINT "up a bit and you manage to breath normally."
PRINT "A reddish glow that seems to come from the floor is the only source of light"
PRINT "in here."
PRINT "On the far end of the room, "; : COLOR 4: PRINT geg$; : COLOR 7: PRINT " is waiting for you."
IF geg$ = "Darth Vader" THEN PRINT "His breathing apparatus is causing sickness in you."
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Talk to "; geg$
PRINT
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "G.Save Game"
PRINT "Q.Quit Game"
PRINT "V.View Character"
PRINT
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB saver: RUN "dagmap.sw"
IF a$ = "2" THEN GOTO talk
IF a$ = "U" OR a$ = "u" THEN GOTO items
IF a$ = "s" OR a$ = "S" THEN GOTO skill
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
GOTO routine

talk:
IF geg$ = "Yoda" THEN GOTO yoda ELSE GOTO vader
yoda:
DATA"Wars not make one great."
DATA"Tired I am."
DATA"900 years old, not good will you look."
DATA"This is no swamp this is my home."
DATA"My time will come soon."
DATA"Don't underestimate the power of the Emperor."
DATA"Vader will try to pull you to the dark side."
DATA"The dark side is not stronger. It is easier, more seductive."
DATA"The dark side could consume you."
DATA"Don't leave until your training is finished."
IF mis14 = -1 THEN GOTO mission
IF mis14 = -5 THEN GOTO yodausb
RESTORE yoda
RANDOMIZE TIMER
a = INT(RND * 10) + 1
FOR i = 1 TO a: READ a$: NEXT i
IF mis14 = -11 THEN a$ = "I am dissappointed. You will never become a true Jedi."
COLOR 2: PRINT a$
GOSUB schleife: GOTO routine
vader:
DATA"Chh-Pch Chh-Pch Chh-Pch...."
DATA"Are you sure of your feelings ?"
DATA"So be it ... Jedi."
DATA"The force is strong in this one."
DATA"The Emperor will donate you great power."
DATA"Surrender yourself to the dark side."
DATA"Do as you are told or die."
IF mis14 = -1 THEN GOTO mission
IF mis14 = -5 THEN GOTO vadausb
RESTORE vader
RANDOMIZE TIMER
a = INT(RND * 7) + 1
FOR i = 1 TO a: READ a$: NEXT i
IF mis14 = -11 THEN a$ = "You are a great dissappointment for the Emperor !"
COLOR 2: PRINT a$
GOSUB schleife: GOTO routine
mission:
COLOR 2: CLS
PRINT "So finally you have come to learn the teachings of ";
IF geg$ = "Yoda" THEN PRINT "the force." ELSE PRINT "the Emperor."
PRINT "You did much to ";
IF geg$ = "Yoda" THEN PRINT "deserve to be taught by me." ELSE PRINT "serve the Emperor."
PRINT "In return I will teach you the ways of the Jedi."
COLOR 7
PRINT "Accept (y/n) ?"
accepi:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO routine
IF a$ = "y" OR a$ = "Y" THEN GOTO ja
GOTO accepi
ja:
COLOR 2: PRINT "First you will need a lightsaber."
PRINT "I placed one in an old cave east of this hut. Try to get it."
mis14 = -2
GOSUB schleife
GOTO routine

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
PRINT #1, dam, rebel, imper, jabba, x, Y, rancor
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
PRINT #1, dam, rebel, imper, jabba, x, Y, rancor
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
use = a
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

yodausb:
CLS : COLOR 7: PRINT "Yoda hands you a Lightsaber."
COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it "; a
IF a < 1 OR a > 10 THEN GOTO yodausb
item$(a) = "Lightsaber"
COLOR 2: PRINT "I will teach you the way of the Jedi in the following weeks."
GOSUB schleife
IF mis12 = -2 OR mis12 = -3 THEN skill(10) = skill(10) - 1: PRINT "I see that you shot innocent ships."
IF rebel = -2 THEN skill(10) = -2: PRINT "I understand that you have betrayed the rebels on Tattooine."
IF lobot = -2 THEN skill(10) = skill(10) - 1: PRINT "You are too aggressive."
GOTO ausb

vadausb:
CLS : COLOR 7
PRINT "Vader looks at you and says:"; : COLOR 2
PRINT "Young "; name$; ", I will teach you the ways of the "
PRINT "the Emperor in the next weeks."
IF mis14 = -1 OR mis14 = -3 THEN skill(10) = skill(10) - 1: PRINT "I see that you shot several Imperial Fighters."
IF imper = -2 THEN skill(10) = -2: PRINT "I know that you blew up Echo Base."
GOSUB schleife
ausb:
COLOR 7: PRINT "Weeks pass..."
GOSUB schleife
skill(10) = skill(10) + 6
PRINT "When you have finished, "; geg$; " urges you to continue": PRINT "your training before the final confrontation."
GOSUB schleife: mis14 = -6
PRINT "Then he vanishes before your eyes."
GOSUB schleife
GOTO routine

