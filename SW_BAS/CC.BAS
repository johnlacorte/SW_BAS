REM ----------------Cloud city:
SCREEN 12
DIM map1(100, 100)
DIM map2(100, 100)
DIM map$(56, 19)
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
CLS : IF lobot = -3 THEN lobot = 0: GOTO lopot
file$ = "cc.bas"
combat$ = ""
SCREEN 12: CLS
map1:
DATA "00000000000000000000000000l0000000000000000000000000000"
DATA "0000000000000000000000000lll000000000000000000000000000"
DATA "00000000000000000000000000l0000000000000000000000000000"
DATA "0000000000000000wwwwwwwwwwbwwwwwwwwwww00000000000000000"
DATA "000000000000wwwwwssssswRRw1wwwwwwwwmmmwwww0000000000000"
DATA "000000000www1111bssssswRRw11111111bmmmw1c1www0000000000"
DATA "00000000wwwwwww1wssssswbwwbwwww1wwwwwwww1ww1Lw000000000"
DATA "00l0000w11111111wwwwwww1waaaw111whhhhhhw1www1ww00000l00"
DATA "0lll11111wwwwww111111111wauaw1w1whhhhhhw111111b1111lll0"
DATA "00l0000w11ww11111wwwwww1wwwww1w1wwwwhwww1wwwwww00000l00"
DATA "00000000w111wwww111111w1111111w11111111w11111w000000000"
DATA "000000000ww111111wwwwwwwww1wwwwwwww1ww111wwww0000000000"
DATA "00000000000wwwww111111hhhw1whhhhh111wwwwwww000000000000"
DATA "000000000000000wwwwwwwhhhw1whhhhhwwwwww0000000000000000"
DATA "0000000000000000000000wwwwbwwwwww0000000000000000000000"
DATA "00000000000000000000000000l0000000000000000000000000000"
DATA "0000000000000000000000000lll000000000000000000000000000"
DATA "00000000000000000000000000l0000000000000000000000000000"
RESTORE map1
FOR i = 1 TO 10
IF item$(i) = "Lobot-controller" THEN lc = -1
NEXT i
FOR i = 1 TO 18
READ a$
FOR a = 1 TO 55
map$(a, i) = MID$(a$, a, 1): c = 15
IF map$(a, i) = "0" THEN c = 9
IF map$(a, i) = "w" THEN c = 7
IF map$(a, i) = "1" THEN c = 15
IF map$(a, i) = "b" AND rancor = 0 THEN c = 4
IF map$(a, i) = "b" AND rancor = -1 THEN map$(a, i) = "1": c = 15
IF map$(a, i) = "u" AND lobot < 0 THEN map$(a, i) = "c": c = 15
IF map$(a, i) = "u" AND lc = -1 THEN map$(a, i) = "c": c = 15
LINE ((a * 8) - 8, (i * 16) - 16)-(a * 8, i * 16), c, BF
COLOR 0: PSET (a * 8 - 6, i * 16 - 10): PSET (a * 8 - 2, i * 16 - 4)
NEXT a
NEXT i: op = 0
GET (0, 0)-(440, 150), map1
GET (0, 151)-(440, 288), map2
opf = 1

map:
IF opf = 0 THEN CLS  ELSE opf = 0
PUT (0, 0), map1, PSET
PUT (0, 151), map2, PSET

REM --------Routine
routine:
ruch = 0: GOSUB unten
RANDOMIZE TIMER: a = INT(RND * 17) + 1
IF op = 1 AND a < 4 AND rancor = 0 THEN GOTO begegnung
IF op = 1 AND a = 17 AND rancor = -1 AND lobot = 0 THEN COLOR 4: rancor = 0: PRINT "This is Lobot speaking ! Security Alert ! Cyborgs activated !": ruch = 1: PRINT "  ";
IF lobot = 0 AND rancor = 0 AND a >= 12 THEN COLOR 4: PRINT "This is Lobot speaking. Cloud city is in a STATE OF WAR !"
op = 0
COLOR 7: LOCATE y, x: PRINT "X"
LOCATE 21, 3
a$ = "": e = 0
IF map$(x, y) = "R" THEN a$ = "You are in a repair-yard. Ugnaughts are working here.": e = 5
IF map$(x, y) = "h" THEN a$ = "This seems to be a public meeting place.": e = 4
IF map$(x, y) = "a" THEN a$ = "You are in the main command center of cloud city."
IF map$(x, y) = "a" AND lobot = -1 THEN PRINT "  Lobot is here, supervising some workers."
IF map$(x, y) = "s" THEN a$ = "A Shop.": e = 2
IF map$(x, y) = "m" THEN a$ = "This seems to be a medical station.": e = 3
IF map$(x, y) = "l" THEN a$ = "You are on a landing platform. Cloud cars are parked here."
IF map$(x, y) = "c" THEN a$ = "You stand before a security-computer terminal"
IF map$(x, y) = "L" AND lobot = 0 THEN combat$ = "lobot": GOSUB saver: COLOR 4: PRINT "Lobot jumps out from behind the corner and attacks.": GOSUB schleife: RUN "fight.bas"
IF x = 3 AND y = 9 THEN a$ = "The " + ship$ + " is waiting here.": e = 1
IF a$ = "" AND lobot = 0 THEN a$ = "The absolute silence is quite disturbing."
IF a$ = "" THEN a$ = "Workers rush past you through the halls."
IF ruch = 1 THEN a$ = ""
COLOR 2: IF a$ <> "" THEN PRINT a$
IF map$(x, y) = "a" AND lobot = 0 AND lc = 0 THEN PRINT "  There are Ugnaughts at the far end of the room.What are they doing here ?"
IF map$(x, y) = "u" THEN COLOR 2: PRINT "  The Ugnaughts attack !!!!": GOSUB schleife: combat$ = "ugnaut": GOSUB saver: RUN "fight.bas"
COLOR 7
IF ruch = 1 THEN ruch = 0: GOSUB schleife: GOTO map1
LOCATE 23, 3
PRINT "  8,6,2,4 to move about"
COLOR 4: IF e > 0 AND e < 4 THEN PRINT "    E";
IF e = 4 THEN PRINT "    T";
IF e = 5 THEN PRINT "    H";
COLOR 7: IF e = 1 THEN PRINT "nter ship"
IF e = 2 THEN PRINT "nter shop"
IF e = 3 THEN PRINT "nter medical center"
IF e = 4 THEN PRINT "alk to native"
IF e = 5 THEN PRINT "ave your ship repaired"
COLOR 4: PRINT "    V"; : COLOR 7: PRINT "iew Character"
COLOR 4: PRINT "    U"; : COLOR 7: PRINT "se an item"
PRINT "    Use a "; : COLOR 4: PRINT "S"; : COLOR 7: PRINT "kill"
PRINT "    Save "; : COLOR 4: PRINT "G"; : COLOR 7: PRINT "ame"
COLOR 1: LOCATE 24, 30: PRINT "    Q"; : COLOR 7: PRINT "uit Game"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "e" AND e > 0 AND e < 4 THEN GOTO enter
IF a$ = "E" AND e > 0 AND e < 4 THEN GOTO enter
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "8" OR a$ = "6" OR a$ = "2" OR a$ = "4" THEN GOTO mover
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "G" OR a$ = "g" THEN GOTO savgam
IF (a$ = "t" OR a$ = "T") AND e = 4 THEN GOTO talk
IF (a$ = "h" OR a$ = "H") AND e = 5 THEN GOTO repair
GOTO routine

repair:
GOSUB unten
IF speed = 8 THEN COLOR 4: PRINT "It is not damaged !!!": GOSUB schleife: GOTO routine
pr = 8 - speed: pr = pr * 8000
PRINT "An Ugnaught stops working:"; : COLOR 2: PRINT "We can repair your ship for"; pr; "creds."
IF pr > cred THEN COLOR 4: PRINT "Not enough money !!!": GOSUB schleife: GOTO routine
COLOR 2: PRINT "  Is this okay for you (y/n) ?"
naund:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN status$ = "Okay": cred = cred - pr: speed = 8: COLOR 2: PRINT "  The repairs will be finished when you return to your ship.": GOSUB schleife: GOTO routine
IF a$ = "n" OR a$ = "N" THEN COLOR 7: PRINT "  The Ugnaught goes back to work.": GOSUB schleife: GOTO routine
GOTO naund

talk:
DATA"Lobot is mad. He is hiding somewhere in Cloud city."
DATA"Lobot is controlled by a few Ugnaughts. If you got the controller..."
DATA"Them ugly Ugnaughts are to blamed for."
DATA"Since Calrissian is gone, everything has gone haywire."
DATA"Lobot has a very seldom gun. In fact just two models exist."
DATA"There is a device that can turn Lobot back to normal again."
DATA"A long time ago, in a galaxy far, far away."
DATA"I saw Darth Vader personally when he met Cloud city."
DATA"I am a refugee from the Alderaan."
DATA"The security doors are blast-proof. But they are controlled by a central CPU."
DATA"Lobot has access to the central CPU."
DATA"For the force's sake, these Imperials are gone...for now."
DATA"The main CPU is in the center of Cloud city."
GOSUB unten
RANDOMIZE TIMER
RESTORE talk
a = INT(RND * 13) + 1
FOR i = 1 TO a: READ a$: NEXT i
IF INSTR(a$, "Lobot") <> 0 AND lobot = -1 THEN a$ = "Thanks for turning Lobot back to normal."
IF INSTR(a$, "Lobot") <> 0 AND lobot = -2 THEN a$ = "That's the guy that killed our administrator Lobot !!!"
COLOR 2: PRINT a$
IF INSTR(a$, "Lobot") <> 0 AND lobot = -2 THEN combat$ = "revenge": GOSUB saver: GOSUB schleife: RUN "fight.bas"
GOSUB schleife: GOSUB unten: GOTO routine

begegnung:
akt = stat(4)
GOSUB roll: IF rolled < 9 THEN GOTO gore
COLOR 2: PRINT "You hear someone or something coming !"
COLOR 7: PRINT "  1.Try to hide and avoid combat"
PRINT "  2.Attack and surprise them"
bloeder:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO hide
IF a$ = "2" THEN combat$ = "surprise": GOSUB saver: RUN "fight.bas"
GOTO bloeder
hide:
akt = skill(53): GOSUB roll
hide = rolled
akt = 3: GOSUB roll
IF rolled > hide THEN COLOR 4: PRINT "  You are spotted !": GOSUB schleife: GOTO gore
COLOR 2: PRINT "  You hid yourself in time...whew that was close.": GOSUB schleife: GOTO routine
gore:
a$ = " Die, Intruder ! "
LINE (220, 220)-(435, 245), 4, BF
COLOR 7
LOCATE 15, 33: PRINT a$
GOSUB saver: GOSUB schleife: RUN "fight.bas"

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
PRINT i; "."; item$(i)
COLOR 7
NEXT i
COLOR 14: PRINT "You have"; xp; "XP left.": COLOR 7
PRINT "Push 's' key to view skill list."
a$ = "": DO WHILE a$ = "": a$ = INKEY$
LOOP
IF a$ <> "s" AND a$ <> "S" THEN CLS : GOTO map

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

CLS : GOTO map

mover:
a = x: b = y
IF a$ = "8" THEN c = x: d = y - 1
IF a$ = "6" THEN c = x + 1: d = y
IF a$ = "2" THEN c = x: d = y + 1
IF a$ = "4" THEN c = x - 1: d = y
IF c < 1 OR c > 55 OR d < 1 OR d > 18 THEN GOTO routine
IF map$(c, d) = "w" THEN COLOR 2: LOCATE 28, 3: PRINT "You bump into a wall.": GOSUB schleife: GOTO routine
IF map$(c, d) = "b" AND rancor = 0 THEN COLOR 4: PRINT "THIS SECURITY-DOOR IS IN YOUR WAY !": GOSUB schleife: GOTO routine
IF map$(c, d) = "0" THEN COLOR 2: LOCATE 28, 3: PRINT "No! You don't want to fall over the edge, do you?": GOSUB schleife: GOTO routine
o = 14: op = 1
LINE (x * 8 - 8, y * 16 - 16)-(x * 8, y * 16), 15, BF
COLOR 0: PSET (x * 8 - 6, y * 16 - 10): PSET (x * 8 - 2, y * 16 - 4)
x = c: y = d: GOTO routine

REM --------ad bild
unten:
LINE (0, 289)-(640, 480), 0, BF
LOCATE 20, 3: COLOR 7
RETURN

REM ---------Save Game
savgam:
GOSUB unten
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

enter:
IF x = 3 AND y = 9 THEN GOSUB saver: GOSUB unten: COLOR 4: PRINT "Slowly you lift off the platform and boost off into the bloodred sky of Bespin.": GOSUB schleife: RUN "space.bas"
IF e = 2 THEN GOTO shop
IF e = 3 THEN GOTO medic

shop:
CLS : COLOR 7
PRINT "You enter a shop."
PRINT "A cyborg-clerk waits to meet your wishes."
PRINT "  You can:": COLOR 14
PRINT "1. Leave ": COLOR 7
PRINT "2. Buy something"
PRINT "3. Sell something"
COLOR 7: INPUT "Your Command"; a
IF a < 1 OR a > 3 THEN GOTO shop
IF a = 1 THEN CLS : GOTO map
IF a = 2 THEN GOTO shopbuy
IF a = 3 THEN GOTO shopsell
shopbuy:
CLS : COLOR 7
PRINT "The Cyborg lists the offers:"; : COLOR 2: PRINT "Yes, sir?"
COLOR 14
PRINT "0. Leave": COLOR 7
PRINT "1. Comlink                   300 Cr."
PRINT "2. Medpac                    600 Cr."
PRINT "3. Datapad                   100 Cr."
PRINT "4. Engineering Kit          1500 Cr."
PRINT "5. Breathing mask            600 Cr."
PRINT "6. Pocket Secretary          150 Cr."
PRINT "7. Holo Communicator         900 Cr."
PRINT "8. Glowrod                   120 Cr."
PRINT "9. Hydro-Screwdriver         560 Cr."
PRINT "10.Droid-Manual             5000 Cr."
PRINT : PRINT "Your purse tells you, that you've got"; : COLOR 4: PRINT cred; : COLOR 7: PRINT "credits left."
INPUT "Your command"; a
IF a = 0 THEN GOTO shop
erk$ = "": IF a < 1 OR a > 10 THEN GOTO shopbuy
COLOR 2
IF a = 1 THEN it$ = "Comlink": pr = 300: erk$ = "This is a medium range communication system."
IF a = 2 THEN it$ = "Medpac": pr = 600: erk$ = "A device to repair yourself."
IF a = 3 THEN it$ = "Datapad": pr = 100: erk$ = "With this Datapad you can communicate with some old droid-models."
IF a = 4 THEN it$ = "Engineering Kit": pr = 1500: erk$ = "This device will ease the difficulty in repairing heavy machinery and vehicles."
IF a = 5 THEN it$ = "Breathing mask": pr = 600: erk$ = "This allow you to breath other than Type I atmospheres."
IF a = 6 THEN it$ = "Pocket Secretary": pr = 150: erk$ = "This is a voice-activated hands-free datapad."
IF a = 7 THEN it$ = "Holo Communicator": pr = 900: erk$ = "With this long-range comm-system you will pick up every call across a planet."
IF a = 8 THEN it$ = "Glowrod": pr = 120: erk$ = "This device provides light and heat for you."
IF a = 9 THEN it$ = "Hydro-Screwdriver": pr = 560: erk$ = "These babies are very helpful in repairing lightly damaged ships."
IF a = 10 THEN it$ = "Droid-Manual": pr = 5000: erk$ = "Use this aboard your ship while you have droid-parts in your cargo to build a protocol-droid."
IF erk$ <> "" THEN PRINT erk$
quest:
COLOR 2: PRINT "'That would be"; pr; "credits, sir.'": COLOR 7
IF cred < pr THEN COLOR 4: PRINT "As you show him your purse, he looks at you and says:"; : COLOR 2: PRINT "'I am sorry, sir, but it is not THAT cheap.'": COLOR 4: PRINT "He turns away from you, talking to another customer.": DO WHILE INKEY$ = "": LOOP: GOTO shopbuy
COLOR 2: INPUT "Is this okay (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO shopbuy
IF a$ = "y" OR a$ = "Y" THEN GOTO backpack
GOTO quest
backpack:
CLS
COLOR 4: PRINT "Your backpack:"
PRINT "--------------"
COLOR 7
FOR i = 1 TO 10: PRINT i; "."; item$(i): NEXT i
PRINT
INPUT "Where do you want to put it (0 to go back)"; a
IF a = 0 THEN GOTO shopbuy
IF a < 1 OR a > 10 THEN GOTO backpack
IF item$(a) <> "" THEN PRINT "Drop the "; item$(a); "(y/n)"; : INPUT a$: IF a$ = "y" OR a$ = "Y" THEN PRINT "Dropped." ELSE GOTO backpack
cred = cred - pr
item$(a) = it$
COLOR 2: PRINT "'Thank you very much. I hope you have fun with it.'"
COLOR 7
DO WHILE INKEY$ = "": LOOP: GOTO shopbuy
shopsell:
CLS
COLOR 7: PRINT "The cyborg eyes you suspiciously,"; : COLOR 2: PRINT "'What is it, that you want to sell ?'"
PRINT "'Normally we don't buy things from our customers.'"
COLOR 7
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT "What do you want to sell (0-go back)"; a
pr = 0
IF a = 0 THEN GOTO shop
IF a < 1 OR a > 10 OR item$(a) = "" THEN GOTO shopsell
IF INSTR(item$(a), "Cloud-City") <> 0 THEN pr = 8000: COLOR 2: PRINT "'Ah, good! You deliver the cargo...t'is 8000 for it.'"
IF INSTR(item$(a), " for ") <> 0 AND pr = 0 THEN COLOR 2: PRINT "Sorry. This is NOT the destiny of your cargo.": GOSUB schleife: GOTO shopsell
IF INSTR(item$(a), "damaged") <> 0 THEN pr = 20: COLOR 2: PRINT "'This thing is damaged !"
IF INSTR(item$(a), "modified") <> 0 THEN pr = 0: COLOR 2: PRINT "'I don't buy weapons.'"
IF item$(a) = "Blaster Rifle" THEN pr = 0: COLOR 2: PRINT "'I don't need weapons.'"
IF item$(a) = "Vibro Axe" THEN pr = 0: COLOR 2: PRINT "'Very interesting, but I don't buy weapons'."
IF item$(a) = "Thermal Detonator" THEN pr = 0: COLOR 2: PRINT "'Sorry, no weapons.'"
IF item$(a) = "Cyborg-controller" THEN pr = 5000: COLOR 2: PRINT "'A very interesting device. I myself am interested in it.'"
IF item$(a) = "Lobot-controller" THEN COLOR 4: pr = 0: PRINT "'THIS IS ILLEGAL !!!! GUARDS, GET HIM !!!!": GOSUB schleife: combat$ = "guards": GOSUB saver: RUN "fight.bas"
COLOR 2: IF pr = 0 THEN PRINT "'I'm sorry, I have no need for this.'": GOSUB schleife: GOTO shopsell
PRINT "'My programming tells me that the regular price for this item is"; pr; "Credits."
IF pr < 8000 THEN pr = pr + INT(RND * (pr / 2)) + 1
INPUT "'How much do you want for it'"; b
IF b = 0 THEN GOTO shopsell
IF b <= 0 THEN b = 0: COLOR 2: PRINT "I take everything, if it's for free."
IF b > pr THEN PRINT "'I'm sorry, but my programming tells me this thing is worth much less."
IF b <= pr THEN item$(a) = "": PRINT "'Thank you very much.'": COLOR 7: PRINT "He takes his purse out and pays you.": cred = cred + b
COLOR 7: DO WHILE INKEY$ = "": LOOP
GOTO shopsell

medic:
GOSUB unten
COLOR 2: PRINT "You enter a medical center."
pr = lost * 1000: COLOR 2
PRINT "     1.Leave"
PRINT "     2.";
IF lost = 0 THEN PRINT "XXXX XXXXXXXX XXXXXX" ELSE PRINT "have yourself healed ("; pr; "cr.)"
PRINT "     3.Take a Medicine lesson (10000 cr.)"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOSUB unten: GOTO routine
IF a$ = "2" AND lost = 0 THEN GOTO medic
IF a$ = "2" THEN GOTO heilung
IF a$ = "3" AND skill(74) = 0 THEN PRINT "   You need to have basic knowledge to be taught !": GOSUB schleife: GOSUB unten: GOTO medic
IF a$ = "3" AND skill(74) > 1 THEN PRINT "   You already know too much to be taught by us !": GOSUB schleife: GOSUB unten: GOTO medic
IF a$ = "3" THEN GOTO teach
heilung:
IF cred < pr THEN COLOR 4: PRINT "Not enough money !": GOSUB schleife: GOSUB unten: GOTO medic
cred = cred - pr
haha = lost
lost = 0
GOSUB verwundet
GOTO medic
teach:
IF cred < 10000 THEN COLOR 4: PRINT "Not enough money !": GOSUB schleife: GOSUB unten: GOTO medic
cred = cred - 10000
skill(74) = 2: COLOR 2: PRINT "You learn more advanced topics about biochemistry and xenobiology"
GOSUB schleife: GOSUB unten: GOTO medic

items:
CLS : COLOR 14
PRINT "Your backpack:"
PRINT "--------------": COLOR 7
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT " Which item "; a
IF a > 10 THEN a = 0
IF a < 1 OR a > 10 OR item$(a) = "" THEN COLOR 2: PRINT "What a sophisticated joke...": DO WHILE INKEY$ = "": LOOP: GOTO map
herrlich:
COLOR 4: PRINT "U"; : COLOR 7: PRINT "se / "; : COLOR 4: PRINT "D"; : COLOR 7: PRINT "rop / "; : COLOR 4: PRINT "R"; : COLOR 7: PRINT "earrange"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "u" OR a$ = "U" THEN GOTO herrlicher
IF a$ = "d" OR a$ = "D" THEN item$(a) = "": GOTO map
IF a$ = "r" OR a$ = "R" THEN GOTO rearrange
GOTO herrlich
rearrange:
INPUT "Change place with (1-10) "; b
IF b < 1 OR b > 10 THEN GOTO rearrange
SWAP item$(a), item$(b)
GOTO map
herrlicher:
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "Lobot-controller" THEN GOTO lopot:
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Detonite-Pack" THEN GOTO deton
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO map
deton:
IF map$(x - 1, y) = "b" OR map$(x + 1, y) = "b" OR map$(x, y - 1) = "b" OR map$(x, y + 1) = "b" THEN COLOR 4 ELSE GOSUB unten: PRINT "Nothing here to demolish...": GOSUB schleife: GOTO map
item$(a) = ""
akt = skill(68): diff = 14
GOSUB roll: GOSUB unten: COLOR 4
IF rolled < diff THEN PRINT "YOU ARE CAUGHT IN YOUR EXPLOSION !": GOTO oje
PRINT "The door seems to be extremly tough. It is still here...": GOSUB schleife: GOSUB unten: GOTO map
oje:
akt = 15: GOSUB roll
GOSUB schleife
oje = rolled
akt = stat(5) + ac
GOSUB roll
IF rolled > oje THEN COLOR 2: PRINT "Luckily you are not hurt...": GOSUB schleife: GOTO map
PRINT "Hopefully someone will find any remain of you to bury...": GOSUB schleife: RUN "starwars.bas"
lopot:
COLOR 7: IF lobot = -1 THEN PRINT "Lobot is already back to normal.": GOSUB schleife: GOTO map
IF lobot = -2 THEN PRINT "There is not much left to control !": GOSUB schleife: GOTO map
IF lobot = 0 THEN lobot = -1: rancor = -1
CLS : PRINT "Suddenly the Intruder Alert is called off."
PRINT "It seems that Lobot is back to normal because shortly afterwards a message"
PRINT "comes over Cloud City's intercom:"; : COLOR 2
PRINT "This is Lobot speaking.": PRINT "I, the cyborg-administrator feel very sorry for what has happened"
PRINT "to me. I have already cancelled the Alert and the responsible Ugnaughts are"
PRINT "dead."
PRINT "The whole city is back to normal now.Please proceed with whatever you had"
PRINT "in mind before the Alert."
PRINT "The cyborgs are deactivated."
xp = xp + 3000
GOSUB schleife: CLS : GOTO map1

changweap:
b = 0
INPUT "Use this as your main weapon (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO map
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
GOTO map
changarm:
b = 0
INPUT "Use this as you main armor (y/n)"; a$
IF a$ = "N" OR a$ = "n" THEN GOTO map
IF a$ = "Y" OR a$ = "y" THEN SWAP ac$, item$(a): b = 1
IF item$(a) = "Nothing" THEN item$(a) = ""
IF b = 0 THEN GOTO changarm
IF INSTR(ac$, "Blast armor") <> 0 THEN ac = 2
IF INSTR(ac$, "Blast vest") <> 0 THEN ac = 1
IF INSTR(ac$, "Battle") <> 0 THEN ac = 4
IF INSTR(ac$, "damaged") <> 0 THEN ac = ac - 1
GOTO map

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
COLOR 4: IF lost <= 0 THEN PRINT "You are not wounded!!!!": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO map
diff = lost * 3
akt = skill(74) + skill(71)
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB verwundet: DO WHILE INKEY$ = "": LOOP: GOTO map
COLOR 2: PRINT "The medpac did not help you."
DO WHILE INKEY$ = "": LOOP: GOTO map

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

skills:
GOSUB unten
PRINT "If you know the number of the desired skill, then just enter it here."
PRINT "If you don't know it, just enter '0' to choose from the list."
INPUT "Your Command"; a
IF a < 0 OR a > 80 THEN GOSUB unten: GOTO skills
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
IF a = 64 THEN GOTO plaster
IF a = 63 THEN GOTO armor
IF a = 67 OR a = 76 THEN GOTO compu
PRINT "Of no use.": GOSUB schleife: GOSUB unten: GOTO map

compu:
IF map$(x, y) <> "c" THEN PRINT "Of no use.": GOSUB schleife: GOSUB unten: GOTO map
akt = skill(a)
IF rancor = 0 THEN diff = 12
IF rancor < 0 THEN GOTO crack
GOSUB roll
IF rolled < diff THEN COLOR 4: PRINT "You didn't manage to override the security system !": GOSUB schleife: GOSUB unten: GOTO map
COLOR 2: PRINT "You cracked the security code !!!": GOSUB schleife
crack:
GOSUB unten: COLOR 2
PRINT "  1.Security Alert"
PRINT "    2.Cancel Security Alert"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN rancor = 0: COLOR 4: PRINT "          INTRUDER-ALERT !!!": GOSUB schleife: GOSUB unten: GOTO map1
IF a$ = "2" THEN rancor = -1: COLOR 2: PRINT "         ALERT CANCELLED !": GOSUB schleife: GOSUB unten: GOTO map1
GOTO crack
armor:
a = 0: FOR i = 1 TO 10
IF item$(i) = "Armor parts" THEN a = i
NEXT i
COLOR 4: IF a = 0 THEN PRINT "No replacement parts !": GOSUB schleife: GOTO map
IF INSTR(ac$, "damaged") = 0 THEN PRINT "Your main armor is not damaged !": GOSUB schleife: GOTO map
diff = 16: akt = skill(63): item$(a) = ""
GOSUB roll
IF rolled < diff THEN PRINT "It is still damaged !": GOSUB schleife: GOTO map
PRINT "You did it !": ac = ac + 1
IF INSTR(ac$, "vest") <> 0 THEN ac$ = "Blast vest"
IF INSTR(ac$, "armor") <> 0 THEN ac$ = "Blast armor"
IF INSTR(ac$, "Battle") <> 0 THEN ac$ = "Battle suit"
GOSUB schleife
GOTO map

plaster:
COLOR 4
a = 0: FOR i = 1 TO 10
IF item$(i) = "Blaster parts" THEN a = i
NEXT i
IF a = 0 THEN PRINT "You have no replacement parts !": GOSUB schleife: GOTO map
parts = a
IF INSTR(1, weap$, "modified") <> 0 THEN PRINT "Your main-weapon is modified to its limits !": GOSUB schleife: GOTO map
IF weap$ = "SC-75" THEN PRINT "You can't modify a firearm !": GOSUB schleife: GOTO map
IF weap$ = "Vibro Axe" THEN PRINT "You can't modify a hand-to-hand-weapon !": GOSUB schleife: GOTO map
IF weap$ = "Lightsaber" THEN PRINT "You can't modify a Lightsaber !": GOSUB schleife: GOTO map
diff = dam * 5: item$(parts) = ""
akt = skill(64): GOSUB roll
IF rolled < diff THEN PRINT "Seems it didn't work.": GOSUB schleife: GOTO map
dam = dam + 1: weap$ = "modified " + weap$
PRINT "Yeah ! That's it!"
GOSUB schleife: GOTO map

