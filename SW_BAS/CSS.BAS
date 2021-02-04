SCREEN 12
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
file$ = "css.bas"
CLS : COLOR 7
IF mis7 > 0 THEN GOTO routine
IF mis5 = -1 THEN mis7 = 1: GOTO routine
IF mis5 = -2 THEN mis7 = 1: GOTO zugeschaut
IF mis5 = -4 THEN mis7 = 4: GOTO gekillt
IF mis5 = -5 THEN mis7 = 6: GOTO gekillt
GOTO routine
zugeschaut:
PRINT "As you set your first foot out of your ship, an angry Mon Cal comes running at"
PRINT "you:"; : COLOR 2: PRINT "I am Commander Wilburck, Chief of Staff on this station."
PRINT "What kind of man are you, watching as them Imperial scum are slaughtering "
PRINT "innocent people ? I dare you, we will have an eye on you in the future.": COLOR 7
PRINT "Then he turns around and rushes back to his office."
GOSUB schleife: GOTO routine
gekillt:
PRINT "As you leave your ship, several workers and soldiers are waiting to salute you."
PRINT "A uniformed Mon Cal stands in front of them and adresses you:"; : COLOR 2
IF mis5 = -4 THEN PRINT "Whatever your name is,";  ELSE PRINT name$; ",";
PRINT "we are most grateful for your attack on the Imperial Corvette. Without your"
PRINT "help, many people might well have died, because the 'Hanappy' came a bit late"
PRINT "to assist us."
PRINT "We will remember you.": COLOR 7: PRINT "Then they leave and return back to work."
GOSUB schleife: GOTO routine
routine:
COLOR 7: CLS
PRINT "You are aboard the "; : COLOR 4: PRINT "ZX-7/2 Factory Station"; : COLOR 7: PRINT " in orbit above Calamari. Workers"
PRINT "full of grease and oil rush around the place."
PRINT "Here on this"; : COLOR 4: PRINT " landing-platform"; : COLOR 7: PRINT ", you can see several X-Wings and about a dozen"
PRINT "of old Z-95 Headhunters. In addition to this you can see two Y-Wings."
PRINT "You can see a heavily guarded"; : COLOR 4: PRINT " fuel and weapons-depot"; : COLOR 7: PRINT " to the right and what "
PRINT "seems to be a "; : COLOR 4: PRINT "civilian area"; : COLOR 7: PRINT " to the left of your current position."
PRINT : COLOR 14
IF ship = -1 THEN PRINT "1.Board your ship": COLOR 7 ELSE PRINT "1.Board your shuttle": COLOR 7
PRINT "2.Have your ship repaired"
PRINT "3.Enter depot"
PRINT "4.Enter leisure area"
PRINT
PRINT "G.Save Game"
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "Q.Quit Game"
PRINT "V.View Character"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leave
IF a$ = "2" THEN GOTO repair
IF a$ = "3" THEN GOTO depot
IF a$ = "4" THEN GOTO leisure
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
GOTO routine

leave:
CLS
PRINT "You start up the engines, as your comm cracks:"; : COLOR 2
PRINT "This is tower F3, we will guide"
PRINT "you out with our tractor beams. Prepare to go to sub-light speed as soon"
PRINT "<Crack> as you are 200 klicks out. <Crack>"
COLOR 7
PRINT "Then your comm falls silent and your ship starts to lift off the ground and"
PRINT "moves out of the hangar. As soon as you are far enough, you go to sub-light"
PRINT "speed..."
GOSUB schleife: GOSUB saver: RUN "space.bas"

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
IF bs = -1 THEN RETURN
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "calfight": GOSUB saver: RUN "fight.bas"
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
COLOR 2: b = INT(RND * 50) + 1
IF c >= diff THEN PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A rebel saw what you tried to do!!!": combat$ = "calfight":  GOSUB saver: GOSUB schleife: RUN "fight.bas"
DO WHILE INKEY$ = "": LOOP
GOTO routine

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

leisure:
CLS : COLOR 7
PRINT "You enter a civilian area. Here there is no sign of a war between a Rebellion"
PRINT "and the Empire. People are laughing and amusing themselves, completely "
PRINT "ignoring you."
PRINT "This place seems to be a "; : COLOR 4: PRINT "bar"; : COLOR 7: PRINT " combined with a"; : COLOR 4: PRINT " whore house"; : COLOR 7: PRINT "."
IF mis8 > -3 THEN PRINT "A strange creature sits here. It looks a bit like a humanoid bull."
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Order a drink"
PRINT "3.Order a woman"
IF mis8 > -3 THEN PRINT "4.Talk to 'sitting bull'"
IF mis8 = -1 THEN PRINT "5.Order a cow"
PRINT
PRINT "U.Use Item"
PRINT "S.Use Skill"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "4" AND mis8 > -3 THEN GOTO talk
IF a$ = "2" THEN GOTO drink
IF a$ = "3" THEN GOTO woman
IF a$ = "5" AND mis8 = -1 THEN GOTO cow
IF a$ = "u" OR a$ = "U" THEN GOTO useitem
IF a$ = "s" OR a$ = "S" THEN GOTO useskill
GOTO leisure
talk:
IF mis8 = 0 THEN mis8 = -1: GOTO talk1
IF mis8 = -1 THEN GOTO talk2
IF mis8 = -2 THEN GOTO talk3
talk1:
PRINT "As you sit next to the creature, he looks at you frustrated and says:": COLOR 2
PRINT "I'm Fleet-admiral Lrac, I am a Taurus. My home world lies in the Minos Cluster."
PRINT "Maybe that's why they call me MINOTAURUS. I don't know."
PRINT "But that ain't the worst. The worst is that I am sitting here in the middle of"
PRINT "a red-light district, and not a single Taura is available."
PRINT "Can you help me ? No, nobody can help me.": COLOR 7
PRINT "Then he starts to weep sincerely."
GOSUB schleife: GOTO leisure
talk2:
PRINT "As you sit next to Lrac, he looks at you with tears in his eyes and asks:"
COLOR 2: PRINT "You didn't find a Taura for me, did you ? No, I can see it in your eyes."
PRINT "Don't tell me, there's enough already to make me weep.": COLOR 7
PRINT "Then he looks away from you and sniffs deeply."
GOSUB schleife: GOTO leisure
talk3:
COLOR 2: PRINT "Ah, my friend, sit down. You did a great deal for my .... physiologicial needs."
PRINT "If you ever want to apply for entering the rebel alliance, you have my word,"
PRINT "that I will recommend you to the Chief of staff. I will also inform Admiral"
PRINT "Ackbar. He's the Commander of the fleet, massing off Sullust, preparing for"
PRINT "the final attack."
IF mis3 = 0 THEN mis3 = -1: COLOR 4: PRINT "What's he talking about Sullust ?": COLOR 7
COLOR 2: PRINT "I have to leave now. I'm to meet with the fleet-commander."
mis8 = -3
GOSUB schleife: GOTO leisure

drink:
COLOR 2: PRINT "'This fine Calamarian Ale is for 5 Creds !'": COLOR 7
PRINT "Take one (y/n) ?"
IF cred < 5 THEN COLOR 4: PRINT "You can't afford it !": GOSUB schleife: GOTO leisure
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN cred = cred - 5: PRINT "You wash it down your throat.": GOSUB schleife: GOTO leisure
IF a$ = "n" OR a$ = "N" THEN GOTO leisure
GOTO drink
woman:
CLS : COLOR 7
PRINT "There are several women available:"
PRINT "  1.Test-Bed-Slave"
PRINT "  2.Cheyenne (red hair with a weapon in her hand)"
PRINT "  3.Babba (a Huttese)"
PRINT "  4.C3-"; : COLOR 4: PRINT "PO"; : COLOR 7: PRINT " (a protocol droidess)"
PRINT "  5.Garaoul (a Wookie)"
PRINT "  6.Blubb (a Calamarian female)"
PRINT "  and so on and so on."
PRINT
PRINT "Do you REALLY need this ? (0-go back)"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "0" THEN GOTO leisure
IF a$ = "1" THEN pr = 400
IF a$ = "2" THEN pr = 4000
IF a$ = "3" THEN pr = 200
IF a$ = "4" THEN pr = 400
IF a$ = "5" THEN pr = 600
IF a$ = "6" THEN pr = 400
COLOR 2: PRINT "'You will never forget about this, I promise. This lady costs"; pr; "creds.'"
COLOR 7: PRINT "Pay (y/n) ?"
pay:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO leisure
IF a$ = "y" OR a$ = "Y" THEN GOTO bich
GOTO pay
bich:
DATA"Uououoh","Hhhhhha","Yessss !","Mmmh","Aaah","Oooh","YES !","Uhhh","Hihi","YAPPADAPPADOO !","Oh you..","Deeper !","Faster !","Slower","MMMMmmmhhh"
IF pr > cred THEN COLOR 4: PRINT "Not enough money.": GOSUB schleife: GOTO woman
cred = cred - pr
CLS : PRINT "You pay and": GOSUB schleife
FOR i = 1 TO 12
CLS
RANDOMIZE TIMER
u = INT(RND * 15) + 1
RESTORE bich
FOR a = 1 TO u: READ a$: NEXT a
c = INT(RND * 15) + 1
a = INT(RND * 70) + 1
b = INT(RND * 29) + 1
COLOR c
LOCATE b, a: PRINT a$
GOSUB schleife
NEXT i
DO WHILE INKEY$ <> "": LOOP
CLS : COLOR 7: PRINT "That's it."
PRINT "You gained "; : COLOR 4: PRINT "1"; : COLOR 7: PRINT " xp !": xp = xp + 1
GOSUB schleife: GOTO leisure
cow:
PRINT "You move up to a pimp and ask for a cow.": GOSUB schleife
COLOR 2: PRINT "'Sorry sir, but cows are out for today.'": GOSUB schleife: GOTO leisure
useitem:
bs = -1: GOSUB items: bs = 0
IF item$(use) = "Picture of Cow" THEN GOTO kuh
PRINT "Of no use here.": GOSUB schleife: GOTO leisure
kuh:
CLS : mis8 = -2: item$(use) = "": xp = xp + 3500
PRINT "As you hand your Picture to Lrac, his face lightens up and he looks at you."
COLOR 2: PRINT "Not as good as a 'PLAYCOW' but still...thank you, thank you, thank you."
PRINT "How can I ever thank you ? But wait a moment, I think I have to check something.": COLOR 7
PRINT "With this words he jumps up and sneaks into a public toilet.": GOSUB schleife
PRINT "About 2 minutes later, he comes out with a very relieved expression in his"
PRINT "face and the picture sticking on one of his horns."
COLOR 2: PRINT "I had to check something with a potential Imperial spy, you know."
GOSUB schleife
COLOR 7
kuhfr:
PRINT "  1.Of course, many Imperial spies are here."
PRINT "  2.Yes sure, I think I saw the spy."
PRINT "  3.A spy on a public toilet ?"
PRINT "  4.Was it the spy that put the picture up there ?"
INPUT "What do you answer "; a
IF a < 1 OR a > 4 THEN GOTO kuhfr
IF a = 1 THEN PRINT "The Minotaur smiles self-confident."
IF a = 2 THEN PRINT "The Minotaur smiles uneasily."
IF a = 3 THEN COLOR 2: PRINT "He tried to hide there."; : COLOR 7: PRINT "Lrac seems to be uneasy."
IF a = 4 THEN PRINT "Lrac's horns blush red with shame."
GOSUB schleife: GOTO leisure

useskill:
bs = -1: GOSUB skills: bs = 0
PRINT "Of no use here.": GOSUB schleife: GOTO leisure

depot:
IF weap$ = "Lightsaber" THEN GOTO depot1
IF weap$ = "Vibro Axe" THEN GOTO depot1
IF weap$ = "SC-75 Rifle" THEN GOTO depot1
IF INSTR(weap$, "old-out") <> 0 THEN GOTO depotrout
PRINT "You are stopped by a guard:"; : COLOR 2
PRINT "'No sir, I can easily see, that you have a "; weap$; "."
PRINT "No Blaster-like weapon is allowed in here. Too dangerous!": GOSUB schleife: GOTO routine
depotrout:
COLOR 14: PRINT "You carefully hide your weapon in your hand...": GOSUB schleife
akt = skill(53): GOSUB roll
IF rolled > 10 THEN GOTO depot1
COLOR 2: PRINT "'Stop ! I can clearly see your Blaster !'": GOSUB schleife: GOTO routine
depot1:
uuu = 0: FOR i = 1 TO 10
IF INSTR(item$(i), "laster") <> 0 THEN uuu = 1
NEXT i
IF uuu = 1 THEN PRINT "You are searched and Blasters/Blaster-components are found.": COLOR 2: PRINT "Not in here !": GOSUB schleife: GOTO routine
CLS : COLOR 7
PRINT "You stand in the midst of a huge weapon and fuel depot. In the distance you"
PRINT "can see a "; : COLOR 4: PRINT "generator"; : COLOR 7: PRINT " working."
PRINT "It humms happily and seems to provide the power for the whole station."
PRINT "One well-placed Blaster hit...But, you wouldn't do that, would you ?"
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
IF INSTR(weap$, "laster") <> 0 THEN PRINT "2.Fire at will"
PRINT
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" AND INSTR(weap$, "laster") <> 0 THEN GOTO shoot
IF a$ = "u" OR a$ = "U" THEN GOTO useit
IF a$ = "s" OR a$ = "S" THEN GOTO usesk
GOTO depot1
useit:
bs = -1: GOSUB items: bs = 0
IF item$(use) = "Detonite-Pack" THEN GOTO deton
PRINT "Of no use here.": GOSUB schleife: GOTO depot1
usesk:
bs = -1: GOSUB skills: bs = 0
PRINT "Of no use here."
GOSUB schleife: GOTO depot1
deton:
akt = skill(68): GOSUB roll
IF rolled < 7 THEN GOTO det
PRINT "Your knowledge about Demolition tells you, that it would not be wise to use"
PRINT "Detonite in an area near a powerful generator."
PRINT "Do you still want to blow up the depot (y/n) ?"
ups:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO det
IF a$ = "n" OR a$ = "N" THEN GOTO depot1
GOTO ups
det:
COLOR 4: PRINT "Just as you try to attach it, a bolt of lightning shoots out of the Generator"
PRINT "and brings the Detonite-Pack to explode in your hands.": GOSUB schleife: COLOR 7
PRINT "Do you know what they tell little children here ?"
PRINT "Don't ever go near a Generator with a Detonite-Pack..."
GOSUB schleife: RUN "starwars.bas"
shoot:
PRINT "You look around to see if noone's watching you and pull out your hidden"
PRINT "Blaster. You shoot at the Generator and hit."
GOSUB schleife
PRINT "First nothing happens, but then the humming grows louder and louder."
PRINT "Suddenly the alert goes off:"; : COLOR 4: PRINT "RED ALERT ! REACTOR CORE IS OVERLOADING !"
PRINT "CORE BREACH IS IMMINENT ! EVACUATE IMMEDIATELY ! WARNING ! RED ALERT !"; : COLOR 7: PRINT "(...)"
PRINT "The Station personell panics and runs for the hangar."
PRINT "Do you flee (y/n) ?"
und:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO flee
IF a$ = "n" OR a$ = "N" THEN GOTO die
GOTO und
flee:
COLOR 2: CLS : xp = xp + 2000
PRINT "You run for your ship and start as quickly as possible."
PRINT "Behind you the ZX-7/2 Station detonates in a huge fireball."
IF speed = 8 THEN speed = 7: PRINT "Unfortunately your ship is caught in the explosion and slightly scratched.": status$ = "scratched"
mis7 = -1
GOSUB schleife: GOSUB saver: RUN "space.bas"
die:
CLS
PRINT "To put it simply: "; : COLOR 4: PRINT "You are DEAD."
GOSUB schleife: RUN "starwars.bas"

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

