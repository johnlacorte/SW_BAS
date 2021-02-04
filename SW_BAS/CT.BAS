SCREEN 12
COLOR 7
REM   ---------The CAVE / The TEST
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
file$ = "ct.bas"
combat$ = ""
IF mis9 < 0 THEN geg$ = "Darth Vader" ELSE geg$ = "Yoda"
IF mis14 = -2 THEN GOTO routine
IF mis14 = -4 THEN GOTO testend
IF mis14 = -10 THEN GOTO versagt
COLOR 7: PRINT "Nothing special is here that deserves your attention."
GOSUB schleife: RUN "dagmap.bas"
routine:
PRINT "As you strive further into the cave, the light grows dimmer."
FOR i = 1 TO 10
IF item$(i) = "Glowrod" THEN glow = -1
NEXT i
IF glow = -1 THEN PRINT "Thanks to the Glowrod, you can see." ELSE COLOR 4: PRINT "You can't see a thing.": COLOR 7
PRINT "Strange sounds can be heard."
PRINT "Go further (y/n) ?"
GOSUB janein
IF ja = 0 THEN PRINT "You leave the place with a strange feeling in your stomach.": GOSUB schleife: GOSUB saver: RUN "dagmap.bas"
PRINT "You walk deeper into the cave.";
IF glow = 0 THEN COLOR 4: PRINT " It is all black now. You can't see a thing.": COLOR 7 ELSE PRINT "Your Glowrod shines at filthy looking pools of black fluid."
PRINT "The ground feels muddy."
PRINT "The strange sounds grow louder."
PRINT "Go further (y/n) ?"
GOSUB janein
IF ja = 0 THEN PRINT "You find your way back to the surface.": GOSUB schleife: GOSUB saver: RUN "dagmap.bas"
PRINT "You walk deeper into the cave.";
IF glow = 0 THEN COLOR 4: PRINT "Still you can't see a thing.": COLOR 7 ELSE PRINT " The cave looks now as if it got more narrow."
PRINT "The strange sounds you heard before have abruptly stopped."
PRINT "Go further (y/n) ?"
GOSUB janein
IF ja = 0 THEN PRINT "You flee in a haste.": GOSUB schleife: GOSUB saver: RUN "dagmap.bas"
PRINT "You walk through a narrow passage. You have difficulties in coming through."
COLOR 4: PRINT "Suddenly a loud noise like an explosion comes to your ear.": COLOR 7
GOSUB schleife
akt = stat(4): GOSUB roll
IF rolled > 9 THEN PRINT "You are not very surprised ... fortunately.": GOTO weiter
PRINT "You are surprised !": akt = stat(1): GOSUB roll
IF rolled > 20 THEN PRINT "Luckily you keep a firm grip on your weapon.": GOTO weiter
PRINT "You drop your "; weap$; " !"
IF glow = 0 THEN COLOR 4: PRINT "You can't see anything in the darkness.": lost$ = weap$: weap$ = "Fists": dam = stat(5) - 1: COLOR 7: GOTO weiter
PRINT "Fortunately you took your glowrod with you. You pick up your dropped weapon."
weiter:
PRINT "Behind you, the cave collapses."
GOSUB schleife
mis14 = -3
test:
IF geg$ = "Yoda" THEN a$ = "Surrender yourself to the Dark side or prepare to die.": b$ = "Darth Vader"
IF geg$ = "Darth Vader" THEN a$ = "I am your friend. Don't be consumed by the Dark side": b$ = "Luke Skywalker"
PRINT "Suddenly a blue glow comes from the ground ."; : IF glow = 0 THEN COLOR 1: PRINT "You can see once again.": COLOR 7
GOSUB schleife:
PRINT "Slowly you can make someone out in the distance."
PRINT "The dark figure says:"; : COLOR 2: PRINT "I am "; b$; "."
PRINT "I dare you. "; a$
COLOR 7: PRINT "What do you do ?"
PRINT "  1. Drop your weapons."
PRINT "  2. Attack the figure in a frenzy."
na:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO drop
IF a$ = "2" THEN GOTO attack
GOTO na
drop:
IF geg$ = "Darth Vader" THEN PRINT "The figure attacks you !": GOSUB schleife: combat$ = "dummy": weap$ = "Fists": dam = stat(5) - 1: mis14 = -10: GOSUB saver: RUN "fight.bas"
mis14 = -4
xp = xp + 2000: PRINT "Before you the picture of Vader fades into grey.": GOSUB schleife: GOTO testend

attack:
IF geg$ = "Yoda" THEN combat$ = "self": mis14 = -10: GOSUB saver: RUN "fight.bas"
combat$ = "dummy": mis14 = -4: GOSUB saver: RUN "fight.bas"

testend:
CLS
COLOR 2: PRINT geg$; : COLOR 7: PRINT " suddenly stands before you.": COLOR 2
PRINT "You did well there, young JEDI ! Now return to my hut ";
IF geg$ = "Yoda" THEN PRINT "to accept your Lightsaber." ELSE PRINT "."
COLOR 7: PRINT "Then, suddenly, you are standing on the surface again.": COLOR 2
mis14 = -5: IF weap$ = "Fists" THEN dam = 5: PRINT "Take this Heavy Blaster from me.": weap$ = "Heavy Blaster"
GOSUB schleife: GOSUB saver: RUN "dagmap.bas"

versagt:
CLS : mis14 = -11
IF geg$ = "Yoda" THEN PRINT "Yoda stands in front of you." ELSE GOTO fader
COLOR 2: PRINT "No, I'm afraid you won't make a good Jedi. Return to my hut now."
COLOR 7: PRINT "Then, suddenly, you are standing on the surface again.": COLOR 2
IF weap$ = "Fists" THEN dam = 5: weap$ = "Heavy Blaster": PRINT "Take this Heavy Blaster from me."
GOSUB schleife: GOSUB saver: RUN "dagmap.bas"
fader:
PRINT "Vader hovers in front of you.": COLOR 2
PRINT "The Emperor will not be very fond of this...": COLOR 7: PRINT "Then he fades from vision."
PRINT "Suddenly you are standing on the surface again."
COLOR 2
IF weap$ = "Fists" THEN weap$ = "Heavy Blaster": dam = 5: PRINT "Take this Heavy Blaster, you sob."
GOSUB schleife: GOSUB saver: RUN "dagmap.bas"

janein:
ja = 0
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN ja = -1: RETURN
IF a$ = "n" OR a$ = "N" THEN ja = 0: RETURN
GOTO janein

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

schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

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

