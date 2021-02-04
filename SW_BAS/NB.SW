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
CLS
file$ = "nb.sw"
CLS : COLOR 7
routine:
CLS : COLOR 7
PRINT "You are aboard a "; : COLOR 4: PRINT "rebel-medical frigate"; : COLOR 7: PRINT ". Technicans and medics are rushing about"
PRINT "the place. Your ship is guarded and thouroghly searched by soldiers."
PRINT "Mainly transports and shuttles are aboard this ship. Not a single fighter can"
PRINT "be seen on the hangar."
PRINT "You are escorted and carefully watched by a pair of soldiers."
IF mis9 < 0 THEN COLOR 4: PRINT "Suddenly one of the Soldiers shouts:"; : COLOR 2: PRINT "He's a spy !": COLOR 7: GOTO spion
PRINT
IF ship = -1 THEN COLOR 14: PRINT "1.Board your ship": COLOR 7
IF ship = -2 THEN COLOR 14: PRINT "1.Board your shuttle": COLOR 7
PRINT "2.Visit Commander of frigate"
PRINT "3.Visit a medic"
PRINT "4.Have your ship repaired"
PRINT
PRINT "G.Save Game"
PRINT "S.Use Skill"
PRINT "U.Use Item"
PRINT "Q.Quit Game"
PRINT "V.View Character"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO board
IF a$ = "2" THEN GOTO commander
IF a$ = "3" THEN GOTO medic
IF a$ = "4" THEN GOTO repair
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "U" OR a$ = "u" THEN GOTO items
IF a$ = "q" OR a$ = "Q" THEN RUN "Starwars.bas"
IF a$ = "V" OR a$ = "v" THEN GOTO viewchar
GOTO routine

board:
CLS : COLOR 7
PRINT "You are catapulted out of the ship with a tractor-beam.": COLOR 2
PRINT "'Bye, "; ship$; ". Remember, that we know now who you are...": COLOR 7
GOSUB saver: GOSUB schleife: RUN "space.sw"

commander:
CLS : COLOR 7
PRINT "You are escorted to the Commander's cabin."
IF mis8 > -3 THEN PRINT "Unfortunately Commander Lrac has not returned from his visit to ZX-7/2, yet.": GOSUB schleife: GOTO routine
IF mis10 = -1 THEN COLOR 7 ELSE GOTO mission
PRINT "At the cabin you find an old friend of yours. The Minotaur Commander Lrac.": COLOR 2
PRINT "'Ah, my friend !'"; : COLOR 7: PRINT " (You recognize the picture on his left horn...)": COLOR 2
PRINT "So you have found your way here, finally. Well, as you see, we are preparing"
PRINT "for our final attack on the Empire."
IF mis7 = -1 THEN PRINT "Unfortunately I cannot tell you any more, because the whole mission is Top-": PRINT "Secret. (Of course). I have to ask you to leave as soon as possible.": GOSUB schleife: GOTO routine
PRINT "You may have heard about the Death-Star Battle-Station that has destroyed"
PRINT "Alderaan. Well, the Empire is at the moment building a new Death-Star, even"
PRINT "more powerful than the other has been."
PRINT "Our Bothan spies have found out the location of this Battle-Station and, more"
PRINT "importantly, they found out that the Emperor himself is supervising the"
PRINT "finishing of his new weapon."
PRINT "We have to take the chance, to destroy him together with his Death-Star."
PRINT "I would like you to join us, when the time is right."
PRINT "But now please leave me alone."
mis10 = -2: GOSUB schleife: GOTO routine
mission:
IF mis13 = 0 THEN COLOR 7: CLS : PRINT "Lrac is busy at the moment.": GOSUB schleife: GOTO routine
CLS : COLOR 7
PRINT "Lrac's eyes lighten up as he sees you enter."; : IF mis10 < -2 THEN GOTO schonda
COLOR 2: PRINT "'Hello, young": mis10 = -3
PRINT "friend ! So you have returned finally. I am very pleased to see you again"
PRINT "after such a long time. The time will soon come to deliver a final killing"
PRINT "blow to the empire.": GOSUB schleife: COLOR 7
PRINT "Suddenly he becomes serious:"; : COLOR 2: PRINT "Our bothan spies have found out the secret"
PRINT "location, where a second Death-star is being built. They also found out, that"
PRINT "its weapon-systems are not yet ready to see combat. It is just protected by"
PRINT "a shield-generator which is located at a nearby moon."
PRINT "But the most important thing is that the Emperor himself is visiting the "
PRINT "station to see it being finished. We have to strike with our whole fleet."
GOSUB schleife
PRINT "We need you to fly there in a Tyderian shuttle with a cracked Imperial sec-code"
PRINT "You will land on Endor -that's the name of the moon- and destroy the shield"
PRINT "generator while our battleships will surround the Deathstar and finish it off"
PRINT "together with Palpatine.'": COLOR 7
schonda:
PRINT
PRINT "1.Prepare to head for Endor"
PRINT "2."; : COLOR 2: PRINT "I'm afraid there is something I must do before this. I'll be back !": COLOR 7
haha:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO jump
IF a$ = "2" THEN COLOR 2: PRINT "Be back soon ! There's not much time left.": GOSUB schleife: GOTO routine
GOTO haha

repair:
pr = 8 - speed
pr = pr * 9000
IF pr = 0 THEN COLOR 4: PRINT "Your ship is NOT damaged.": GOSUB schleife: GOTO routine
COLOR 2: IF mis5 = -4 OR mis5 = -5 THEN pr = 0
PRINT "That would cost";
IF pr > 0 THEN PRINT pr; "Credits." ELSE PRINT " nothing for you."
IF cred < pr THEN COLOR 4: PRINT "Not enough money !": GOSUB schleife: GOTO routine
IF pr = 0 THEN a$ = "y" ELSE INPUT "Pay (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN cred = cred - pr: speed = 8: status$ = "Okay": PRINT "The "; ship$; " is repaired.": GOSUB schleife
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

medic:
COLOR 4: PRINT "The Medic-droid examines you...": COLOR 2
IF lost = 0 THEN PRINT "You are in a good shape for a human.": GOSUB schleife: GOTO learn
PRINT "Ah, I see. Let me fix this problem you have."
COLOR 7: PRINT "The droid helps you for free."
haha = lost: lost = 0: PRINT "You are fully healed."
GOSUB verwundet: GOSUB schleife: GOTO routine
learn:
IF skill(71) >= 3 AND skill(74) = 0 THEN PRINT "'But I think you could learn from me." ELSE GOTO routine
PRINT "I would charge you 5000 Credits to teach you the "; : COLOR 4: PRINT "Medicine-skill": COLOR 2
IF cred < 5000 THEN COLOR 4: PRINT "You don't have enough money!": GOSUB schleife: GOTO routine
und:
INPUT "Do you want to take a few lessons (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO routine
IF a$ = "Y" OR a$ = "y" THEN cred = cred - 5000: skill(74) = 1: GOTO ijo
GOTO und
ijo:
COLOR 7: PRINT "After a few hours, the droid has taught you the basic principles of Medicine."
PRINT "Your understanding of medpacs has been increased."
GOSUB schleife: GOTO routine

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


spion:
GOSUB schleife
PRINT "You are brought before the station's commander."; : COLOR 2: PRINT "What have you found ?": COLOR 7
PRINT "One of the soldiers who have searched your ship, produces a device, you have"
PRINT "never seen before.": COLOR 2
PRINT "We found this Imperial Homing Beacon on his ship."; : COLOR 7: PRINT "The Commander looks"
PRINT "at you with disgust."; : COLOR 2: PRINT "Do me a favor, die you ugly traitor !": COLOR 7
GOSUB schleife
PRINT "You are shot immediately.": GOSUB schleife: RUN "starwars.bas"

jump:
COLOR 2: PRINT "Take these with you.": COLOR 7: PRINT "With these words, Lrac hands you two Detonite-"
PRINT "packs and two Medpacs": GOSUB schleife
FOR dyn = 1 TO 4
backpack:
CLS
COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
PRINT "Where do you want to put the"; STR$(dyn); ".Pack "; : INPUT a
IF a = 0 THEN CLS : GOTO backpack
IF a < 1 OR a > 10 THEN CLS : GOTO backpack
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE CLS : GOTO backpack
IF dyn < 3 THEN item$(a) = "Detonite-Pack" ELSE item$(a) = "Medpac"
NEXT dyn
CLS : COLOR 14: PRINT "You board the Tyderian shuttle as soon as you are ordered to.": GOSUB schleife
COLOR 2: PRINT "May the force be with you !"; : COLOR 7: PRINT " Lrac waves you goodbye..."
PRINT "You leave the hangar of the Nebulon-B-Frigate and set the Astrogation console"
PRINT "to the Endor-System.": GOSUB schleife
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
COLOR 2: LOCATE 27, 6: PRINT "'This is Deathstar-control to Tyderian shuttle. What is your cargo ?'": GOSUB schleife
COLOR 10: LOCATE 27, 6: PRINT "We have spare-parts for the tech-crew on Endor...                    ": GOSUB schleife
COLOR 2: LOCATE 27, 6: PRINT "'Transmit your security code now !'                       ": GOSUB schleife
COLOR 10: LOCATE 27, 6: PRINT "A-SC-P-75-AoSC-Cthulhu,Great-NyarlathoSC": GOSUB schleife
COLOR 7: LOCATE 27, 6: PRINT "I hope this code REALLY is right.                         ": GOSUB schleife
LOCATE 27, 6: PRINT "(...)                                      ": GOSUB schleife
LOCATE 27, 6: PRINT "<GULP>   ": GOSUB schleife
COLOR 2: LOCATE 27, 6: PRINT "'You are cleared to pass...The planetary shield has been opened.'": GOSUB schleife
COLOR 7: LOCATE 27, 6: PRINT "Whew !                                                            ": GOSUB schleife
planet$ = "Endor"
x = 20: y = 16
GOSUB saver
CLS : COLOR 2: PRINT "You land in the woods far away from the bunker .": GOSUB schleife
RUN "enmap.sw"

