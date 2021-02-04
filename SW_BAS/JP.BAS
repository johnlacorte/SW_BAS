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
file$ = "jp.bas": IF jabba = -4 AND lobot < 0 THEN jabba = -5
routine:
COLOR 7: CLS
PRINT "You are inside "; : COLOR 4: PRINT "Jabba the Hutt"; : COLOR 7: PRINT "'s citadel."
PRINT "The place is crawling with Bounty Hunters and Smugglers. Several Gamorrean"
PRINT "guards armed with Vibro Axes are looking at you fiercly."
PRINT "On the far end of the room, "; : COLOR 4: PRINT "Jabba"; : COLOR 7: PRINT " is lying on his throne."
PRINT "Beside him Bib Fortuna, a Twi'lek, is standing whispering something in his ear."
IF jabba = 0 THEN PRINT "A Twi'lek dancing girl catches your attention. It seems that every single eye inthis room rests on her."
IF jabba < 0 THEN COLOR 4: PRINT "Jabba "; : COLOR 7: PRINT "is looking at you quite amused."
PRINT
COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Talk to Jabba"
PRINT
PRINT "V.View Character"
PRINT "G.Save Game"
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "Q.Quit Game": PRINT
PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB saver: RUN "tatmap.bas"
IF a$ = "2" THEN GOTO talk
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "s" OR a$ = "S" THEN GOTO skill
IF a$ = "u" OR a$ = "U" THEN GOTO item
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
GOTO routine

talk:
IF jabba = -9 THEN GOTO fetttot
IF jabba = -7 THEN GOTO auftrag21
IF jabba = -6 THEN PRINT "Jabba won't listen to you.": GOSUB schleife: GOTO routine
IF jabba = -5 THEN GOTO auftrag2
IF jabba = -3 THEN GOTO ig88tot
IF jabba = 0 THEN PRINT "Jabba's attention is caught by the girl.": GOSUB schleife: GOTO routine
IF jabba = -1 THEN GOTO auftrag ELSE GOTO talk2
fetttot:
CLS : PRINT "Bib Fortuna translates:"; : COLOR 2: jabba = -10
PRINT "The mighty Jabba thanks you for your"
PRINT "efforts to hunt down and kill BOBA FETT. In return he grants you"
PRINT "an improved laser cannon for your ship.": cannon = cannon + 1
PRINT "In addiditon to this, he grants you 20.000 Credits.": cred = cred + 20000
COLOR 7: PRINT "Then he turns to Jabba and waits for his master to speak."
COLOR 2: PRINT "Jabba wants to know what has become of his brother Glibba."
COLOR 7: PRINT
wiebitte:
INPUT "Tell the truth (y/n) "; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO jajaja
IF a$ = "n" OR a$ = "N" THEN GOTO nonono
GOTO wiebitte
nonono:
PRINT "You druck a fine Gschichtl about Glibba's Ableben.": GOSUB schleife
PRINT "After you have finished (approximately 6 hours later...), you are left to"
PRINT "yourself."
GOSUB schleife: GOTO routine
jajaja:
PRINT "As you tell that you personally killed Glibba, Jabba starts to shout and"
PRINT "thrown out."
jabba = -20
PRINT "1.Leave": PRINT "2.Fight"
undund:
INPUT "Your Command "; a
IF a = 1 THEN GOSUB saver: RUN "tatmap.bas"
IF a = 2 THEN file$ = "tatmap.bas": combat$ = "jabfight": GOSUB saver: RUN "fight.bas"
GOTO undund
auftrag21:
CLS : PRINT "Bib Fortuna turns to you and says:"; : COLOR 2
PRINT "The mighty Jabba wants you to find and KILL the Bounty Hunter."
PRINT "Bring his head for extra money. Dismissed !": GOSUB schleife: GOTO routine
auftrag2:
CLS : PRINT "Bib Fortuna translates what Jabba has to say:"; : COLOR 2
PRINT "'The mighty Jabba has a new enemy."
PRINT "His Highness just doesn't know, who this enemy is. One of his smugglers"
PRINT "has been 'delivered' to this palace. Dead of course. The mighty Jabba thinks"
PRINT "that it is his brother, a Huttese as well, of course. But the problem that"
PRINT "needs to be solved, is the Bounty Hunter, that is after Jabba's smugglers."
PRINT "Jabba can't afford to loose more than one cargo of spice."
PRINT "The mighty Jabba wants you to find out who this Bounty Hunter is.": COLOR 7
PRINT "Then he turns around to Jabba again, listens carefully and translates"
PRINT "again:"; : COLOR 2
PRINT "My Master thinks, that you should question the barkeeper in Mos-Eisley's"
COLOR 4: PRINT "BRAWLING WOOKIE"; : COLOR 2: PRINT ". He might know something."
jabba = -6: COLOR 7: GOSUB schleife: GOTO routine
auftrag:
CLS
PRINT "Bib Fortuna translates what Jabba has to say:";
COLOR 2: PRINT "The mighty Jabba wants you to"
PRINT "find an old 'friend' for him. As a reward he would grant you a ship."
PRINT "The ship of the old 'friend' of course."
PRINT "The mighty Jabba says that you have shown great skill against the Rancor."
PRINT "The mighty Jabba says that you will need all your skill to kill him."
PRINT "His name is IG-88, he is an assassination-droid. His ship, the IG-2000"
PRINT "is at Mos Eisley space-port. The mighty Jabba thinks, that IG-88 might"
PRINT "try to leave Tattooine with his thugs. Your mission is to stop him."
PRINT : INPUT "Mighty Jabba asks if you accept (y/n)"; a$
COLOR 7
IF a$ = "y" OR a$ = "Y" THEN jabba = -2: GOTO routine
IF a$ = "n" OR a$ = "N" THEN GOTO neinm:
GOTO auftrag
neinm:
PRINT "Bib Fortuna converses with Jabba, who suddenly looks at you disappointed."
PRINT "Then he translates:"; : COLOR 2: PRINT "The mighty Jabba thought you would be a wimp."
PRINT "He wants me to tell you to blast off!": GOSUB schleife: GOTO routine

ig88tot:
jabba = -4: ship = -1: ship$ = "IG-2000"
COLOR 7: PRINT "As you tell your story, Jabba nods satisfied. Then he hands Bib Fortuna"
PRINT "something, which Bib Fortuna hands you. It is a Code-card. An access-code-card"
PRINT "for the IG-2000. Seems Jabba was clever enough to make sure there is a copy"
PRINT "of IG-88's card in his hands."
PRINT "Now you are owner of the IG-2000. (Who knows how many copies of this card"
PRINT "still exist...)"
hupr:
INPUT "Do you want to change the name of YOUR ship (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO routine
IF a$ = "y" OR a$ = "Y" THEN GOTO rename
GOTO hupr
rename:
COLOR 4: INPUT "What shall it be called from now on"; ship$
PRINT ship$
COLOR 7: INPUT " Are you sure"; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO routine
GOTO rename

talk2:
COLOR 7: PRINT "The mighty Jabba doesn't want to talk right now."
GOSUB schleife: GOTO routine

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
IF item$(a) = "Thermal Detonator" THEN GOTO therm
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Boba Fett's Head" THEN GOTO kopf
IF item$(a) = "Treaty with Boba Fett" THEN GOTO treaty
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO routine
treaty:
PRINT "Jabba looks at the treaty and nods. Bib Fortuna says:": COLOR 2
PRINT "Jabba pays 1000 Creds for this extra 'souvenir'.": COLOR 7
INPUT "Do you accept (y/n) "; a$
IF a$ = "y" OR a$ = "Y" THEN item$(a) = "": cr = cr + 1000: GOTO routine
IF a$ = "n" OR a$ = "N" THEN COLOR 2: PRINT "Sorry, but Jabba wont pay more.": GOSUB schleife: GOTO routine
CLS : GOTO treaty
kopf:
uvw = a: nein = 0
PRINT "Jabba looks at you very amused and gives Fortuna a wink:": COLOR 2
PRINT "Jabba says that this was good work worth an extra bounty.": pr = 10000
verhandlung:
COLOR 2: PRINT "Jabba offers you"; pr; "for Fett's head."
COLOR 7: INPUT "Do you accept (y/n) "; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO accept
IF a$ = "n" OR a$ = "N" THEN GOTO handeln
GOTO verhandlung
accept:
item$(uvw) = ""
cred = cred + pr: COLOR 7: PRINT "Jabba smiles...": GOSUB schleife: GOTO routine
handeln:
nein = nein + 1
akt = skill(48): GOSUB roll
COLOR 2: INPUT "How much more do you want "; more
IF more < 0 THEN more = 0: GOTO accept
IF more > 10000 THEN diff = 20
IF more < 5000 THEN diff = 12
IF more < 2500 THEN diff = 7
IF more < 1500 THEN diff = 5
IF more <= 100 THEN diff = 2
diff = diff + nein
IF rolled > diff THEN pr = pr + more: GOTO verhandlung
IF rolled < diff THEN COLOR 7: PRINT "Jabba laughs at your demand.": nein = nein + 5
IF nein >= 10 THEN GOTO aus ELSE GOTO verhandlung
aus:
COLOR 2: PRINT "Jabba's last offer is"; pr - 5000; ".": pr = pr - 5000
COLOR 7: INPUT "Accept (y/n) "; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO accept
PRINT "So mote it be...": GOSUB schleife: GOTO routine
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
IF jabba < 0 THEN PRINT "You've already caught Jabba's attention.": GOSUB schleife: GOTO routine
CLS : COLOR 2: PRINT "'He has got a Thermal Detonator !'"; : COLOR 7: PRINT " Bounty Hunters raise their Rifles"
PRINT "and the Gamorrean guards approach you with their fearsome blades."
PRINT "This tense situation is cut through by "; : COLOR 4: PRINT "Jabba's"; : COLOR 7: PRINT " laughter."
PRINT "Suddenly Jabba raises a hand to let it drop down on a secret button in his"
PRINT "throne. The dancing girl and a guard are sucked down together with you"
PRINT "as a trapdoor opens under your feet."
GOSUB schleife
PRINT : PRINT "As you stand up, the last you see of the guard is that it vanishes in a huge"
PRINT "mouth. Directly afterwards the girl is eaten by the monster that sits here together with you in this small cave."
GOSUB schleife: combat$ = "rancor": GOSUB saver: RUN "fight.bas"

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
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN GOSUB umbringen
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "jabfight": GOSUB saver: RUN "fight.bas"
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
akt = 3
GOSUB roll
diff = diff + akt: RANDOMIZE TIMER
COLOR 2: b = INT(RND * 500) + 1
IF c >= diff THEN PRINT "You managed to steal in Jabba's palace.": cred = cred + b: PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A Gamorrean guard saw what you tried to do!!!": combat$ = "jabfight": GOSUB saver: GOSUB schleife: RUN "fight.bas"
DO WHILE INKEY$ = "": LOOP
GOTO routine

streetwise:
akt = skill(26)
GOSUB roll
IF rolled < diff THEN PRINT "This is Jabba's palace.Nothin' more an' nothin' less.": GOSUB schleife: GOTO routine
PRINT "Jabba is the most feared and most known notorious gangster throughout the"
PRINT "galaxy."
IF jabba = 0 THEN PRINT "Below his palace the Rancor, a mighty and fearsome monster is said to live."
IF jabba = 0 THEN PRINT "Something with THE PUNCH could impress Jabba."
IF ship = 0 THEN PRINT "Jabba is said to pay good prices on the heads of those who betray him."
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

umbringen:
IF jabba < 0 THEN RETURN
CLS : COLOR 2: PRINT "Do you want to kill the Twi'lek dancing girl ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO jaja
IF a$ = "n" OR a$ = "N" THEN GOTO routine
GOTO umbringen
jaja:
jabba = -20
COLOR 7: PRINT "You kill the girl with your "; weap$; "."
GOSUB schleife
PRINT "Suddenly everyone goes silent, looking from Jabba to you and back to Jabba."
GOSUB schleife
PRINT "Jabba looks at you with an angry flickering in his eyes."
COLOR 4: PRINT "'You little sandrat. You should be killed instantly for this action. That was"
PRINT "my favorite little pet, that you killed here.'"
PRINT "'GUARDS ! THROW THIS PEST OUT OF MY PALACE !'"
PRINT : COLOR 2: PRINT "<You should load a saved game because you can't win the game anymore>"
GOSUB schleife
file$ = "tatmap.bas"
combat$ = "jabfight": GOSUB schleife: GOSUB saver: RUN "fight.bas"

