REM ______________SPACE, THE FINAL FRONTIER
SCREEN 12: DIM a(50), b(50)
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
file$ = "space.bas"
combat$ = ""
routine:
CLS : ups = 0
COLOR 7
IF planet$ = "???" THEN i = INT(RND * 10) + 1: IF i = 1 THEN GOSUB saver: GOTO attack
IF planet$ = "Hoth" AND mis9 = 0 AND imper = 0 THEN i = INT(RND * 10) + 1: IF i = 1 THEN combat$ = "tie": GOSUB saver: COLOR 4: PRINT " YOU ARE ATTACKED BY AN IMPERIAL VESSEL !": RUN "spaccomb.bas"
IF planet$ <> "Dagobah" AND planet$ <> "Calamari" THEN i = INT(RND * 10) + 1: IF i = 1 THEN combat$ = "zufall": GOSUB saver: RUN "spaccomb.bas"
PRINT "You are aboard the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT "."
PRINT "--------------------";
FOR i = 1 TO LEN(ship$): PRINT "-"; : NEXT i: PRINT
PRINT "The ship is in orbit around "; : COLOR 2: PRINT planet$; : COLOR 7: PRINT "."
IF planet$ = "Tattooine" THEN PRINT "From the pilot's cabin you can see the Imperial Stardestroyer 'Defiant'."
IF planet$ = "Hoth" AND mis9 < 0 THEN PRINT "A signal comes in:"; : COLOR 2: PRINT "This is Echo-Base. Welcome, "; name$; ".": COLOR 7
IF planet$ = "Hoth" AND mis9 = 0 THEN PRINT "Coded messages seem to be sent from the planet. Seems to be an imperial code.": GOSUB decode
IF mis5 = -3 THEN mis5 = -4: GOSUB danke
IF mis7 >= 0 AND planet$ = "Calamari" THEN PRINT "From your cabin you can see the heavy Calamari-cruiser 'Hanappy',which is guard-ing a ZX-7 Factory station that looks quite damaged to you."
IF mis7 = -1 AND planet$ = "Calamari" THEN PRINT "From your cabin you can see several damaged transports and  Fighters landing at the 'Hanappy'. ZX-7/2 is no more."
IF planet$ <> "Bespin" AND planet$ <> "Alderaan" AND lobot = 0 AND ship = -1 THEN GOTO lobotomy
IF planet$ = "Sullust" THEN PRINT "Several Calamari Cruisers, dozens of Corvettes and some Nebulon-B-Frigates are": PRINT "in orbit as well. Starfighters are swarming around your ship."
IF planet$ = "Kosma" AND ship = -1 THEN PRINT "Before you a giant wheel spins in space. This is the biggest space-station": PRINT "you've ever seen."
IF planet$ = "Kosma" AND ship = -2 THEN PRINT "Debris of the Galactic wheel are spinning in space before your eyes."
IF planet$ = "Coruscant" THEN PRINT "The ISD 'Invincible' is in orbit around Coruscant. Ties are swarming around": PRINT "your ship in groups of three."
GOTO weiter
lobotomy:
IF planet$ = "???" THEN GOTO weiter
COLOR 4: PRINT "As you just enjoy the view down on "; planet$; ", the Astrogation computer of"
PRINT "IG-88's ship starts to track a course to the Anoat-system. To be precise it "
PRINT "targets Bespin, a Tibanna-gas mining-planet."
PRINT "It seems as if IG-88 had already set the course to this system."
weiter:
IF mis15 = 0 THEN GOTO keingimpy
DATA"doing nothing"
DATA"checking through the ship"
DATA"filing and numbering your weapons"
DATA"writing protocols about the usage of your toilet"
DATA"rearranging and cleaning your ship"
DATA"dusting the Nav-computer"
RESTORE program
a = mis15 * -1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 14: PRINT "At the moment Gimpy is "; a$; ".": COLOR 7
keingimpy:
COLOR 7
PRINT
PRINT "1.Request landing permission"
PRINT "2.Leave orbit"
PRINT "3.Ship's Computer's Analysis"
PRINT "4.Take/Put something from/into cargo"
IF planet$ <> "Dagobah" THEN PRINT "5.Wait for other ships to jump in"
IF planet$ = "Tattooine" THEN PRINT "6.Attack the 'Defiant'"
screw = 0: FOR i = 1 TO 10
IF item$(i) = "Hydro-Screwdriver" THEN screw = 1
NEXT i
FOR i = 1 TO 30
IF cargo$(i) = "Hydro-Screwdriver" THEN screw = 1
NEXT i
IF screw = 1 THEN PRINT : PRINT "R.Repair ship"
PRINT : PRINT "C.Check Ship's systems"
IF mis15 < 0 THEN PRINT "P.Program your droid"
PRINT "V.View Character"
PRINT "U.Use Item"
PRINT "G.Save Game"
PRINT "Q.Quit Game"
frage:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO land
IF a$ = "2" THEN GOTO leave
IF a$ = "3" THEN GOTO anal
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "c" OR a$ = "C" THEN GOTO check
IF a$ = "4" THEN GOTO cargo
IF planet$ <> "Dagobah" AND a$ = "5" THEN GOTO warten
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
IF a$ = "6" AND planet$ = "Tattooine" THEN combat$ = "defiant": GOSUB saver: RUN "spaccomb.bas"
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "r" OR a$ = "R" THEN GOTO repair
IF mis15 < 0 AND (a$ = "p" OR a$ = "P") THEN GOTO program
GOTO frage

program:
PRINT
DATA"doing nothing"
DATA"checking through the ship"
DATA"filing and numbering your weapons"
DATA"writing protocols about the usage of your toilet"
DATA"rearranging and cleaning your ship"
DATA"dusting the Nav-computer"
RESTORE program
a = mis15 * -1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 14: PRINT "At the moment Gimpy is "; a$; ".": COLOR 7
PRINT "Change his orders (y/n) ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO changprog
GOTO routine
changprog:
CLS
PRINT "Possible choices for Gimpy's programming:"
PRINT "-----------------------------------------"
PRINT "1.Check through the ship"
PRINT "2.File and number my weapons"
PRINT "3.Write a protocol about the usage of my toilet"
PRINT "4.Rearrange and clean the ship"
PRINT "5.Dust the Nav-console"
INPUT "What should Gimpy do "; a
IF a < 1 OR a > 5 THEN GOTO changprog
a = a + 1
a = a * -1
mis15 = a
akt = skill(69)
GOSUB roll
IF rolled < 6 THEN COLOR 4: PRINT "Oh no ! You did something wrong !" ELSE COLOR 2: PRINT "Programming accepted..."
GOSUB schleife
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
IF item$(a) = "Droid-Manual" THEN GOTO builddroid
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO routine

builddroid:
IF mis15 < 0 THEN COLOR 2: PRINT "You already have a droid !": GOSUB schleife: GOTO routine
parts = 0: head = 0
FOR i = 1 TO 30
IF cargo$(i) = "Droid parts" THEN parts = i
NEXT i
IF parts = 0 THEN COLOR 2: PRINT "There are no Droid parts in your ship's cargo hold !": COLOR 7: GOSUB schleife: GOTO routine
FOR i = 1 TO 30
IF cargo$(i) = "Cyborg head" THEN head = i
NEXT i
IF head = 0 THEN COLOR 2: PRINT "There is no head for your droid in your ship's cargo hold !": COLOR 7: GOSUB schleife: GOTO routine
cargo$(head) = "": cargo$(parts) = ""
akt = skill(70)
GOSUB roll
IF rolled < 13 THEN COLOR 4: PRINT "Well, this does not look like a droid at all.": PRINT "Maybe you should try again...": COLOR 7: GOSUB schleife: GOTO routine
mis15 = -1
COLOR 14: PRINT "You managed to build a protocol droid !": GOSUB schleife
CLS
COLOR 2: PRINT "'Hello, I am a C3-Unit without a name. I am capable of speaking 9000000 "
PRINT "communication forms. My main programming is about diplomacy and": COLOR 7
PRINT "(...)": GOSUB schleife
INPUT "By what name shallt he be known "; a$
COLOR 2
PRINT "'Thank you, master. But I prefer Gimpy. By the way, did I tell you about"
PRINT "the 9000000 communication forms, that I can speak ? Because": COLOR 7
PRINT "(...)": GOSUB schleife
GOTO routine

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

warten:
CLS
RANDOMIZE TIMER
a = INT(RND * 14) + 1
COLOR a
PRINT "You wait...";
GOSUB schleife
qw:
RANDOMIZE TIMER
a = INT(RND * 14) + 1
COLOR a
PRINT "and wait...";
GOSUB schleife
RANDOMIZE TIMER
a = INT(RND * 10) + 1
IF a = 1 THEN PRINT "then suddenly someone jumps in...": GOSUB schleife: combat$ = "zufall": GOSUB saver: RUN "spaccomb.bas"
GOTO qw

cargo:
CLS
COLOR 2: PRINT "1.Take something from cargo hold"
PRINT "2.Put something into cargo hold"
PRINT "0.Back"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
COLOR 7
IF a$ = "0" THEN GOTO routine
IF a$ = "1" THEN GOTO take
IF a$ = "2" THEN GOTO give
GOTO cargo
take:
CLS
COLOR 2: PRINT "Your cargo holds :": COLOR 7
FOR i = 1 TO 15
LOCATE 2 + i, 3: PRINT i; "."; cargo$(i)
NEXT i
FOR i = 16 TO 30
LOCATE 2 + (i - 15), 40: PRINT i; "."; cargo$(i)
NEXT i
INPUT "Take what "; a
IF a = 0 THEN GOTO cargo
IF a < 1 OR a > 30 THEN GOTO take
IF cargo$(a) = "DROP-SHUTTLE" THEN COLOR 2: PRINT "TAKE a DROP-SHUTTLE and PUT it INTO a BACKPACK ? Are you still sane ???": GOSUB schleife: GOTO cargo
IF cargo$(a) = "" THEN COLOR 2: PRINT "You take a bit of nothing and put it in your backpack.": GOSUB schleife: GOTO cargo
CLS : PRINT "Your backpack :": PRINT "---------------"
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
PRINT "----------------"
INPUT "Put it where "; b
IF b = 0 THEN GOTO take
IF b < 1 OR b > 10 THEN GOTO take
SWAP item$(b), cargo$(a)
GOTO take
give:
COLOR 2
CLS : PRINT "Your backpack :": PRINT "---------------": COLOR 7
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT "Drop what "; b
IF b = 0 THEN GOTO cargo
IF b < 1 OR b > 10 THEN GOTO give
IF item$(b) = "" THEN COLOR 2: PRINT "You put a piece of nothing in the cargo hold.": GOSUB schleife: COLOR 7: GOTO cargo
CLS
COLOR 2: PRINT "Your cargo hold:": COLOR 7
FOR i = 1 TO 15
LOCATE 2 + i, 3: PRINT i; "."; cargo$(i)
NEXT i
FOR i = 16 TO 30
LOCATE 2 + (i - 15), 40: PRINT i; "."; cargo$(i)
NEXT i
INPUT "Put it where "; a
IF a = 0 THEN GOTO cargo
IF a < 1 OR a > 30 THEN GOTO give
IF cargo$(a) = "DROP-SHUTTLE" THEN COLOR 4: PRINT "You can't put anything in your shuttle !": GOSUB schleife: COLOR 7: GOTO give
SWAP item$(b), cargo$(a)
GOTO give

check:
CLS
COLOR 4: PRINT ship$
COLOR 7: IF ship = -1 THEN PRINT "Type: Modified YT-1300 Transport" ELSE PRINT "Type: Modified Corellian Gunship"
IF ship = -1 THEN PRINT "Registration NO#: IMP-IG-2000-563-978-&H34" ELSE PRINT "Registration NO#: IMP-shpyrd-NFS-388-&HFF-[SC]"
IF ship = -1 THEN PRINT "Length: 26.7m" ELSE PRINT "Length: 120m"
PRINT "MaxSpeed: "; STR$(speed); "00kmH sub-light"
PRINT "-------------------------------"
PRINT "Weaponry:": IF ship = -2 THEN GOTO gunship
PRINT "One Laser Cannon ("; cannon; "D )"
PRINT "Hull ( 5 D )": PRINT "Shields ( 2 D )"
gunwtr:
PRINT "Status :"; : IF status$ = "Okay" THEN COLOR 2 ELSE COLOR 4
PRINT status$: COLOR 7
PRINT "_______________________________"
PRINT "Your cargo-hold :"
FOR i = 1 TO 15
LOCATE 13 + i, 3: PRINT i; "."; cargo$(i)
NEXT i
FOR i = 16 TO 30
LOCATE 13 + (i - 15), 40: PRINT i; "."; cargo$(i)
NEXT i
GOSUB schleife
COLOR 7: GOTO routine
gunship:
PRINT "8 Double Turbo-Laser-Cannons ( 8 D )  "
PRINT "1 modified Quad-Laser-Cannon ("; cannon; "D )"
PRINT "Hull ( 7 D )         "; : PRINT "Shields ( 3 D )"
GOTO gunwtr
anal:
DATA"Tattooine is a desert planet. It is inhabitated by all kinds of Humanoids. Sincea few years it stands under Imperial law. It is the core of Jabba the Hutt's    crime-organisation. The largest city is Mos Eisley.Moisture Farmers can be found here."
DATA"Bespin is a Tibanna-gas-mine. Above the gas-giant, a hovering city, CLOUD CITY  is found. The Cyborg-administrator 'Lobot' rules since the former ruler Lando   Calrissian has left."
DATA"This seems to be a system unknown to the Nav-computer. No information available. Suggestion: Boost off !"
DATA"Hoth is not much more than a huge pile of ice. Recently a Rebel base was        destroyed on this planet. Com-Tec reports this planet to be uninhabited now.    Several predatory species are known to be the only life-forms."
DATA"Alderaan once was a beautiful planet. Now there is just an asteroid field  left of it. Rumors say, a giant Imperial Deep-Space-Battle-Station has destroyed the planet."
DATA"Ord Mantell is a Terrestrial Class Planet with a breathable atmosphere. It is   the seat of Glibba the Hutt's crime organization. It is known to be the Bounty  Hunter's paradise."
DATA"Calamari is the homeworld of the Mon Calamari, the major starship-providers for the rebel-alliance. The planet itself is a waterworld with no spaceports but theCalamari have several shipyards and a space-station in orbit."
DATA"Minos IV is the former homeworld of the Tauri, 2.3m high bull-people. The planetwas a beautiful world until the Empire found out about the Tauri working        together with the rebels. The planet has been bombed and poisoned soon afterward"
DATA"Sullust is an extremely unfrequented system in the Outer Rim. One populated     planet is known to exist."
DATA"This planet does not exist on any map. Massive readings of life on the surface. Nothing else can be reported. Legends speak of this planet. The same Legends    report this planet to be cursed and haunted."
DATA"Kosma is a System with just 3 small planets. No life can be found on them. But  there IS something interesting here: The Galactic wheel, a giant leisure-deep-  space-station. It is neutral ground and nearly no law exists here."
DATA"Coruscant is the home-world of the Emperor Palpatine. It is a post-holocaust    world, that forms the center of the known universe. The Empire is strongest hereon this world."
IF planet$ = "???" THEN a = 3
IF planet$ = "Bespin" THEN a = 2
IF planet$ = "Tattooine" THEN a = 1
IF planet$ = "Hoth" THEN a = 4
IF planet$ = "Alderaan" THEN a = 5
IF planet$ = "Ord Mantell" THEN a = 6
IF planet$ = "Calamari" THEN a = 7
IF planet$ = "Minos IV" THEN a = 8
IF planet$ = "Sullust" THEN a = 9
IF planet$ = "Dagobah" THEN a = 10
IF planet$ = "Kosma" THEN a = 11
IF planet$ = "Coruscant" THEN a = 12
RESTORE anal
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
IF a = 2 AND lobot = 0 THEN PRINT "Lately Lobot is reported to have acted quite strangely upon Humans."
IF a = 2 AND lobot = -2 THEN PRINT "Lobot is dead. An Ugnaught leader is the new administrator."
IF a = 4 AND imper = -2 THEN PRINT "Echo-Base is crippled. It can't launch Ties."
IF a = 8 THEN COLOR 4: PRINT "DANGER ! Atmosphere not anymore breathable due to poisoning ! DANGER": COLOR 7
IF a = 9 THEN COLOR 4: PRINT "DANGER ! This is a rebel-aligned system ! DANGER"
IF a = 6 THEN COLOR 4: PRINT "BLASTERS are FORBIDDEN on Ord Mantell !"
COLOR 7
GOSUB schleife: GOTO routine

schleife:
DO WHILE INKEY$ = "": LOOP: RETURN

land:
COLOR 2: PRINT "This is "; name$; " on board the "; ship$; ". "; : PRINT "Request landing permission."
PRINT "<Crack>peat, request la<crack>ng permission."
COLOR 2
COLOR 7: PRINT "(....)": COLOR 2
IF planet$ = "Calamari" AND mis7 = -1 THEN uhuh = 1 ELSE uhuh = 0
IF planet$ = "???" OR planet$ = "Alderaan" OR uhuh = 1 THEN COLOR 4: PRINT "Nothing here to land on.": GOSUB schleife: GOTO routine
IF planet$ = "Tattooine" THEN PRINT "Permission granted, land on landing platform 8, Mos Eisley Spaceport."
IF planet$ = "Bespin" AND lobot = 0 THEN COLOR 7: PRINT "No answer. Your communicator remains silent."
IF planet$ = "Bespin" AND lobot < 0 THEN PRINT "Permission granted to land on CLOUD-CITY, level 1, platform 4"
IF planet$ = "Hoth" AND mis9 < 0 AND imper = 0 THEN PRINT "This is Echo-Base, you are clear to land."
IF planet$ = "Hoth" AND mis9 < 0 AND imper < 0 THEN PRINT "Uh negative ! We have troubles with our hangar ! Sorry.": COLOR 7: PRINT "(Still there is the crater...)"
IF planet$ = "Hoth" AND mis9 = 0 THEN PRINT "This is Imperial-Outpost ZX-2900-861 on Hoth. Request denied. This is a militarybase. Back off !": COLOR 7: PRINT "Sensors detect a crater on the other side of the planet. It could be safe to    land there."
IF planet$ = "Ord Mantell" THEN PRINT "Kari Starport checking your request...Landing Permission granted, proceed to    platform 1."
IF planet$ = "Calamari" THEN PRINT "ZX-7/2 Factory-station here, stand by...our tractor beam is ready now."
IF planet$ = "Minos IV" THEN COLOR 4: PRINT "There's no answer. However your sensors do NOT pick up any readings of electro- magnetic energy on the surface. Massive readings of life though..."
IF planet$ = "Sullust" THEN COLOR 4: PRINT "This is NEB-B FRG 'Hospital I'. Stand by to be escorted to our hangar-deck."
IF planet$ = "Dagobah" THEN COLOR 7: PRINT "There's no answer. Seems there is no intelligent life down there."
IF planet$ = "Kosma" AND ship = -1 THEN PRINT "'Permission granted to land on platform 28. Proceed to platform 28.'"
IF planet$ = "Kosma" AND ship = -2 THEN COLOR 4: PRINT "You can't land on the debris of the station !": GOSUB schleife: GOTO routine
IF planet$ = "Coruscant" THEN COLOR 2: PRINT "'Welcome Commander "; name$; "."; : PRINT "You are cleared to land. Proceed to tractor-range.'"
frage1:
COLOR 7
INPUT "Land (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN GOTO landung
IF a$ = "n" OR a$ = "N" THEN GOTO routine
GOTO frage1
landung:
IF planet$ = "Tattooine" THEN file$ = "me.bas": x = 28: y = 11: time = INT(RND * 2400) + 1: rancor = 120
IF planet$ = "Bespin" THEN file$ = "cc.bas": x = 3: y = 9: IF lobot = 0 THEN rancor = 0 ELSE rancor = -1
IF planet$ = "Hoth" AND mis9 = 0 THEN x = 41: y = 7: file$ = "hothmap.bas"
IF planet$ = "Hoth" AND mis9 < 0 AND imper = 0 THEN rancor = 33: file$ = "eb.bas": x = 11: y = 8
IF planet$ = "Hoth" AND mis9 < 0 AND imper < 0 THEN x = 41: y = 7: file$ = "hothmap.bas"
IF planet$ = "Ord Mantell" THEN x = 33: y = 10: time = INT(RND * 2400) + 1: file$ = "ks.bas"
IF planet$ = "Calamari" THEN file$ = "css.bas"
IF planet$ = "Minos IV" THEN file$ = "minosmap.bas": x = 20: y = 5: time = INT(RND * 2400) + 1
IF planet$ = "Sullust" THEN file$ = "nb.bas"
IF planet$ = "Dagobah" THEN x = 40: y = 9: file$ = "dagmap.bas"
IF planet$ = "Kosma" THEN file$ = "wh.bas"
IF planet$ = "Coruscant" THEN file$ = "iv.bas": COLOR 4: PRINT "Ties escort you to the hangar.": IF ship = -1 THEN GOSUB schleife
IF ship = -2 THEN COLOR 7: PRINT "You land in your DROP-SHUTTLE.": GOSUB schleife
GOSUB saver
RUN file$

leave:
CLS : COLOR 14
IF ups = 0 THEN PRINT "0.Stay here": COLOR 7
PRINT " 1 .Tattooine"
PRINT " 2 .Bespin": dagobah = 20
PRINT " 3 .Hoth": calamari = 20: ord = 20: sullust = 20: minos = 20
PRINT " 4 .Alderaan": coruscant = 20: endor = 20
PRINT " 5 .Kosma": o = 5
IF schau <= -4 THEN o = o + 1: calamari = o: PRINT o; ".Calamari"
IF jabba <= -7 THEN o = o + 1: ord = o: PRINT o; ".Ord Mantell"
IF mis3 < 0 THEN o = o + 1: sullust = o: PRINT o; ".Sullust"
IF mis8 < 0 THEN o = o + 1: minos = o: PRINT o; ".Minos IV"
IF mis9 < 0 THEN o = o + 1: coruscant = o: PRINT o; ".Coruscant"
IF mis13 < 0 THEN o = o + 1: dagobah = o: PRINT o; ".Dagobah"
IF mis10 = -3 OR mis9 = -3 OR mis16 = -1 THEN o = o + 1: endor = o: PRINT o; ".Endor"
PRINT
INPUT "Set Astrogation console to ..."; a
IF a < 0 OR a > o THEN GOTO leave
IF ups = 0 AND a = 0 THEN GOTO routine
IF a = 1 AND planet$ <> "Tattooine" THEN planet$ = "Tattooine": GOTO fliegen
IF a = 2 AND planet$ <> "Bespin" THEN planet$ = "Bespin": GOTO fliegen
IF a = 3 AND planet$ <> "Hoth" THEN planet$ = "Hoth": GOTO fliegen
IF a = 4 AND planet$ <> "Alderaan" THEN planet$ = "Alderaan": GOTO fliegen
IF a = 5 AND planet$ <> "Kosma" THEN planet$ = "Kosma": GOTO fliegen
IF a = calamari AND schau <= -4 AND planet$ <> "Calamari" THEN planet$ = "Calamari": GOTO fliegen
IF a = ord AND jabba <= -7 AND planet$ <> "Ord Mantell" THEN planet$ = "Ord Mantell": GOTO fliegen
IF a = sullust AND mis3 < 0 AND planet$ <> "Sullust" THEN planet$ = "Sullust": GOTO fliegen
IF a = minos AND mis8 < 0 AND planet$ <> "Minos IV" THEN planet$ = "Minos IV": GOTO fliegen
IF a = coruscant AND mis9 < 0 AND planet$ <> "Coruscant" THEN planet$ = "Coruscant": GOTO fliegen
IF a = dagobah AND mis13 < 0 AND planet$ <> "Dagobah" THEN planet$ = "Dagobah": GOTO fliegen
IF a = endor THEN planet$ = "Endor": GOTO fliegen
GOTO leave
fliegen:
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
diff = 11
IF status$ = "lightly damaged" THEN diff = diff + 1
IF status$ = "heavily damaged" THEN diff = diff + 3
IF status$ = "severely damaged" THEN diff = diff + 5
akt = skill(31): GOSUB roll
nanu = 0: IF (mis9 < 0 OR mis10 = -2) AND mis13 = 0 THEN mis13 = -1: nanu = -1: planet$ = "Dagobah": rolled = diff + 1
IF rolled < diff THEN planet$ = "???": LOCATE 14, 12: PRINT "You come out of hyperspace and don't know where you are."
IF planet$ = "Tattooine" THEN CIRCLE (690, -20), 240, 14: PAINT (639, 0), 14
IF planet$ = "Bespin" THEN CIRCLE (640, 0), 280, 4: PAINT (639, 0), 4
IF planet$ = "Hoth" THEN CIRCLE (380, -80), 400, 15: PAINT (180, 10), 15
IF planet$ = "Alderaan" THEN LOCATE 14, 12: PRINT "Where to hell is Alderaan? You are in an Asteroid field.": GOSUB schleife: GOTO asteroid
IF planet$ = "Ord Mantell" THEN CIRCLE (200, 140), 200, 2: PAINT (200, 140), 2
IF planet$ = "Calamari" THEN CIRCLE (320, 520), 240, 1: PAINT (320, 470), 1: GOTO attacke
IF planet$ = "Minos IV" THEN CIRCLE (530, 20), 190, 6: PAINT (530, 20), 6
IF planet$ = "Sullust" THEN CIRCLE (10, 40), 120, 3: PAINT (10, 40), 3
IF planet$ = "Dagobah" THEN CIRCLE (90, 500), 80, 2: PAINT (90, 470), 2
IF planet$ = "Kosma" THEN CIRCLE (80, 200), 60, 8: PAINT (80, 200), 8
IF planet$ = "Coruscant" AND mis9 = -1 THEN GOSUB saver: RUN "cofl.bas"
IF planet$ = "Coruscant" AND mis9 < -1 THEN CIRCLE (620, 0), (87 * 2), 4: PAINT (620, 1), 4
IF planet$ = "Endor" THEN GOTO endor
IF nanu = -1 THEN LOCATE 14, 8: PRINT "A catastrophic mishap ! You nearly flew through that planet.": LOCATE 15, 20: PRINT "     Where the hell are you ?"
GOSUB schleife
IF planet$ = "Sullust" AND mis10 = 0 THEN GOTO sullust
GOTO routine
asteroid:
IF ship = -1 THEN akt = skill(42): diff = 17 ELSE akt = skill(34): diff = 23
GOSUB roll
IF rolled < diff THEN COLOR 4: LOCATE 15, 22: PRINT "Your ship is damaged by meteorites." ELSE COLOR 2: LOCATE 15, 27: PRINT "You managed to evade.": GOSUB schleife: GOTO routine
IF status$ = "heavily damaged" THEN status$ = "severely damaged": speed = 1
IF status$ = "lightly damaged" THEN status$ = "heavily damaged": speed = 3
IF status$ = "scratched" THEN status$ = "lightly damaged": speed = 6
IF status$ = "Okay" THEN status$ = "scratched": speed = 7
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

attack:
COLOR 4: LOCATE 10, 17: PRINT "You are being attacked by another vessel !!!!": GOSUB schleife
RUN "spaccomb.bas"

decode:
diff = 20
akt = skill(36): GOSUB roll
IF mis15 < 0 THEN rolled = 22: COLOR 14: PRINT "Gimpy translates for you :": COLOR 2
IF rolled < diff THEN COLOR 4: PRINT "You are not able to unscramble the message": RETURN
DATA"From: Plt.Gov. Lawsoff; To: Sect.Comm. Harkov;To better potect our citizens and member worlds, the Emperor has superseded and suspended the Imperial Senate for the duration of the battle against the rebellion. We are sure you shall do everything in your power to assist us."
DATA"Murtan, Now that the Rebels fled Hoth, we think that you should dismantle the Hoth/2 Operation. There are strong indications of hostile lifeforms north of ECHO-Base. We need more men if we are to stay here."
DATA"From: Lawsoff; To: Sect.Comm. Harkov; We need a full complement of scout-walkers. Some have been damaged and abandoned in the ice-wastes. The hostile lifeforms, we reported earlier are attacking frequently."
DATA"From: Lawsoff; To: His Majesty The Emperor; Your Majesty may have recognized our need for new scout-walkers. I hope, you have heard of our needs through Admiral Harkov."
DATA"From: Harkov; To:Lawsoff; If you are not able to patrol this planet with two full squadrons of blizzard-force Stormtroopers, maybe I should inform Darth Vader that you don't appreciate his Elite-corps !"
DATA"From: Lt.Haywire; To: Sect.Command; Subject: Scout-Report; Found nothing interesting, lost 1 Trooper due to Wampa-attack"
DATA"To Tie Patrol Group Delta: Landing Permission granted !"
DATA"To Tie Patrol Group Alpha: Landing Permission Granted !"
DATA"To Tie Patrol Group Omega: Launch NOW !"
DATA"To Tie Patrol Group Echo: Did you find anything ?"
DATA"To Tie-Interceptor Group Beta: Assist Tie Omega !"
DATA"From: Lawsoff; To: Harkov; We think the Wampa's may be attacking from a point north of our base. Request Walkers so we are able to find and destroy them."
DATA"From: Lawsoff; To: Harkov; When will Commander Veers patrol this area again ?"
RANDOMIZE TIMER
RESTORE decode
a = INT(RND * 13) + 1
FOR i = 1 TO a: READ a$: NEXT i
IF mis15 = 0 THEN COLOR 7: PRINT "You unscrambled the message :": COLOR 2
IF INSTR(a$, "Tie") <> 0 AND imper < 0 THEN a$ = "To: Harkov; From: Echo-Base; Our base has been sabotaged. We can no longer start Ties from our platforms."
PRINT a$: COLOR 7: RETURN

attacke:
GOSUB schleife
IF mis5 < 0 THEN GOTO routine
mis5 = -1
CLS
COLOR 7
PRINT "As you come out of Hyperspace, your ship is shocked with blasts. But not you"
PRINT "are attacked ! An"; : COLOR 4: PRINT " Imperial corvette "; : COLOR 7: PRINT "attacks a Factory-station."
PRINT "The stations Defences have dropped and only two Turbolasers are still firing."
PRINT "The Corvette is launching Proton-torpedoes towards the station."
COLOR 2: PRINT "<Crack>yday, mayday, this is Mon Calamari Factory-station ZX-7/2. We <crack>"
PRINT "are under attack <Crack> by an imperial assault corvette ! <Crack> Mayday !"
PRINT "<CrackCrackCrack...>": COLOR 7
PRINT "Then the line is dead as a warhead hits the stations comm-system."
COLOR 2: PRINT "This is Imperial Assault Corvette G'nabgib to all rebel scum. Prepare to die"
PRINT "for the greater glory of the Empire.": COLOR 7
PRINT : PRINT "You are completely ignored for the moment."
PRINT "Do you want to 1.interfere and attack the corvette"
PRINT "               2.wait"
PRINT "               3.jump out of this system as fast as possible."
naund:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN combat$ = "corvette": GOSUB saver: RUN "spaccomb.bas"
IF a$ = "2" THEN GOTO waiten
IF a$ = "3" THEN ups = -1: GOTO leave
GOTO naund
waiten:
COLOR 4: PRINT "Just before the corvette is able to destroy the station a heavy rebel-cruiser"
PRINT "comes out of Hyperspace very close to the station.": COLOR 7
PRINT "That was a very risky maneuver. Wonder who that i..": COLOR 2
PRINT "'This is Admiral Ackbar aboard the Cruiser 'Hananppy'. Surrender or die, "
PRINT "G'nabgib ! Repeat, surrender or die !'": COLOR 7
PRINT "Then the cruiser opens fire (without waiting for an answer)."
PRINT "The corvette turns into the enemy fire and is hit by several Turbolasers."
PRINT "Shortly afterwards it is destroyed by several rockets launched from the cruiser."
mis5 = -2: GOSUB schleife: GOTO routine

danke:
COLOR 2
PRINT "'This is Admiral Ackbar, fleet commander, rebel alliance. We thank you for your"
PRINT "efforts. Without you, we may have been in great peril. Please identify yourself"
PRINT "so we may know who saved the lives of many innocent workers.'"
COLOR 7: PRINT "Identify yourself (y/n) ?"
id:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "y" OR a$ = "Y" THEN mis5 = -5: GOTO wtr
IF a$ = "n" OR a$ = "N" THEN GOTO wtr
GOTO id
wtr:
COLOR 2
IF mis5 = -5 THEN PRINT "Well, thank you, "; name$; ". We will remember you."
IF mis5 = -4 THEN PRINT "Well, I'm sorry for your distrust, but right now I can't do anything about it."
COLOR 7
PRINT "After the comm falls silent, the Cruiser takes a position near the station"
PRINT "and launches several shuttles and transports toward it."
RETURN

sullust:
CLS
mis10 = -1
COLOR 7
PRINT "You are confronted with an impressive sight: Thousands of Starships, including"
PRINT "many heavy, medium and light Calamari-cruisers, dozens of Corvettes and"
PRINT "Frigattes are hanging in orbit around the planet. Z-95s, X-Wings, Y-Wings and"
PRINT "B-Wings are swarming around the capital ships."
GOSUB schleife
PRINT "Suddenly your ship is shocked with laser blasts.": COLOR 2
PRINT "'Intruder Alert ! Red 1 to YT-1300: Immediately drop your shields and disable"
PRINT "your weapons ! Repeat: Disable yourself or be destroyed. Do not try to radio "
PRINT "for help !"
COLOR 7
PRINT "1.Try to radio for help"
PRINT "2.Drop shields and weapon's systems"
PRINT "3.Attack"
tja:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO radio1
IF a$ = "2" THEN GOTO brav
IF a$ = "3" THEN GOTO tataa
GOTO tja
radio1:
COLOR 2: PRINT "'This is "; name$; " requesting help. Mayday. I'm attacked by "
PRINT "X-Wings in the S......'": COLOR 7
PRINT "Suddenly your radio is jammed. Shortly afterwards four X-Wings start to attack."
GOSUB schleife: GOTO tataa
tataa:
PRINT "Before you manage to evade, several Starfighters start Torpedo-runs on you,"
PRINT "while several others are preventing your escape."
COLOR 4: PRINT "Guess there just were too many of them at once...": GOSUB schleife
RUN "starwars.bas"
brav:
COLOR 2
PRINT "Good. Now identify yourself.": COLOR 7
PRINT "Identify yourself (y/n) ?"
idid:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO schluss
IF a$ = "y" OR a$ = "Y" THEN GOTO naturlich
GOTO idid
naturlich:
IF mis8 = -3 THEN GOTO recomm
IF mis5 = -5 THEN GOTO vorbrav
COLOR 2: PRINT "Thank you, "; name$; "."
GOTO schluss
recomm:
COLOR 2: PRINT "Ahem, sorry for this ... reception, "; name$; "."
PRINT "Fleet-Commander Lrac told us about you. We welcome you."
GOTO schluss
vorbrav:
COLOR 2: PRINT "Ah, Captain "; name$; " again. The Hanappy told us about your "
PRINT "heroic efforts to save ZX-7/2 Factory station."
IF mis7 = -1 THEN PRINT "Unfortunately the ZX-7/2 has been destroyed by an Imperial Agent in the mean time."
GOTO schluss
schluss:
COLOR 2: PRINT "Stay alert and stay clear of the capital ships unless told to do otherwise."
PRINT "We will watch your every move. Don't try to fool us."
GOSUB schleife: COLOR 7: GOTO routine

repair:
IF speed = 8 THEN COLOR 4: PRINT "Your ship is not damaged !": GOSUB schleife: GOTO routine
IF speed < 7 THEN GOTO heavy
light:
IF ship = -1 THEN akt = skill(77): diff = 12 ELSE akt = skill(65): diff = 17
GOSUB roll
IF rolled >= diff THEN speed = 8: status$ = "Okay": COLOR 2: PRINT "You managed to repair your ship.": GOSUB schleife: GOTO routine
COLOR 4: PRINT "It might take a bit longer to repair your ship.": GOSUB schleife: GOTO routine
heavy:
kit = 0: parts = 0: FOR i = 1 TO 10
IF item$(i) = "Ship parts" THEN parts = i
IF item$(i) = "Engineering Kit" THEN kit = -1
NEXT i
FOR i = 1 TO 30
IF cargo$(i) = "Ship parts" THEN parts = i
IF cargo$(i) = "Engineering Kit" THEN kit = -1
NEXT i
IF parts = 0 THEN COLOR 4: PRINT "Sorry, your ship needs replacement-parts !": GOSUB schleife: GOTO routine
IF kit = -1 THEN PRINT "Your Engineering Kit makes your task much easier !"
IF parts <= 10 THEN GOTO item ELSE GOTO cargo1
item:
IF item$(parts) = "Ship parts" THEN item$(parts) = "": GOTO repair1
cargo1:
IF cargo$(parts) = "Ship parts" THEN cargo$(parts) = "": GOTO repair1
repair1:
IF ship = -1 THEN akt = skill(77) ELSE akt = skill(65)
GOSUB roll
diff = 8 - speed: diff = diff * 4: IF kit = -1 THEN diff = diff / 2
IF rolled < diff THEN COLOR 4: PRINT "No, that didn't work.": GOSUB schleife: GOTO routine
COLOR 2: PRINT "Yeah ! You made it. That should do until there is professional care."
speed = 8: status$ = "Okay"
GOSUB schleife: GOTO routine

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

endor:
CLS : PSET (20, 80), 15
PSET (150, 10), 15
PSET (600, 300), 15
COLOR 2: CIRCLE (690, -20), 240: PAINT (639, 0), 2
CIRCLE (400, 300), 80, 15
LINE (320, 300)-(480, 300), 15
CIRCLE (420, 260), 20, 15, , , .9
PSET (420, 260), 15
COLOR 4: LOCATE 27, 16: PRINT "An Intruder has entered the system ! Destroy him ! NOW !": GOSUB schleife
COLOR 7: LOCATE 27, 6: PRINT "Seconds later your ship is shocked with powerful blasts from all sides.": GOSUB schleife
LOCATE 27, 6: PRINT "You don't survive long enough to explain what your business is...        ": GOSUB schleife
RUN "starwars.bas"

