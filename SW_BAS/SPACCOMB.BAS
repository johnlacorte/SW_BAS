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
CLS : ups = 0
REM Gegner...Bezeichnung,Waffe,Attacken,Schaden,Hitchance,strength+shields,speed,skill
gegner:
DATA "Corvette","Turbolaser Cannon",6,5,7,8,4,4
DATA "Tie-Interceptor","Laser Cannon",1,6,8,3,12,4
DATA"YT-1300","Laser Cannon",1,4,5,4,6,2
DATA"X-Wing Fighter","Laser Cannons",1,6,7,5,9,3
DATA"Imperial Star-Destroyer","Turbolaser Battery",25,10,12,16,3,3
DATA"Ghtroc Freighter","Laser Cannon",1,4,4,4,3,2
DATA"Lone Scout-A","Laser Cannon",1,4,3,5,5,3
DATA"Tie-Fighter","Laser Cannon",1,5,6,2,10,4
DATA"Y-Wing","Laser Cannon",1,5,6,5,7,4
DATA"Galactic Wheel","Turbolaser Cannon",4,7,4,11,0,0

DO WHILE INKEY$ <> "": LOOP

RANDOMIZE TIMER
a = INT(RND * 9) + 1
IF planet$ = "Coruscant" THEN a = 2
IF planet$ = "Calamari" THEN a = 4
IF planet$ = "Sullust" THEN a = 4
IF a = 5 AND combat$ = "" THEN GOTO gegner
IF combat$ = "corvette" THEN a = 1: LOCATE 17, 5: PRINT "Just as you attack a Heavy Calamari Cruiser comes out of Hyperspace.": GOSUB schleife: CLS
IF combat$ = "defiant" THEN a = 5
IF combat$ = "tie" THEN a = 8: COLOR 2: LOCATE 17, 12: PRINT "'You have violated military space. Prepare to be destroyed !'": GOSUB schleife: CLS
IF combat$ = "wheel" THEN a = 10
COLOR 7
RESTORE gegner
FOR i = 1 TO a: READ geg$, waf$, att, scha, dice, hull, spd, piloting
RANDOMIZE TIMER
B = INT(RND * 2) + 1
IF B = 1 THEN piloting = piloting + 1: dice = dice + 1
NEXT i
starthull = hull
IF combat$ = "corvette" THEN geg$ = "CRV G'nabgib": att = att - 2: spd = spd - 2: scha = scha - 1: dice = dice - 1
IF combat$ = "defiant" THEN geg$ = "ISD 'Defiant'": hull = hull + 5: scha = scha + 3
IF a = 5 THEN GOSUB impsd
IF a = 8 THEN GOSUB tf
IF a = 2 THEN GOSUB ti
IF a = 7 THEN GOSUB sa
IF a = 1 THEN GOSUB corvette
COLOR 2
LOCATE 20, (2.8 * 15) - 10
COLOR 2
PRINT geg$
COLOR 7
LINE (0, 300)-(640, 300)
LINE (0, 325)-(640, 325)
evade = 0
IF combat$ = "zufall" THEN GOSUB zufall
IF a = 1 OR a = 5 THEN evade = 12 + speed
IF combat$ = "wheel" THEN evade = 2
routine:
GOSUB loschen
IF combat$ = "defiant" THEN LOCATE 22, 3
IF combat$ <> "corvette" THEN GOTO vu
COLOR 4: PRINT "The Cruiser fires at the Corvette and hits !"
akt = 7: GOSUB roll
qw = rolled: akt = hull: GOSUB roll
IF rolled < qw THEN PRINT "  The G'nabgib is damaged !": hull = hull - 1
IF rolled >= qw THEN COLOR 2: PRINT "  The G'nabgib resists the damage."
GOSUB schleife: GOSUB loschen
vu:
COLOR 7
PRINT "1.Attack enemy ship with laser Cannon"
PRINT "  2.Try to evade"
PRINT "  3.Try to flee"
PRINT "  4.Close in for the kill": COLOR 14
IF combat$ = "defiant" THEN COLOR 4: PRINT "  5.Shoot the power-generators and ram the bridge.": COLOR 14
PRINT "Your distance to enemy ship :"; evade; "km": COLOR 7
PRINT "Your ship's condition :";
IF status$ = "Okay" THEN COLOR 2 ELSE COLOR 4
PRINT status$: COLOR 7

frage:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO attack
IF a$ = "2" THEN GOTO evade
IF a$ = "3" THEN GOTO flee
IF a$ = "4" THEN GOTO closein
IF a$ = "q" THEN END
IF a$ = "5" AND combat$ = "defiant" THEN GOTO rammen
GOTO frage

rammen:
GOSUB loschen
COLOR 4: PRINT "You shoot the shield-generators and fly through the bridge."
PRINT "  Looks cool, really cool.": GOSUB schleife
PRINT "  Unfortunately you are dead now."
GOSUB schleife: RUN "Starwars.bas"

closein:
GOSUB loschen
a = speed - INT(RND * spd + 1): IF a < 0 THEN a = 0
IF evade = 0 THEN PRINT "You are already on the "; geg$; "'s tail.": GOTO hugo
evade = evade - a
IF a = 0 THEN PRINT "The "; geg$; " is to fast for you to close in...": GOTO hugo
IF evade < 0 THEN evade = 0
PRINT "You close in for the kill...."
hugo:
GOSUB schleife
GOTO enemy

attack:
GOSUB loschen: COLOR 7: PRINT "You attack the enemy ship with your cannon and";
diff = evade + spd + piloting
IF ship = -1 THEN akt = skill(44) + 2 ELSE akt = skill(33) + 2
GOSUB roll
IF rolled > diff THEN COLOR 4: PRINT " hit it !!!" ELSE COLOR 2: PRINT " miss!": GOSUB schleife: GOTO enemy
akt = cannon: GOSUB roll
hit = rolled
IF att > 1 THEN uvw = INT(RND * 5) + 1 ELSE uvw = INT(RND * 100) + 1
akt = hull: GOSUB roll
IF rolled > hit AND uvw < 3 THEN COLOR 1: PRINT "   You hit a weapon's emplacement.": att = att - 1: GOSUB schleife: GOTO enemy
IF rolled > hit THEN COLOR 2: PRINT "   The Hull is not damaged.": GOSUB schleife: GOTO enemy
IF hit - 16 > rolled THEN PRINT "   The blast hits hard and the ship is destroyed.": GOTO gewonnen
IF hit - 12 > rolled THEN PRINT "   The enemy ship is severly damaged!": hull = hull - 2: spd = spd - 4: piloting = piloting - 2: GOSUB schleife: GOTO enemy
IF hit - 9 > rolled THEN PRINT "   The enemy ship is heavily damaged!": GOSUB schleife: hull = hull - 1: spd = spd - 2: GOTO enemy
IF hit - 4 > rolled THEN PRINT "   The enemy ship is lightly damaged!": GOSUB schleife: hull = hull - 1: spd = spd - 1: GOTO enemy
PRINT "   The enemy is barly scratched by your blast": GOSUB schleife: hull = hull - 1: GOTO enemy

evade:
GOSUB loschen
IF combat$ = "wheel" THEN PRINT "No way. The Tractor-beam is holding you !": GOSUB schleife: GOSUB loschen: GOTO routine
PRINT "You try to brake from the enemy ship and ";
IF ship = -1 THEN akt = skill(42) + speed ELSE akt = skill(34) + speed
GOSUB roll
evad = rolled
akt = piloting + spd
GOSUB schleife
GOSUB roll
IF rolled > evad THEN COLOR 4: PRINT "fail!": PRINT "    The enemy still sits on your tail!": GOSUB schleife: GOTO enemy
evade = evade + speed / 2
evade = INT(evade)
COLOR 2: PRINT "succeed!": GOSUB schleife: GOTO enemy

flee:
IF combat$ = "wheel" THEN GOTO evade
GOSUB loschen: PRINT "You try to end this combat and ";
GOSUB schleife
diff = (piloting + spd) * 5
diff = diff - evade
IF evade <= 15 THEN diff = diff * 2
IF ship = -1 THEN akt = skill(42) ELSE akt = skill(34)
GOSUB roll
rolled = rolled + speed
IF rolled < diff THEN COLOR 4: PRINT "fail!": GOSUB schleife: GOTO enemy
COLOR 2: PRINT "manage to get away !": GOSUB schleife: GOTO ende

enemy:
IF ship = -2 THEN GOSUB crew
GOSUB loschen
IF att < 0 THEN att = 0
IF hull < 1 THEN hull = 1
IF spd < 1 THEN spd = 1
IF piloting < 2 AND att > 1 THEN piloting = 2
IF combat$ = "wheel" OR combat$ = "corvette" THEN GOTO killer
IF piloting < 1 THEN COLOR 4: PRINT "The enemy pilot is killed due to the impact of your blast !":  GOTO gewonnen
IF hull <= starthull / 2 OR att = 0 THEN GOTO flucht
IF evade > dice * 2 THEN GOTO catchup ELSE GOTO killer

flucht:
COLOR 2: PRINT "The "; geg$; " tries to flee.": GOSUB schleife
akt = dice + spd: GOSUB roll
flee = rolled: flee = flee + (evade / 2)
IF ship = -1 THEN akt = skill(42) ELSE akt = skill(34)
GOSUB roll
IF rolled > flee THEN COLOR 2: PRINT "  You leave him no chance.": GOSUB schleife: GOTO routine
IF rolled + 15 < flee AND evade >= 10 THEN COLOR 4: PRINT "  He ends the combat.": GOSUB schleife: GOSUB saver: RUN "space.bas"
COLOR 4: PRINT "  You have difficulties following him."
evade = evade + INT(spd / 2)
GOSUB schleife: GOTO routine

catchup:
COLOR 2: PRINT "The "; geg$; " tries to catch up with you and ";
akt = dice + spd: GOSUB roll
follow = rolled: GOSUB schleife
IF ship = -1 THEN akt = skill(42) + speed ELSE akt = skill(34) + speed
GOSUB roll
IF rolled > follow THEN COLOR 4: PRINT "looses the duel.": PRINT "   You leave him no chance !": GOSUB schleife: GOTO routine
COLOR 2: PRINT "gets you !"
evade = evade - spd / 2
IF evade < 0 THEN evade = 0
evade = INT(evade)
GOSUB schleife: GOTO routine

killer:
FOR pi = 1 TO att
GOSUB loschen
COLOR 7
PRINT "The "; geg$; " attacks you with a "; waf$; "."
GOSUB schleife
akt = dice
IF ship = -1 THEN diff = evade + speed + skill(42) ELSE diff = evade + speed + skill(34)
GOSUB roll
IF rolled < diff THEN COLOR 2: PRINT "  It misses the "; ship$: GOSUB schleife: GOTO weitrr ELSE COLOR 2: PRINT "   It hits !"
IF ship = -1 THEN akt = skill(45) ELSE akt = skill(35)
GOSUB roll
schild = rolled
akt = scha
GOSUB roll
hit = rolled
IF ship = -1 THEN generated = 2 ELSE generated = 3
IF schild >= hit THEN COLOR 14: PRINT "   You managed to deflect part of the blast with your shields !": akt = generated: GOSUB roll: hit = hit - rolled
REM hull
IF ship = -1 THEN akt = 5 ELSE akt = 7
GOSUB roll
op = 0: COLOR 2
IF status$ = "lightly damaged" THEN rolled = rolled - 5
IF status$ = "heavily damaged" THEN rolled = rolled - 10
IF status$ = "severely damaged" THEN rolled = rolled - 16
IF rolled > hit THEN PRINT "   Your Hull is not damaged.": GOSUB schleife: GOTO weitrr
COLOR 4
RANDOMIZE TIMER: treff = INT(RND * 30) + 1
IF cargo$(treff) = "Detonite-Pack" THEN COLOR 4: PRINT "   Unluckily the shot hits a Detonite-Pack in the cargo-hold !": PRINT "   The Detonite blows your whole ship into pieces...": GOSUB schleife: RUN "starwars.bas"
IF hit - 16 > rolled THEN op = 1: PRINT "   Your ship desintegrates around you.": GOSUB schleife: RUN "starwars.bas"
IF op = 0 AND hit - 12 > rolled THEN op = 1: PRINT "   Your ship is severly damaged!": GOSUB schleife: status$ = "severely damaged": speed = 1: GOTO weitrr
IF op = 0 AND hit - 9 > rolled THEN op = 1: PRINT "   Your ship is heavily damaged!": GOSUB schleife: IF speed > 1 THEN status$ = "heavily damaged": speed = 3: GOTO weitrr
IF op = 0 AND hit - 4 > rolled THEN op = 1: PRINT "   Your ship is lightly damaged!": GOSUB schleife: IF speed > 3 THEN status$ = "lightly damaged": speed = 6: GOTO weitrr
IF op = 0 THEN PRINT "   Your ship is barly scratched by the enemy's blast": GOSUB schleife: IF speed > 6 THEN speed = 7: status$ = "scratched": GOTO weitrr

weitrr:
NEXT pi
GOSUB loschen
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

REM -------warteschleife
schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

REM -------ad bild
loschen:
LINE (0, 326)-(640, 480), 0, BF
LOCATE 23, 3: COLOR 7
RETURN

saver:
combat$ = ""
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

gewonnen:
CIRCLE (300, 150), 15, 14
PAINT (300, 150), 14
CIRCLE (300, 150), 8, 4
PAINT (300, 150), 4
LINE (300, 148)-(380, 80), 4
LINE -(300, 152), 4
LINE -(200, 190), 4
LINE -(300, 148), 4
LINE -(360, 200), 4
LINE -(300, 152), 4
LINE -(240, 90), 4
LINE -(300, 148), 4: COLOR 14
IF piloting < 3 THEN piloting = 3
IF crewfire = 0 THEN xp = xp + piloting * speed * 4
IF crewfire = 0 THEN xp = xp + scha * dice * att
IF cargo$ <> "" THEN GOSUB cargo1
GOSUB schleife
checkship:
RANDOMIZE TIMER: gesehen = INT(RND * 10) + 1
IF planet$ = "Coruscant" OR planet$ = "Calamari" OR planet$ = "Sullust" OR planet$ = "Tattooine" THEN gesehen = 1
IF gesehen > 1 THEN GOTO guttes
COLOR 7: PRINT "Just as you fire your final bolt, you see another ship disappearing into ": PRINT "Hyperspace. Seems someone watched you.": GOSUB schleife
IF INSTR(geg$, "Tie") <> 0 AND mis12 = 0 THEN mis12 = -1: GOTO guttes
IF INSTR(geg$, "Tie") <> 0 AND mis12 = -2 THEN mis12 = -3: GOTO guttes
IF INSTR(geg$, "X") <> 0 AND mis12 = 0 THEN mis12 = -2: GOTO guttes
IF INSTR(geg$, "X") <> 0 AND mis12 = -1 THEN mis12 = -3: GOTO guttes
IF INSTR(geg$, "Y-") <> 0 AND mis12 = 0 THEN mis12 = -2: GOTO guttes
IF INSTR(geg$, "Y-") <> 0 AND mis12 = -1 THEN mis12 = -3: GOTO guttes
guttes:

ende:
CLS
IF combat$ = "corvette" THEN combat$ = "": xp = xp + 2000: COLOR 14: PRINT "As you watch, the corvette brakes into pieces in a ball of fire.": mis5 = -3
IF combat$ = "wheel" THEN combat$ = "": xp = xp + 500: COLOR 14: PRINT "The Galactic wheel is no more...": GOSUB schleife
GOSUB saver
IF xp >= 18000 THEN ep = 1: COLOR 2: PRINT "You have enough xp to raise a stat !"
IF xp >= 1000 AND ep = 0 THEN ep = 1: COLOR 2: PRINT "You have enough xp to raise a skill !"
IF ep = 0 THEN RUN "space.bas"
INPUT "Accept (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN RUN "adv.bas"
RUN "space.bas"

corvette:
PSET (100, 80)
DRAW "d160r90u40r40e20r20f30r60e30r50d30r30"
LINE -(480, 170): DRAW "u22"
LINE -(471, 110)
PSET (100, 80)
DRAW "r90d40r40f20r20e30r60f30r50u30r30"
LINE (100, 80)-(190, 120), , B
LINE (100, 120)-(190, 160), , B
LINE (100, 160)-(190, 200), , B
CIRCLE (210, 160), 15
CIRCLE (210, 160), 8
LINE (205, 162)-(215, 158), , B
LINE (280, 142)-(380, 178), , B
CIRCLE (300, 130), 12
CIRCLE (360, 130), 12
CIRCLE (300, 191), 12
CIRCLE (360, 191), 12
RETURN
impsd:
p = 0
LINE (600, 200 + p)-(50, 250 + p)
LINE (600, 200 + p)-(50, 170 + p)
LINE -(70, 200 + p)
LINE -(50, 250 + p)
LINE (70, 200 + p)-(600, 200 + p)
LINE (50, 170 + p)-(80, 130 + p)
DRAW "r20e2r30d30l10f10r60f2r20f9"
CIRCLE (120, 119 + p), 9
PSET (100, 130 + p)
DRAW "g28r50"
LINE (120, 128 + p)-(120, 119 + p)
LINE (115, 128 + p)-(115, 121 + p)
LINE (125, 128 + p)-(125, 121 + p)
PSET (65, 192 + p)
DRAW "g2d17f2"
PSET (57, 180 + p)
DRAW "g3d43f3"
RETURN
ti:
CIRCLE (300, 150), 30
PSET (300, 135)
DRAW "r5f10d10g10l10h10u10e10r5"
LINE (329, 145)-(370, 150)
LINE (329, 155)-(370, 150)
LINE (370, 120)-(370, 180)
DRAW "g30"
PSET (370, 120): DRAW "h30"
LINE (271, 145)-(230, 150)
LINE (271, 155)-(230, 150)
LINE (230, 120)-(230, 180)
DRAW "f30"
PSET (230, 120): DRAW "e30"
RETURN
tf:
SCREEN 12
CIRCLE (300, 150), 30
PSET (300, 135)
DRAW "r5f10d10g10l10h10u10e10r5"
LINE (329, 145)-(370, 150)
LINE (329, 155)-(370, 150)
LINE (370, 50)-(370, 250)
LINE (271, 145)-(230, 150)
LINE (271, 155)-(230, 150)
LINE (230, 50)-(230, 250)
RETURN
sa:
CIRCLE (300, 150), 30
PSET (300, 135)
DRAW "r5f10d10g10l10h10u10e10r5"
LINE (329, 145)-(370, 150)
LINE (329, 155)-(370, 150)
LINE (380, 140)-(360, 160)
DRAW "g17"
LINE (380, 140)-(340, 100)
LINE (271, 145)-(230, 150)
LINE (271, 155)-(230, 150)
LINE (220, 140)-(240, 160)
DRAW "f17"
LINE (220, 140)-(260, 100)
LINE (335, 146)-(320, 110)
LINE -(280, 110)
LINE -(265, 146)
RETURN

zufall:
iams:
DATA"a peaceful trader","a Bounty Hunter","a Freeloader","a Freelancer"
DATA"none of your business","better than you","sending a prayer to SC"
DATA"cool, really cool","a pimp","a trader","a woman, that is I want to be one"
DATA"blond"
nams:
DATA"Wolf, I solve problems","Sepp","Obi Wan Almdudler","Robert","Snake Plisskin"
DATA"none of your business","Frank","Pewee","Cheyenne","Littmann","Bond, James Bond"
DATA"Diane","Rogue","Karinowits","Airwalker","Zulu","Picard","Worf"
DATA"Troy","Natasha Wildeye","Roland von Wolken, I am a Knight"
DATA"Scooby","Shaggy"
cargo:
DATA"Spice for Cloud-City","Computers for Mos Eisley","Blaster parts"
DATA"Droid parts","Armor parts","Ship parts","Narcotics for Mos Eisley"
DATA"Voyager Video","Holo-movie (XXX-rated)","Wing Commander IV"
DATA"Hydro-Screwdriver","Hydrogen for Mos Eisley","Water for Mos Eisley"
DATA"Ship parts","Weapons for Kari","Narcotics for Cloud City"
DATA"Detonite-Pack","Blaster parts"
RANDOMIZE TIMER
a = INT(RND * 23) + 1
IF a = 1 THEN piloting = piloting + 1: dice = dice + 1
RESTORE nams: blbl = 0
FOR i = 1 TO a: READ gegnam$: NEXT i
RANDOMIZE TIMER
a = INT(RND * 12) + 1: RESTORE iams
IF a = 2 THEN dice = dice + 1: piloting = piloting + 2
FOR i = 1 TO a: READ iam$: NEXT i
IF INSTR(iam$, "prayer") <> 0 AND geg$ <> "X-Wing Fighter" AND geg$ <> "Y-Wing" THEN dice = dice + 4: spd = 20: piloting = 20: hull = 20: att = att + 4
RANDOMIZE TIMER
a = INT(RND * 18) + 1
RESTORE cargo: FOR i = 1 TO a: READ cargo$: NEXT i
IF geg$ = "X-Wing Fighter" THEN gegnam$ = "Red" + STR$(INT(RND * 10) + 1): uu = 1
IF geg$ = "Y-Wing" THEN gegnam$ = "Blue" + STR$(INT(RND * 10) + 1): uu = 1
IF geg$ = "Tie-Fighter" THEN gegnam$ = "Alpha" + STR$(INT(RND * 10) + 1): uu = 1
IF geg$ = "Tie-Interceptor" THEN gegnam$ = "Beta" + STR$(INT(RND * 10) + 1): uu = 1
IF uu = 1 THEN dice = dice + 2: piloting = piloting + 2
IF uu = 1 THEN iam$ = "none of your business": cargo$ = ""
IF uu = 1 AND planet$ = "Calamari" THEN iam$ = "here to protect ZX-7/2"
IF uu = 1 AND planet$ = "Coruscant" THEN iam$ = "patrolling this sector"
IF uu = 1 AND planet$ = "Calamari" AND mis7 = -1 THEN iam$ = "here to protect the refugees from ZX-7"
IF planet$ = "Sullust" THEN iam$ = "here to protect the fleet."

GOSUB loschen
dusau = 0: PRINT "A "; geg$;
IF INSTR(geg$, "Tie") = 0 THEN PRINT " comes out of hyperspace." ELSE PRINT " passes you a few kilometres away."
IF geg$ = "Imperial Star-Destroyer" AND (mis12 = -1 OR mis12 = -3) THEN dusau = -1: GOSUB schleife: GOTO radio
IF INSTR(geg$, "Tie") <> 0 AND (mis12 = -1 OR mis12 = -3) THEN dusau = -1: GOSUB schleife: GOTO radio
IF (INSTR(geg$, "X") <> 0 OR INSTR(geg$, "Y-") <> 0) AND (mis12 = -2 OR mis12 = -3) THEN dusau = -1: GOSUB schleife: GOTO radio
IF geg$ = "Imperial Star-Destroyer" THEN GOSUB schleife: GOTO radio
PRINT "  1.Radio"
PRINT "  2.Attack"
PRINT "  3.Ignore"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO radio
IF a$ = "2" THEN GOSUB loschen: evade = 25: RETURN
IF a$ = "3" THEN GOTO ignore
GOTO zufall
radio:
IF geg$ = "Imperial Star-Destroyer" THEN gegnam$ = "Commander Veers": iam$ = "patrolling this area": cargo$ = "Tie parts": GOSUB veers
GOSUB loschen
COLOR 7: PRINT "Your opponent identifies himself:": uu = 0
jetztaber:
GOSUB loschen
IF dusau = -1 THEN iam$ = "here to find a ruthless killer."
COLOR 2: PRINT "  My name is "; gegnam$; "."
PRINT "    Wanna know why I am here ? I am "; iam$; "."
IF dusau = -1 THEN COLOR 4: PRINT "    And I think that you have shot down several of our fighters. DIE !": GOSUB schleife: GOSUB loschen: evade = 12: RETURN
PRINT "    What do you want ?"
COLOR 7
PRINT "1. 'Your head, you dummy !'"
PRINT "2. 'Nothin' special, sorry to interrupt you...'"
IF blbl = 0 THEN PRINT "3. 'What do you know 'bout these parts of space ?'"
weareso:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB loschen: evade = 25: RETURN
IF a$ = "2" THEN GOSUB saver: RUN "space.bas"
IF a$ = "3" AND blbl = 0 THEN GOSUB loschen: GOTO reden
GOTO weareso

reden:
DATA"Not much. I'm just cruisin'."
DATA"I have no time to waste on you."
DATA"I know better than to talk to every YT-1300 in my way."
DATA"More than you think."
DATA"Sorry, but there's not much time to deliver my cargo !"
DATA"It's dangerous out here."
DATA"This system is dangerous."
DATA"This system is quiet."
DATA"Less than you, I'm afraid."
DATA"I've heard there's something big between the Empire and the Rebellion to come."
DATA"Space, the final frontier,..."
DATA"Last time someone asked me that, I shot his head off."
DATA"Me, nothing know..."
RANDOMIZE TIMER
a = INT(RND * 13) + 1
RESTORE reden: FOR i = 1 TO a
READ a$: NEXT i
IF planet$ = "Calamari" THEN a$ = "These are the Mon Cal-Shipyards."
IF planet$ = "Sullust" THEN a$ = "This is the meeting point of the rebel-fleet."
IF planet$ = "Hoth" AND INSTR(geg$, "Tie") = 0 AND INSTR(geg$, "estroy") = 0 THEN a$ = "You are in great danger ! You are in an Imp-controlled sector !": GOTO aaaa
IF planet$ = "Hoth" AND INSTR(geg$, "Tie") <> 0 THEN a$ = "Leave before I report you to Harkov, Lawsoff of Veers.": GOTO aaaa
IF planet$ = "Hoth" AND INSTR(geg$, "estroy") <> 0 THEN a$ = "Leave before I report your presence...": GOTO aaaa
aaaa:
COLOR 2: PRINT a$
GOSUB schleife
blbl = -1
GOTO jetztaber

ignore:
GOSUB saver: RUN "space.bas"

cargo1:
zz = 0
FOR i = 1 TO 30
IF cargo$(i) = "" THEN cargo$(i) = cargo$: i = 30: zz = 1
NEXT i
IF zz = 1 THEN PRINT "  You scooped something from the debris : "; cargo$
RETURN

veers:
evade = 12
uvw = 0
FOR i = 1 TO 10
IF INSTR(item$(i), "Narcotics") <> 0 THEN uvw = 1
IF item$(i) = "Thermal Detonator" THEN uvw = 1
IF item$(i) = "Detonite-Pack" THEN uvw = 1
NEXT i
FOR i = 1 TO 30
IF INSTR(cargo$(i), "Narcotics") <> 0 THEN uvw = 1
IF cargo$(i) = "Thermal Detonator" THEN uvw = 1
IF cargo$(i) = "Detonite-Pack" THEN uvw = 1
NEXT i
IF uvw = 0 THEN RETURN
GOSUB loschen
COLOR 4: PRINT "This is Commander Veers aboard the ISD Rothman. We have detected"
PRINT "  illegal cargo aboard your vessel. Prepare to be boarded."
COLOR 7
PRINT "  An Assault-Transport is being dispatched from the Rothman."
PRINT "       1.Try to flee"
PRINT "       2.Allow boarding"
veers1:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB loschen: evade = 8 + speed: RETURN routine
IF a$ = "2" THEN GOTO boarding
GOTO veers1

boarding:
CLS : COLOR 7
PRINT "Your vessel is being boarded by heavily armed Stormtroopers, while the"
PRINT "Star-Destroyer has an eye on you. Not much chance for resistance, as it seems."
PRINT "They strip your ship apart and confiscate the following :"
COLOR 2
FOR i = 1 TO 10
IF item$(i) = "Detonite-Pack" OR item$(i) = "Thermal Detonator" OR INSTR(item$(i), "Narcotics") <> 0 THEN PRINT item$(i); ","; : aa$ = item$(i): item$(i) = ""
NEXT i
FOR i = 1 TO 30
IF cargo$(i) = "Detonite-Pack" OR cargo$(i) = "Thermal Detonator" OR INSTR(cargo$(i), "Narcotics") <> 0 THEN PRINT cargo$(i); ","; : aa$ = cargo$(i): cargo$(i) = ""
NEXT i
COLOR 7: PRINT "and that's it."
RANDOMIZE TIMER
pr = INT(RND * cred) + 1000
IF pr > 15000 THEN pr = 15000
IF pr > cred THEN pr = cred
IF pr = 0 THEN GOTO dochnicht
PRINT "In addition to this you are fined "; pr; "credits.": cred = cred - pr
dochnicht:
GOSUB schleife
PRINT "After the Stormtroopers are gone, your comlink cracks:"
IF INSTR(aa$, "Narcotics") <> 0 THEN aa$ = "Narcotic"
COLOR 2: PRINT "This is Commander Veers. Don't ever do that again. "; aa$; "s "; : PRINT "are illegal !"
PRINT "If I get you one more time with illegal cargo, the consequences might include"
PRINT "a more personal punishment."
GOSUB schleife: COLOR 7
GOSUB saver: RUN "space.bas"

crew:
FOR arslan = 1 TO 8
crewfire = 1
GOSUB loschen: COLOR 7: PRINT "Your crew attacks the enemy ship with a Turbo-laser-cannon and";
diff = evade + spd + piloting
akt = 6 + 2
GOSUB roll
IF rolled > diff THEN COLOR 4: PRINT " hits it !!!" ELSE COLOR 2: PRINT " misses!": GOSUB schleife: GOTO coris
akt = 8: GOSUB roll
hit = rolled
IF att > 1 THEN uvw = INT(RND * 5) + 1 ELSE uvw = INT(RND * 100) + 1
akt = hull: GOSUB roll
IF rolled > hit AND uvw < 3 THEN COLOR 1: PRINT "   They hit a weapon's emplacement.": att = att - 1: GOSUB schleife: GOTO coris
IF rolled > hit THEN COLOR 2: PRINT "   The Hull is not damaged.": GOSUB schleife: GOTO coris
IF hit - 16 > rolled THEN PRINT "   The blast hits hard and the ship is destroyed.": GOTO gewonnen
IF hit - 12 > rolled THEN PRINT "   The enemy ship is severly damaged!": hull = hull - 2: spd = spd - 4: piloting = piloting - 2: GOSUB schleife: GOTO coris
IF hit - 9 > rolled THEN PRINT "   The enemy ship is heavily damaged!": GOSUB schleife: hull = hull - 1: spd = spd - 2: GOTO coris
IF hit - 4 > rolled THEN PRINT "   The enemy ship is lightly damaged!": GOSUB schleife: hull = hull - 1: spd = spd - 1: GOTO coris
PRINT "   The enemy is barly scratched by your blast": GOSUB schleife: hull = hull - 1: GOTO coris
coris:
NEXT arslan
crewfire = 0
GOSUB loschen
RETURN

