REM -------Rebelbase
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
file$ = "rh.sw"
combat$ = ""
IF rebel = -2 THEN GOTO zerstort
halt:
COLOR 4: PRINT "As you enter the outpost you are stopped by a guard: "; : COLOR 2: PRINT "Stop stranger!": PRINT "What do you want ?"; : COLOR 4: PRINT " A Blaster Rifle aims for your heart."
COLOR 7: PRINT "1.I will kill you all, you stupid rebel monkeys!"
PRINT "2.I am here to trade with the rebellion."
PRINT "3.I have come to become a member of your alliance."
PRINT "4.Just popped by to warn you that there are Imperials looking for ya!"
INPUT "What do you say"; a
IF a < 1 OR a > 4 THEN CLS : GOTO halt
IF a = 1 THEN combat$ = "rebelguard": file$ = "tatmap.sw": COLOR 4: PRINT "Die, traitor !": GOSUB saver: GOSUB schleife: RUN "fight.sw"
COLOR 2: PRINT "He eyes you suspiciously but lets you in.": op = 1

routine:
IF op = 0 THEN CLS
op = 0
COLOR 7: PRINT "You are in a filthy looking"; : COLOR 4: PRINT " rebel-hideout"; : COLOR 7: PRINT ". Soldiers are patrolling the area."
PRINT "There is a small landing site here, which can't be seen from the outside"
PRINT "while the hangar doors are closed. So this is why the Imperials haven't found"
PRINT "'em yet."
PRINT "You wonder, why they let you in so easily."
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Trade"
PRINT "3.Contact medic droid"
PRINT "4.Talk to Leader"
PRINT
PRINT "V.View Character"
PRINT "G.Save Game"
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "Q.Quit Game"
PRINT
PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB saver: RUN "tatmap.sw"
IF a$ = "3" THEN GOTO medic
IF a$ = "4" THEN GOTO leader
IF a$ = "2" THEN GOTO trade
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "u" OR a$ = "U" THEN GOTO item
IF a$ = "s" OR a$ = "S" THEN GOTO skill
GOTO routine

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
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "rebelguard": file$ = "tatmap.sw": GOSUB saver: RUN "fight.sw"
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
IF c >= diff THEN PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A rebel saw what you tried to do!!!": combat$ = "rebelguard": file$ = "tatmap.sw": GOSUB saver: GOSUB schleife: RUN "fight.sw"
DO WHILE INKEY$ = "": LOOP
GOTO routine

REM ---------Use an item
item:
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

leader:
DATA "The Emperor is corrupting the minds of those who serve him."
DATA"A new Deathstar is being built at an unknown location."
DATA"Jabba the Hutt is the mightiest person on this planet."
DATA"The 'Defiant' in orbit around Tattooine is waiting to start a planetary bombardment as soon as they have found us."
DATA"Governor Hotchkin is the Sector commander's pet!"
DATA"We desperatly need more weapons if we want to overrun the Imperials on this planet."
DATA"Can you deliver blaster rifles?"
DATA"Don't trust Jabba. He has a deal with you today and kills you tomorrow."
DATA"A long time ago, in a galaxy far far away..."
RESTORE leader
RANDOMIZE TIMER: a = INT(RND * 9) + 1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
GOSUB schleife: GOTO routine

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

trade:
CLS : COLOR 7
PRINT "You find yourself in a "; : COLOR 4: PRINT "loading area"; : COLOR 7: PRINT " beside an old YT-1300 into which crates"
PRINT "designated 'Blaster Rifles' are loaded."
PRINT "A Rebel officer looks at you questioningly."
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Sell something"
PRINT "3.Buy something"
COLOR 2: PRINT "'We need weapons. Especially Blaster Rifles.'"
COLOR 7: PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO sell
IF a$ = "3" THEN GOTO buy
GOTO trade
sell:
CLS : COLOR 7
PRINT "Your backpack:"
PRINT "--------------"
FOR i = 1 TO 10: PRINT STR$(i); "."; item$(i): NEXT i
INPUT "Sell what (0-back)"; a
IF a = 0 THEN GOTO trade
IF a < 1 OR a > 10 OR item$(a) = "" THEN GOTO sell
COLOR 2: a$ = ""
IF INSTR(item$(a), "modified") <> 0 THEN pr = 1200: a$ = "Modified weapons are used by most of our soldiers !"
IF item$(a) = "Blaster Rifle" THEN pr = 700: a$ = "Great! We need them like our daily bantha steak."
IF item$(a) = "Blast vest" THEN pr = 100: a$ = "I'll take it."
IF item$(a) = "Vibro Axe" THEN pr = 500: a$ = "A good close combat weapon."
IF INSTR(item$(a), "laster") <> 0 AND a$ = "" THEN pr = 150: a$ = "I'd prefer Blaster Rifles."
IF item$(a) = "Frag Grenade" THEN pr = 200: a$ = "We can use these."
IF item$(a) = "Thermal Detonator" THEN pr = 1000: a$ = "Our Bothan spys love these babies."
IF a$ = "" THEN pr = 0: a$ = "Naa, we don't need this."
PRINT a$: IF pr = 0 THEN GOSUB schleife: GOTO sell
PRINT "I would pay"; pr; "for it."
hko:
COLOR 7: INPUT "Is this okay(y/n)"; a$
IF a$ = "y" OR a$ = "Y" THEN cred = cred + pr: item$(a) = "": GOTO sell
IF a$ = "n" OR a$ = "N" THEN GOTO sell
GOTO hko
buy:
CLS
COLOR 2: PRINT "'I'm afraid our offers are not as good as at the bazaar in Mos Eisley."
PRINT "But there are some things you can't buy in Mos Eisley.'"
COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Thermal Detonator   1500 Cr."
PRINT "3.Frag Grenade         600 Cr."
PRINT "4.Heavy Blaster        400 Cr."
PRINT "5.Medpac               150 Cr."
PRINT "6.Glowrod              100 Cr."
PRINT "7.Detonite-Pack      10000 Cr."
COLOR 4: PRINT "You have"; cred; "Credits."
COLOR 7: PRINT : INPUT "Your command"; a
a$ = "": pr = 0
erk$ = "": IF a = 1 THEN GOTO trade
IF a = 2 THEN a$ = "Thermal Detonator": pr = 1500: erk$ = "This baby blows the hell out of your enemies. Though harder to use and more expensive than a frag grenade, it hardly lets your enemies survive."
IF a = 3 THEN a$ = "Frag Grenade": pr = 600
IF a = 4 THEN a$ = "Heavy Blaster": pr = 400
IF a = 5 THEN a$ = "Medpac": pr = 150: erk$ = "Cure light wounds with this baby."
IF a = 6 THEN a$ = "Glowrod": pr = 100: erk$ = "This device provides light AND heat."
IF a = 7 THEN a$ = "Detonite-Pack": pr = 10000: erk$ = "You need to blow up something really nasty ? This is what you need to do the job properly."
IF pr = 0 THEN GOTO buy
COLOR 2: PRINT "That'll be"; pr; "credits."
IF erk$ <> "" THEN PRINT erk$
ich:
INPUT "Is this okay for you (y/n) "; b$
IF b$ = "n" OR b$ = "N" THEN GOTO buy
IF b$ = "y" OR b$ = "Y" THEN GOTO ja
GOTO ich
ja:
COLOR 4: IF cred < pr THEN PRINT "You don't have enough money!": GOSUB schleife: GOTO buy
COLOR 14: FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
INPUT "Put it where "; a
IF a < 1 OR a > 10 THEN GOTO buy
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a);  ELSE GOTO zupf
INPUT "(y/n)"; b$
IF b$ = "y" OR b$ = "Y" THEN GOTO zupf ELSE GOTO buy
zupf:
IF pr = 10000 THEN COLOR 2: PRINT "This baby blows up everything !"
item$(a) = a$: cred = cred - pr: COLOR 2: PRINT "Thank you very much."
GOSUB schleife: GOTO buy

zerstort:
CLS : COLOR 4
PRINT "Inside the crater you manage to find the former entrance. As you move in a"
PRINT "horriffic stench surrounds you. You smell burnt corpses everywhere."
PRINT "Even some dead Stormtroopers are lying here. Seems some Rebels survived the "
PRINT "bombardment. Hopefully they don't know who gave them away."
PRINT "You can't find anything you could use among the debris."
COLOR 2: PRINT "Leave (y/n)"; : INPUT a$
IF a$ = "y" OR a$ = "Y" THEN RUN "tatmap.sw"
IF a$ = "n" OR a$ = "N" THEN GOTO bleiben
GOTO zerstort
bleiben:
COLOR 4
RANDOMIZE TIMER
a = INT(RND * 10) + 1: IF a = 1 THEN GOTO entdeckt
PRINT "Still you find nothing of interest."
COLOR 2: INPUT "Finally leave (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN GOSUB saver: RUN "tatmap.sw"
GOTO bleiben
entdeckt:
PRINT "Suddenly you hear a voice behind you:"; : COLOR 2: PRINT "'Don't move traitor! We know who you are !'."
combat$ = "rebfight": GOSUB saver: RUN "fight.sw"

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

schleife:
DO WHILE INKEY$ = "": LOOP
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

