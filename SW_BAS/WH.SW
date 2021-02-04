REM ---The Wheel ---
SCREEN 12
REM   ---Charakterwerte holen------
DIM Skill$(80), Skill(80), cargo$(30)
OPEN "inter.sw" FOR INPUT AS #1
INPUT #1, name$
INPUT #1, ship$
FOR i = 1 TO 80
INPUT #1, Skill$(i)
INPUT #1, Skill(i)
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
file$ = "wh.sw"
IF combat$ <> "" THEN combat$ = "": GOTO arena
routine:
CLS : COLOR 7
PRINT "You are in the giant docking-bay of the "; : COLOR 4: PRINT "'Galactic Wheel'"; : COLOR 7: PRINT ". The biggest space-"
PRINT "station, you've ever seen."
PRINT "Technical personell is rushing from ship to ship. Corellian Transports, many "
PRINT "Tyderian shuttles, Blast-boats, System-patrol-crafts, and even a Corellian"
PRINT "Gunship is docked here."
PRINT "The Gunship seems to be modified to its limits and is called "; : COLOR 2: PRINT "'The DEATHWING'"; : COLOR 7: PRINT "."
PRINT "This is neutral ground. Not even the Imperial navy has any claim on this"
PRINT "station."
PRINT
COLOR 14: PRINT "1.Board your ship": COLOR 7
PRINT "2.Have your ship repaired"
PRINT "3.Leave the docking bay"
PRINT
PRINT "G.Save Game"
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "Q.Quit Game"
PRINT "V.View Character"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leave
IF a$ = "2" THEN GOTO repair
IF a$ = "3" THEN GOTO leisure
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
GOTO routine

REM ---------Saver Subroutine
saver:
OPEN "inter.sw" FOR OUTPUT AS #1
PRINT #1, name$
PRINT #1, ship$
FOR i = 1 TO 80
PRINT #1, Skill$(i)
PRINT #1, Skill(i)
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
IF a$ <> "s" AND a$ <> "S" AND bs = 0 THEN GOTO routine
IF a$ <> "s" AND a$ <> "S" AND bs = -1 THEN RETURN
FOR S = 1 TO 6
CLS
IF S = 1 THEN an = 1: en = 17
IF S = 2 THEN an = 18: en = 29
IF S = 3 THEN an = 30: en = 47
IF S = 4 THEN an = 48: en = 57
IF S = 5 THEN an = 58: en = 62
IF S = 6 THEN an = 63: en = 80
COLOR 4: PRINT stat$(S); "-related skills:": COLOR 7
FOR i = an TO en
PRINT STR$(i); "."; Skill$(i); ":"; STR$(Skill(i) + lost); "D"
NEXT i
GOSUB schleife
NEXT S
IF bs = -1 THEN bs = 0: RETURN
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
PRINT #1, Skill$(i)
PRINT #1, Skill(i)
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
IF item$(a) = "Deathwing-Keycard" THEN GOTO deathwing
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
akt = Skill(74) + Skill(71)
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB verwundet: DO WHILE INKEY$ = "": LOOP: GOTO routine
COLOR 2: PRINT "The medpac did not help you."
DO WHILE INKEY$ = "": LOOP: GOTO routine

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
Skill(i) = Skill(i) - a
NEXT i
RETURN

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
PRINT b; "."; Skill$(b); "("; Skill(b); "D)"
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
diff = 16: akt = Skill(63): item$(a) = ""
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
akt = Skill(64): GOSUB roll
IF rolled < diff THEN PRINT "Seems it didn't work.": GOSUB schleife: GOTO routine
dam = dam + 1: weap$ = "modified " + weap$
PRINT "Yeah ! That's it!"
GOSUB schleife: GOTO routine

pick:
akt = Skill(14)
GOSUB roll
c = rolled
akt = 5
GOSUB roll
diff = diff + akt: RANDOMIZE TIMER
COLOR 2: b = INT(RND * 50) + 1
IF diff > c THEN PRINT "A guard saw what you tried to do!!!": GOSUB schleife: PRINT "But he doesn't mind..."
IF c >= diff THEN PRINT "You stole"; b; "Credits!"
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

repair:
pr = 8 - speed
pr = pr * 15000
COLOR 2
IF pr = 0 THEN COLOR 4: PRINT "It is not damaged, sir.": GOSUB schleife: GOTO routine
PRINT "That would cost"; pr; "Credits."
IF cred < pr THEN COLOR 4: PRINT "Not enough money !": GOSUB schleife: GOTO routine
INPUT "Pay (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN cred = cred - pr: speed = 8: status$ = "Okay": PRINT "The "; ship$; " is repaired.": GOSUB schleife: GOTO routine
GOTO routine

leave:
CLS : COLOR 7
PRINT "You are catapulted out of the station with a tractor-beam.": COLOR 2
PRINT "'Bye, "; ship$; ". Return to the Galactic Wheel and make"
PRINT "your fortune. We enjoyed your stay ! Have a nice day ....'"
GOSUB saver: GOSUB schleife: RUN "space.sw"

leisure:
CLS : COLOR 7
PRINT "You enter a leisure-center. This IS paradise! Never before have you seen so"
PRINT "many attractions in one place. There is a "; : COLOR 4: PRINT "battle arena"; : COLOR 7: PRINT ", several "; : COLOR 4: PRINT "gamblers"; : COLOR 7: PRINT ","
PRINT "many bars ,cinemas and more."
PRINT "The place is crawling with people. Someone shouts:": COLOR 2
DATA"Come and visit the arena !"
DATA"Come and fight in the arena !"
DATA"Come and see the incredible Clawbacca in the arena !"
DATA"Have dinner at the LITTMANN's !"
DATA"Come and try your luck at the one-handed-bandit !"
DATA"Try your luck at Huttese roulette !"
DATA"Come and see the mighty Clawbacca !"
DATA"Come and challenge the mighty Clawbacca, if you dare !"
DATA"Everything at half price today !"
DATA"Make a fortune at the wheel of fortune !"
DATA"Drinks like hell at the LITTMANN's !"
DATA"Have a go at Huttese roulette !"
RESTORE leisure
RANDOMIZE TIMER
a = INT(RND * 12) + 1
FOR i = 1 TO a: READ a$: NEXT i
PRINT a$: COLOR 14
PRINT
PRINT "1.Leave leisure center": COLOR 7
PRINT "2.Enter the arena"
PRINT "3.Enter a bar"
PRINT "4.Enter a casino"
PRINT "5.Enter a cinema"
PRINT "6.Enter a hotel"
PRINT "7.Enter the first-aid station"
PRINT
PRINT "V.View Character"
PRINT "S.Use Skill"
PRINT "U.Use Item"
PRINT "Q.Quit Game"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO arena
IF a$ = "3" THEN GOTO littmann
IF a$ = "4" THEN GOTO casino
IF a$ = "5" THEN GOTO cinema
IF a$ = "6" THEN GOTO whore
IF a$ = "7" THEN GOTO medic
IF a$ = "s" OR a$ = "S" THEN GOTO leiskill
IF a$ = "u" OR a$ = "U" THEN GOTO leiitem
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "v" OR a$ = "V" THEN bs = -1: GOSUB viewchar: bs = 0
GOTO leisure

arena:
CLS : COLOR 7
PRINT "You are in the "; : COLOR 4: PRINT "BATTLE-ARENA"; : COLOR 7: PRINT ". People are betting on two"
PRINT "contestants in the middle of the arena. Blood is spilled all over the place,"
PRINT "teeth, fur and even a finger or two are covering the floor."
DATA"Clawbacca",6,7
DATA"Naroug",4,5
DATA"ZV-22",5,4
DATA"Amaiza",4,8
DATA"Valance",3,3
DATA"Jax",4,5
IF a1$ <> "" THEN GOTO weiter
gegner:
RESTORE arena
RANDOMIZE TIMER
a = INT(RND * 7) + 1
IF a = 7 THEN a1$ = "Visitor": s1 = INT(RND * 4) + 1: d1 = INT(RND * 7) + 1 ELSE FOR i = 1 TO a: READ a1$, s1, d1: NEXT i
RESTORE arena
RANDOMIZE TIMER
b = INT(RND * 25) + 1
IF b = a THEN GOTO gegner
IF b >= 7 THEN a2$ = "Visitor": s2 = INT(RND * 4) + 1: d1 = INT(RND * 7) + 1 ELSE FOR i = 1 TO b: READ a2$, s2, d2: NEXT i
weiter:
PRINT "This time it's "; : COLOR 4: PRINT a1$; : COLOR 7: PRINT " vs. "; : COLOR 4: PRINT a2$; : COLOR 7: PRINT "."
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Bet on the contestants"
PRINT "3.Show em what a tough fight is"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leisure
IF a$ = "2" THEN GOTO arenabet
IF a$ = "3" THEN GOTO fight
GOTO arena
arenabet:
IF cred = 0 THEN COLOR 4: PRINT "No money left to bet !": GOSUB schleife: GOTO arena
PRINT
COLOR 2: PRINT "'Who daya say will win ?'"; : COLOR 7: PRINT " a man with a red scarf asks you."
PRINT "  1."; a1$: PRINT "  2."; a2$
bet = 0: INPUT "Your bet "; bet
IF bet < 1 OR bet > 2 THEN COLOR 2: PRINT "'Idiot !'"; : COLOR 7: PRINT " The man turns away from you again.": GOSUB schleife: GOTO arena
PRINT " ( You have"; cred; "creds left )"
COLOR 2: INPUT "An how much daya wanna bet "; betted
IF betted <= 0 OR betted > cred THEN PRINT "The man turns away disappointed.": GOSUB schleife: GOTO arena
IF betted > 1000 THEN COLOR 2: PRINT "'Sorry, but 1000 Creds is the Max for this game !'": COLOR 7: GOSUB schleife: GOTO arenabet
CLS
COLOR 2: PRINT "'So let the fight begin !'"
a1:
GOSUB schleife
IF s1 <= 0 THEN GOTO a1lose
COLOR 4: PRINT a1$; ":"; : COLOR 7
akt = d1: GOSUB roll
IF rolled <= 6 THEN PRINT "misses...": GOTO a2
hit = rolled
akt = d2: GOSUB roll
IF rolled >= hit THEN PRINT "hits but "; a2$; " parries !": GOTO a2
akt = s1: GOSUB roll: hit = rolled
akt = s2: GOSUB roll
IF rolled >= hit THEN PRINT "hits but does not injure "; a2$; " !": GOTO a2
IF rolled + 10 <= hit THEN PRINT "hits and injures "; a2$; ".": s2 = s2 - 2: d2 = d2 - 1: GOTO a2
IF rolled + 4 <= hit THEN PRINT "hits and slightly wounds "; a2$; ".": s2 = s2 - 1: d2 = d2 - 1: GOTO a2
IF rolled < hit THEN PRINT "hits and scratches "; a2$; ".": s2 = s2 - 1: GOTO a2
a2:
GOSUB schleife
IF s2 <= 0 THEN GOTO a2lose
COLOR 4: PRINT a2$; ":"; : COLOR 7
akt = d2: GOSUB roll
IF rolled <= 6 THEN PRINT "misses...": GOTO a1
hit = rolled
akt = d1: GOSUB roll
IF rolled >= hit THEN PRINT "hits but "; a1$; " parries !": GOTO a1
akt = s2: GOSUB roll: hit = rolled
akt = s1: GOSUB roll
IF rolled >= hit THEN PRINT "hits but does not injure "; a1$; " !": GOTO a1
IF rolled + 10 <= hit THEN PRINT "hits and injures "; a1$; ".": s1 = s1 - 2: d1 = d1 - 1: GOTO a1
IF rolled + 4 <= hit THEN PRINT "hits and slightly wounds "; a1$; ".": s1 = s1 - 1: d1 = d1 - 1: GOTO a1
IF rolled < hit THEN PRINT "hits and scratches "; a1$; ".": s1 = s1 - 1: GOTO a1
a1lose:
DO WHILE INKEY$ <> "": LOOP
COLOR 4: PRINT a1$; " surrenders.": COLOR 7: a1$ = ""
IF a2$ <> "Visitor" THEN COLOR 2: PRINT "'The winner is the mighty "; a2$; " !'"
IF bet = 2 THEN GOTO arenawin ELSE GOTO arenalose
a2lose:
DO WHILE INKEY$ <> "": LOOP
COLOR 4: PRINT a2$; " surrenders.": COLOR 7
IF a1$ <> "Visitor" THEN COLOR 2: PRINT "'The winner is the mighty "; a1$; " !'"
a1$ = "": IF bet = 1 THEN GOTO arenawin ELSE GOTO arenalose
arenawin:
COLOR 7
cred = cred + betted: PRINT "You won"; betted; "cr."
GOSUB schleife
GOTO arena
arenalose:
COLOR 7
cred = cred - betted: PRINT "You lost"; betted; "cr."
GOSUB schleife
GOTO arena

fight:
COLOR 2: PRINT "'Ah ! A brave young man, that wants to fight in the arena ! What do you"
PRINT "say ? Does he stand a chance against "; a1$; " ? Come on ! A bet on this young"
PRINT "fighter ?'"
COLOR 7: PRINT "  1.Sorry, that was a misunderstanding !"
PRINT "  2.I will crush "; a1$; " !"
hallo:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN COLOR 2: PRINT "'You wimp ! Go away ! Go see your mum !'": GOSUB schleife: GOTO arena
IF a$ = "2" THEN GOTO jajaja
GOTO hallo
jajaja:
COLOR 2: PRINT "'So how are the bets ?": COLOR 7: PRINT ; "The man with the red scarf asks."
PRINT "Another man shouts across the arena:": COLOR 2
bet1 = 0: bet2 = 0
FOR i = 1 TO 200
s2 = stat(5)
RANDOMIZE TIMER
IF s2 = s1 THEN a = INT(RND * 2) + 1
IF s1 > s2 THEN a = 1
IF s1 < s2 THEN a = 2
RANDOMIZE TIMER
b = INT(RND * 15) + 1
IF b = 15 THEN a = INT(RND * 2) + 1
IF a = 1 THEN bet1 = bet1 + 1 ELSE IF a = 2 THEN bet2 = bet2 + 1
NEXT i
PRINT "'It is"; bet1; "to"; bet2;
IF bet1 >= bet2 THEN PRINT "for ";  ELSE PRINT "against ";
PRINT a1$; ".'": COLOR 7
combat$ = a1$
GOSUB schleife: GOSUB saver: RUN "fight.sw"

littmann:
CLS : COLOR 7: PRINT "The "; : COLOR 4: PRINT "LITTMANN's"; : COLOR 7: PRINT " is a fine bar, but it is filled with all"
PRINT "kinds of scum, it is nearly worse than the Brawling Wookie on Tattooine."
PRINT "A thin but tall man with a small mustache is serving food and drinks."
PRINT "At a table at the back of the bar, two guys with Bounty-Hunter-Armor are"
PRINT "sitting in the darkness, discussing something with a frightened looking man."
PRINT "One has "; : COLOR 2: PRINT "Scooby"; : COLOR 7: PRINT " printed on his armor, the other one's is ";
PRINT "labeled: "; : COLOR 2: PRINT "Shaggy"; : COLOR 7: PRINT "."
PRINT
PRINT "Drinks -10 Credits"
PRINT "Food   -50 Credits"
PRINT
uu = 0: oo = 0: FOR i = 1 TO 10
IF INSTR(item$(i), " for ") <> 0 THEN uu = -1
IF item$(i) = "" AND uu = 0 THEN oo = i
NEXT i
IF ship = -1 AND oo > 0 AND uu = 0 AND INT(RND * 3) + 1 = 1 THEN GOSUB geschaeft
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Ask Barkeeper about Scooby and Shaggy"
PRINT "3.Order Drink"
PRINT "4.Order Food"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leisure
IF a$ = "2" THEN GOTO ask
IF a$ = "3" THEN GOTO drink
IF a$ = "4" THEN GOTO food
GOTO littmann

ask:
PRINT "You whisper to the barkeeper:"; : COLOR 2: PRINT "Who are those guys over there ?": COLOR 7
PRINT "The barkeeper washes some whiskey down his throat before he answers:": GOSUB schleife
DATA"These two are the most dangerous men in the universe !"
DATA"Oh my god, don't ask me ! They'll kill me !"
DATA"They are the owners of the Deathwing. You might have seen her in the hangar     decks."
DATA"At the moment they are threatening Senator Baldhead. They want to buy this      station. I don't know where they got their money from."
DATA"They are rumored to have betrayed some big businessman."
DATA"Their ship is invincible, I have heard."
DATA"I bet there is money on their heads."
DATA"Their armors are rumored to be the best of the best. Equipped with secret       weapons and stuff..."
RESTORE ask
RANDOMIZE TIMER
a = INT(RND * 8) + 1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2
PRINT a$: COLOR 7
PRINT "Then he wanders away. It seems he doesn't like questions about them."
GOSUB schleife: GOTO littmann

drink:
IF cred >= 10 THEN cred = cred - 10 ELSE COLOR 4: PRINT "Earn some money before trying to order something !": COLOR 7: GOSUB schleife: GOTO littmann
COLOR 2: PRINT "Yuck. What the hell was that stuff ? Never again !": COLOR 7
PRINT "As you pay for the drink, the thin barkeeper smiles at you:";
COLOR 2: PRINT "'Maybe another one ?'"
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO drink ELSE GOTO littmann

food:
IF cred < 50 THEN PRINT "Not enough money !": GOSUB schleife: GOTO littmann
PRINT "The thin man hands you a Bantha-steak. "; : COLOR 2: PRINT "'Do you want to eat it now, or shall"
PRINT "I put it in a bag for you ?": COLOR 7
cred = cred - 50
PRINT "1.Eat it now"
PRINT "2.Take it away"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO eat
backpack:
CLS : COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it "; a
IF a = 0 THEN CLS : GOTO backpack
IF a < 1 OR a > 10 THEN CLS : GOTO backpack
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE CLS : GOTO backpack
item$(a) = "Bantha Steak"
GOTO littmann
eat:
COLOR 2: PRINT "'Yummy !'": COLOR 7: GOSUB schleife: GOTO littmann

casino:
CLS : COLOR 7
PRINT "You are in "; : COLOR 4: PRINT "THE LUCKY SPIN"; : COLOR 7: PRINT ". The noise from all the gambling"
PRINT "machines is nearly deafening. A giant wheel of fortune is on the far end of the"
PRINT "casino. One-armed bandits are lining the other walls."
PRINT "A sound- and blast-proof room is nearby, in which Huttese roulette is played."
PRINT "People seem to win quite much here."
DATA"<BANG> ... Seems, someone lost at Huttese roulette..."
DATA"Have a go, try the Wheel of fortune"
DATA"Make your fortune with the wheel of fortune !"
DATA"Are you a real man ? Try the Huttese roulette."
DATA"Come closer, ladies and gentleman ! Watch the wheel of fortune."
DATA"This really is too easy. Come closer and win a fortune."
DATA"Win the Jackpot ! 1.000.000 Credits is the Jackpot !"
DATA"Mmmmmmillions can be won at the wheel of fortune !"
DATA"Try our one-armed bandits !"
DATA"Take a lucky spin at the Lucky Spin !"
DATA"Win the Jackpot of 100.000 Cr. at the one-armed bandit !"
DATA"Four Cherries is all you need to get 100.000 at the slot-machine !"
RANDOMIZE TIMER
a = INT(RND * 11) + 1: RESTORE casino: FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Play Huttese Roulette"
PRINT "3.Play on a One-armed bandit"
PRINT "4.Play on the wheel of fortune"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leisure
IF a$ = "2" THEN GOTO huttese
IF a$ = "3" THEN GOTO bandit
IF a$ = "4" THEN GOTO wheel
GOTO casino

huttese:
CLS : COLOR 7
PRINT "You are in a small blast-proof chamber. On a small console in front of you,"
PRINT "six Buttons are blinking. From the console, six wires lead to the center of"
PRINT "the chamber, where an activated "; : COLOR 4: PRINT "Thermal Detonator"; : COLOR 7: PRINT " lies."
PRINT "A female voice comes over the intercom:": COLOR 2
PRINT "One of the buttons will set off the Detonator. Good luck ! And...don't try to"
PRINT "leave without pushing a button first...It will set the Detonator off...": COLOR 14
PRINT
PRINT "1.Leave": COLOR 7
PRINT "2.Push a Button"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO rums
IF a$ = "2" THEN GOTO push
GOTO huttese

push:
RANDOMIZE TIMER
tot = INT(RND * 6) + 1
PRINT "          Push which button ?"
PRINT "                 1"
PRINT "                 2"
PRINT "                 3"
PRINT "                 4"
PRINT "                 5"
PRINT "                 6"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
a = VAL(a$)
IF a < 1 OR a > 6 THEN CLS : GOTO huttese
IF a = tot THEN GOTO rums
CLS : GOSUB schleife
COLOR 2: PRINT "'Whew !'"; : COLOR 7: PRINT " Nothing happened..."
PRINT "The voice gratulates you, then the door shifts open. Outside a woman awaits"
PRINT "you and a few men applaude. The woman gives you 100 Credits in reward for"
PRINT "your bravery.": GOSUB schleife: cred = cred + 100: GOTO casino
rums:
CLS : GOSUB schleife
LOCATE 15, 36: COLOR 4: PRINT "BANG !": GOSUB schleife
LOCATE 15, 15: COLOR 7: PRINT "What's that light at the end of that strange tunnel ???"
GOSUB schleife
RUN "starwars.bas"

bandit:
DATA"Cherry","Apple","Blaster","Pea","Peach","X-Wing","Lose","Lose","Lose","Lose"
CLS
COLOR 4: PRINT "                                  SLOT-MACHINE": COLOR 2
PRINT "______________________________________________________________________________"
PRINT "I                                                                            I"
PRINT "I                                                                            I"
PRINT "I                                                                            I"
PRINT "I                                                                            I"
PRINT "I                                                                            I"
PRINT "I                                                                            I"
PRINT "------------------------------------------------------------------------------"
COLOR 14: PRINT : PRINT "1.Leave": COLOR 7: PRINT "2.Start Slot Machine"
rout:
LOCATE 22, 5: PRINT "                                  "
COLOR 14: LOCATE 22, 5: PRINT cred; "Credits"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO casino
IF a$ = "2" THEN GOTO slot
GOTO rout
slot:
LOCATE 5, 30: PRINT "                         "
IF cred < 15 THEN COLOR 4: LOCATE 5, 30: PRINT "NO CREDITS LEFT !!!": COLOR 7: GOTO rout
cred = cred - 15
LOCATE 22, 5: PRINT "                                  "
COLOR 14: LOCATE 22, 5: PRINT cred; "Credits"
FOR i = 1 TO 70
FOR c = 1 TO 4
RESTORE bandit
RANDOMIZE TIMER
a = INT(RND * 10) + 1
FOR b = 1 TO a: READ slot$(c): NEXT b
LOCATE 6, c * 14: COLOR 4: PRINT slot$(c); "    "
NEXT c
NEXT i
IF slot$(1) <> "Lose" AND slot$(1) = slot$(2) AND slot$(3) = slot$(4) AND slot$(1) = slot$(4) THEN COLOR 14: LOCATE 5, 25: PRINT "JACKPOT !!!!!!": PLAY "cdgdcdgdc": cred = cred + 100000: GOSUB schleife: LOCATE 5, 25: PRINT "                             ": GOTO rout
IF slot$(1) <> "Lose" AND slot$(1) = slot$(2) AND slot$(2) = slot$(3) THEN COLOR 2: LOCATE 5, 30: PRINT "1000 CREDITS !": PLAY "cgcgcg": GOSUB schleife: LOCATE 5, 30: PRINT "                          ": cred = cred + 1000: GOTO rout
IF slot$(3) <> "Lose" AND slot$(3) = slot$(2) AND slot$(3) = slot$(4) THEN COLOR 2: LOCATE 5, 30: PRINT "1000 CREDITS !": PLAY "cgcgcg": GOSUB schleife: cred = cred + 1000: LOCATE 5, 30: PRINT "                                  ": GOTO rout
FOR i = 1 TO 6: a(i) = 0: NEXT i
FOR i = 1 TO 4
IF slot$(i) = "Pea" THEN a(1) = a(1) + 1
IF slot$(i) = "Apple" THEN a(2) = a(2) + 1
IF slot$(i) = "Peach" THEN a(3) = a(3) + 1
IF slot$(i) = "Blaster" THEN a(4) = a(4) + 1
IF slot$(i) = "X-Wing" THEN a(5) = a(5) + 1
IF slot$(i) = "Cherry" THEN a(6) = a(6) + 1
NEXT i: pr = 0
FOR i = 6 TO 1 STEP -1
IF pr <> 0 THEN GOTO wei
IF a(i) = 3 THEN pr = 150: pr = pr * i: GOTO wei
IF a(i) = 2 THEN pr = 20: pr = pr * i
wei:
NEXT i
LOCATE 5, 36: COLOR 14
IF pr = 0 THEN PRINT "YOU LOST !": GOTO rout
PRINT "You won"; pr; "cr !": cred = cred + pr: GOTO rout

wheel:
DATA"WIN 100","LOSE","LOSE","WIN 1000","LOSE","LOSE","LOSE","LOSE","WIN 50000","LOSE"
DATA"WIN 1000","LOSE","WIN 100","LOSE","WIN 100","LOSE","LOSE","WIN 50000","LOSE","LOSE"
DATA"WIN 50000","LOSE","LOSE","LOSE","LOSE","WIN 1000","LOSE","LOSE","LOSE","LOSE"
DATA"WIN 100000","LOSE","WIN 100","LOSE","LOSE","WIN 100","LOSE","WIN 100","LOSE","LOSE"
DATA"WIN 500000","LOSE","LOSE","WIN 1000","LOSE","LOSE","WIN 100","LOSE","WIN 1000","LOSE"
DATA"WIN JACKPOT","LOSE","WIN 100","LOSE","LOSE","WIN 100000","LOSE","LOSE","LOSE","LOSE"
CLS
COLOR 2: PRINT "                               Wheel Of Fortune"
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7: PRINT "2.Turn the wheel"
LOCATE 5, 25: COLOR 14: PRINT cred; "Credits.          "
dreher:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO casino
IF a$ = "2" THEN GOTO gogo
GOTO wheel
gogo:
IF cred < 20 THEN LOCATE 15, 20: COLOR 4: PRINT "YOU DON'T HAVE ENOUGH MONEY !           ": GOTO dreher
cred = cred - 20
LOCATE 5, 25: COLOR 14: PRINT "                              "
LOCATE 5, 25: COLOR 14: PRINT cred; "Credits.          "
RANDOMIZE TIMER: a = INT(RND * 60) + 1
RANDOMIZE TIMER: b = INT(RND * 50) + 71
FOR i = a TO b
RESTORE wheel
FOR c = 1 TO a: READ a$: NEXT c
LOCATE 15, 27: PRINT "                               ": RANDOMIZE TIMER: col = INT(RND * 15) + 1
LOCATE 15, 27: IF INSTR(a$, "WIN") <> 0 THEN COLOR 4 ELSE COLOR col
PRINT a$
noch = b - i: noch = 100 - noch: noch = noch * 300
FOR uu = 1 TO noch: NEXT uu
a = a + 1
IF a = 61 THEN a = 1
NEXT i
IF a$ = "LOSE" THEN GOTO dreher
IF a$ = "WIN 100" THEN cred = cred + 100
IF a$ = "WIN 1000" THEN cred = cred + 1000
IF a$ = "WIN 50000" THEN cred = cred + 50000
IF a$ = "WIN 100000" THEN cred = cred + 100000
IF a$ = "WIN 500000" THEN cred = cred + 500000
IF a$ = "WIN JACKPOT" THEN PLAY "cdcdcdcd": cred = cred + 1000000
GOTO dreher

cinema:
IF cred < 20 THEN COLOR 4: PRINT "You can't afford the ticket ! It's for 20 bucks !": GOSUB schleife: GOTO leisure
COLOR 7: PRINT "A nice girl in a red skirt asks for 20 credits."; : COLOR 2
PRINT "Pay (y/n) ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO leisure
IF a$ = "y" OR a$ = "Y" THEN cred = cred - 20: GOTO film
GOTO cinema:
film:
DATA"The Crow","Star Wars","Return Of the Jedi","The Empire strikes back"
DATA"Platoon","Monty Python's Flying Circussssss","Star Trek"
DATA"Wing Commander-The Film (finally)","Running Wild","54 Monkeys"
DATA"Three Darkelves on the Run"
RESTORE film
RANDOMIZE TIMER
a = INT(RND * 11) + 1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 7: PRINT "The film you watch is called '"; : COLOR 2: PRINT a$; : COLOR 7: PRINT "'.";
FOR i = 1 TO 10
GOSUB schleife
PRINT ".";
NEXT i
PRINT
PRINT "Cool..."
GOSUB schleife: GOTO leisure

whore:
COLOR 7: CLS : floor = 1
PRINT "You are in the lobby of the "; : COLOR 4: PRINT "SPACE-HILTON"; : COLOR 7: PRINT ". A young girl is sitting behind"
PRINT "a counter. She is looking at you expectantly and smiling. She seems to like you."
PRINT "Guests are getting in and out of several elevators which are lining the wall"
PRINT "on your right side. Several suitcases are standing in the hallway."
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Enter Elevator"
PRINT "3.Flirt with the young lady"
PRINT "4.Order a room"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO leisure
IF a$ = "2" THEN GOTO elevator
IF a$ = "3" THEN GOTO flirt
IF a$ = "4" THEN GOTO room

elevator:
CLS
COLOR 7
PRINT "You are in an elevator crammed with people. You are on the "; floor; ". floor."
PRINT
COLOR 14: PRINT "1.Leave Elevator": COLOR 7
PRINT "2.Choose floor"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" AND floor = 1 THEN GOTO whore
IF a$ = "1" AND floor > 1 THEN GOTO floor
IF a$ = "2" THEN GOTO chusflor
GOTO elevator
chusflor:
PRINT "         1.Lobby"
PRINT "         2.2nd Floor"
PRINT "         3.3rd Floor"
PRINT "         4.4th Floor"
PRINT "         5.5th Floor"
naund:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
a = VAL(a$)
IF a < 1 OR a > 5 THEN GOTO naund
floor = a
GOTO elevator

floor:
CLS : COLOR 7: PRINT "You are standing outside the elevator on floor"; floor; "."
PRINT "A long corridor leads to rooms ";
PRINT floor * 10; "-"; floor * 10 + 9; "."
PRINT
PRINT "1.Enter the Elevator"
PRINT "2.Enter a room"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO elevator
IF a$ = "2" THEN GOTO inraum
GOTO floor

inraum:
INPUT "Which room "; a
IF a < floor * 10 OR a > floor * 10 + 9 THEN COLOR 4: PRINT "THIS ROOM IS NOT ON THIS LEVEL !": GOSUB schleife: GOTO floor
IF a = 22 THEN GOTO ownroom
IF a = 51 THEN GOTO president
schwach:
PRINT "You are standing before a small iron door, which will not open to your efforts.": GOSUB schleife: GOTO floor
ownroom:
rk = 0: FOR i = 1 TO 10
IF item$(i) = "Room-key" THEN rk = 1
NEXT i
IF rk = 0 THEN GOTO schwach
CLS : COLOR 7: PRINT "You turn the key in its lock and open the old, heavy iron door."
PRINT "Inside the air is damp, as if the air-condition was not working. Not exactly"
PRINT "a first-class chamber."
PRINT
COLOR 14: PRINT "1.Leave": COLOR 7
PRINT "2.Have a nap"
frfr:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO floor
IF a$ = "2" THEN PRINT "You sleep for approximately two hours before the noise on the street wakes": PRINT "you up. Not exactly refreshed you leave the room.": GOSUB schleife: GOTO floor
GOTO frfr
president:
dl = 0: FOR i = 1 TO 10
IF item$(i) = "Deathwing-Keycard" THEN dl = 1
NEXT i
IF dl = 1 THEN CLS : COLOR 4: PRINT "Nothing more to see or do there.": GOSUB schleife: GOTO floor
CLS : COLOR 7: PRINT "You stand before the "; : COLOR 4: PRINT "President-suite"; : COLOR 7: PRINT ". From the outside"
PRINT "it looks exactly like the other rooms. Wonder what it looks inside ?"
PRINT
PRINT "1.Leave the door alone"
PRINT "2.Try to open it"
ls = 0: FOR i = 1 TO 10
IF item$(i) = "Lightsaber" THEN ls = 1
NEXT i
IF weap$ = "Lightsaber" THEN ls = 1
IF ls = 1 THEN PRINT "3.Hack the door apart with the Lightsaber"
frake:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO floor
IF a$ = "2" THEN PRINT "Oh wonder: It is locked !": GOSUB schleife: GOTO president
IF a$ = "3" AND ls = 1 THEN GOTO hackapart
GOTO frake
hackapart:
CLS
COLOR 4: PRINT "Wish": GOSUB schleife: COLOR 2
PRINT "Zaposch": GOSUB schleife: COLOR 7
PRINT "Hehe. Cool.": GOSUB schleife
PRINT "You are standing in the president suite. It looks very noble to you."
PRINT "Papers over papers are lying on tables, indicating sales and incomes of "
PRINT "Scooby and Shaggy. They seem to be quite rich.... But what's that ?": GOSUB schleife
COLOR 2: PRINT "THE KEYCARD FOR THE DEATHWING !!!!!": COLOR 7
GOSUB schleife
death:
COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it "; a
IF a = 0 THEN CLS : GOTO death
IF a < 1 OR a > 10 THEN CLS : GOTO death
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE CLS : GOTO death
item$(a) = "Deathwing-Keycard": xp = xp + 500
COLOR 7: PRINT "Quickly you take it and leave the room...": GOSUB schleife: GOTO floor

flirt:
COLOR 7: PRINT "You start to talk to her and she seems to be quite open for questions."
PRINT "About what do you want to ask her ?"
INPUT "(key-words are enough) "; a$
IF INSTR(a$, "haggy") <> 0 OR INSTR(a$, "cooby") <> 0 OR INSTR(a$, "COOBY") <> 0 OR INSTR(a$, "HAGGY") <> 0 THEN GOTO scoobinfo
IF INSTR(a$, "aldhead") <> 0 OR INSTR(a$, "ALDHEAD") <> 0 OR INSTR(a$, "heel") <> 0 OR INSTR(a$, "HEEL") <> 0 THEN GOTO wheelinfo
IF INSTR(a$, "unny") <> 0 OR INSTR(a$, "UNNY") <> 0 THEN GOTO funny
COLOR 2: PRINT "'I'm sorry, but I don't know anything about that, but maybe we could talk"
PRINT "about something more ... funny ?'": GOSUB schleife: GOTO whore
funny:
COLOR 2: PRINT "<Yawn>": GOSUB schleife: GOTO whore
scoobinfo:
COLOR 2: PRINT "Scooby and Shaggy started at the Rebel Alliance, but then they got this ship,"
PRINT "Deathwing, it's called, if I'm right, and now they are the worst Megalomaniacs"
PRINT "I've ever seen. They even want to buy the Galactic Wheel, I think. But they"
PRINT "have good taste. They got the president suite at the top-floor of the hotel."
PRINT "It's room number 51, if you would like to reserve it for ... you. I don't"
PRINT "know much more about them."
GOSUB schleife: GOTO whore
wheelinfo:
COLOR 2: PRINT "The Galactic wheel ? Well, it is the biggest leisure-space-staion, that was"
PRINT "ever built. Senator Baldhead is the ... let's say headmaster of the station."
PRINT "He was once in the Imperial Senate, but since the Senate does no more exist,"
PRINT "he was looking for another ... excitement. Lord knows how, but he bought this"
PRINT "station from our former boss Levar Aragn. Since then we are making even more"
PRINT "profit. It was Baldhead who invented the arena."
GOSUB schleife: GOTO whore

room:
COLOR 2: PRINT "Hi. Can I help you ?"; : COLOR 7: PRINT " She smiles at you."
COLOR 2: PRINT "A single-room is for 1500 Credits. Do you want one ?"
rk = 0: FOR i = 1 TO 10
IF item$(i) = "Room-key" THEN rk = 1
NEXT i
IF rk = 1 THEN COLOR 7: PRINT "You deny (you already have a room - #22 on 1st floor, remember ?).": GOSUB schleife: GOTO whore
roomask:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN COLOR 2: PRINT "Well, maybe next time...": GOSUB schleife: GOTO whore
IF a$ = "y" OR a$ = "Y" THEN GOTO keys
GOTO roomask
keys:
IF cred < 1500 THEN COLOR 2: PRINT "Well, maybe next time you should bring some money with you !": GOSUB schleife: GOTO whore
CLS : COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it "; a
IF a = 0 THEN CLS : GOTO keys
IF a < 1 OR a > 10 THEN CLS : GOTO keys
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE CLS : GOTO keys
item$(a) = "Room-key"
cred = cred - 1500
COLOR 2: PRINT "'Here you are. Room 22 on the First Floor.'"; : COLOR 7: PRINT "Smiling she hands"
PRINT "you the keys. Softly her hand touches yours (as if by accident - but you know"
PRINT "better - of course)."
GOSUB schleife: GOTO whore

medic:
COLOR 2: IF lost <= 0 THEN PRINT "But you are not wounded !": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO leisure
pr = lost * 1500: haha = lost
PRINT : PRINT " After examining you, Dr.Crusher demands"; pr; "credits."
IF cred < pr THEN COLOR 4: PRINT " You don't have enough money!": DO WHILE INKEY$ = "": LOOP: GOTO leisure
ahem:
INPUT " Pay this excessive price (y/n)"; a$
IF a$ = "y" OR a$ = "Y" THEN lost = 0: COLOR 2: PRINT " You feel a lot better now. (Your purse feels a lot worse, actually)": DO WHILE INKEY$ = "": LOOP: GOSUB verwundet: cred = cred - pr: GOTO leisure
IF a$ = "n" OR a$ = "N" THEN GOTO leisure
GOTO ahem

leiskill:
bs = -1: GOSUB skills: bs = 0: PRINT "Of no use here."
GOTO leisure
leiitem:
bs = -1: GOSUB items: bs = 0: PRINT "Of no use here."
GOTO leisure

geschaeft:
COLOR 2: PRINT "'Shh, hey fella !'"; : COLOR 7: PRINT " someone whispers."
PRINT "Ignore (y/n) ?"
gess:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "Y" OR a$ = "y" THEN RETURN
IF a$ = "n" OR a$ = "N" THEN COLOR 2 ELSE GOTO gess
PRINT "'I need you for a little cargo run :";
DATA "Spice","Narcotics","Foodstuffs","Robot parts","Hydro-screwdrivers"
DATA"Hydrogen","Holos","Narcotics","Narcotics","Narcotics","Narcotics"
DATA"Ship parts"
tos:
DATA" for Mos Eisley"," for Cloud-City"," for Kari"
RANDOMIZE TIMER
a = INT(RND * 12) + 1
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
PRINT
RETURN

deathwing:
CLS : COLOR 7
PRINT "You enter the Deathwing with your 'findings'. Inside everything is crammed"
PRINT "with machinery, mainly guns and engines."
PRINT "Suddenly a crew-member wanders by you, looks at your Keycard and nods.": COLOR 2
PRINT "Morning, boss. First time I see you without your Armor. This one is new ain't"
PRINT "it ? Well, it doesn't look as fearsome as the other one. Probably the morale"
PRINT "will go up now.": COLOR 7
PRINT "Then he wanders off. Seems there is no problem in getting away with this "
PRINT "baby..."
GOSUB schleife
PRINT "You order the launch of this ship."
GOSUB schleife
PRINT "The machines are powered up and the ship is slowly leaving the hangar, as "
PRINT "suddenly :"; : GOSUB schleife: COLOR 4: PRINT "The station opens fire on you."
COLOR 2: PRINT "<Crack> Stop immediately ! You didn't pay your hangar fee ! <Crack>": COLOR 7
PRINT "The ship shudders as a Tractor-beam grabs hold of it."
IF mis15 < 0 THEN COLOR 14: PRINT "Oh no ! You forgot about Gimpy !": COLOR 7
GOSUB schleife
ship = -2: mis15 = 0
ship$ = "Deathwing": status$ = "Okay"
cannon = 9
FOR i = 1 TO 30
cargo$(i) = ""
IF i = 30 THEN cargo$(i) = "DROP-SHUTTLE"
NEXT i
mis12 = 0: xp = xp + 2000
file$ = "space.sw"
combat$ = "wheel"
cargo$(1) = "Broken Macrobinoculars"
cargo$(2) = "snatched rope"
GOSUB saver
RUN "spaccomb.sw"

