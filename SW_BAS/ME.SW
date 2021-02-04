SCREEN 12
COLOR 7
REM   ---------Mos Eisley Raumhafen
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
CLS : impolt = 1
file$ = "me.sw"
combat$ = ""
REM ---------Start des Abenteuers
IF start = 0 THEN start = -1: schau = -1: aa = -1 ELSE GOTO possib
PRINT "You are in an unfriendly looking place, full of space-rangers and pirates."
PRINT "Suddenly somewhere near you a drunkard jumps up and aims his blaster pistol"
PRINT "at a fellow drinker, shouting:'"; : COLOR 2: PRINT "You ugly imperial Spy!"; : COLOR 7: PRINT "'."
PRINT "While you are still quite surprised, two guys quite near the second drinker"
PRINT "pull imperial blaster rifles from their black coats and hammer the shouter"
PRINT "with their weapons, reducing him to an undertaker's nightmare."
PRINT "Before you can react, the three men carry the dead corpse out of the place."
GOTO bar

REM ---------M”glichkeiten
possib:
IF rancor = 120 THEN rancor = 0: GOTO space
CLS : billig = 0
COLOR 4
PRINT "Mos-Eisley"; : COLOR 7
PRINT " is one of the dirtiest places on this planet. In fact the whole"
PRINT "planet is full of dirt ,pirates and smuggler scum. The streets are"
PRINT "full with imperial patrols, traders and people rushing to and fro."
PRINT "Spaceships take off from the platforms of the spaceport."
IF schau = -1 THEN schau = -2: COLOR 4: PRINT "You can make out the three guys from the bar, as they carry their victim into": PRINT "the Imperial Outpost. The Stormtroopers ask you:"; : COLOR 2: PRINT "'Is there anything interesting over there ?'": COLOR 4: PRINT "As you deny (impressed by their Blaster rifles) the Stormtrooper nods."; : COLOR 2: PRINT "'Good. Now move on, nosy one!'"
IF schau = -3 THEN schau = -4: COLOR 4: PRINT "The Mon Calamari is just leaving Mos Eisley heading east.": COLOR 7
COLOR 7: PRINT "From here, you can"
PRINT "  0.Let time pass"
COLOR 14: PRINT "  1.Leave Mos Eisley": COLOR 7
PRINT "  2.Enter a shop"
PRINT "  3.Check out the Imperial Outpost"
PRINT "  4.Contact a medic"
PRINT "  5.Enter Spaceport"
PRINT "  6.Enter Bar"
PRINT
PRINT "  V.View Character"
PRINT "  G.Save Game"
PRINT "  S.Use a skill"
PRINT "  U.Use an item"
PRINT "  Q.Quit Game"
PRINT "The time is:"; time
IF bb = 2 THEN bb = 0: COLOR 4: PRINT "The bar is closed at this time."
IF bb = 3 THEN bb = 0: COLOR 4: PRINT "The shops are closed at this time"
IF impolt = 1 THEN impolt = 0: COLOR 4: PRINT "Imperial Stormtroopers check your identity.": PRINT "After they are finished one tells you:"; : COLOR 2: PRINT "'Don't use weapons inside the space port!'"
COLOR 7
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
time = time + 1: IF time > 2400 THEN time = 0
IF a$ = "0" THEN time = time + 100: IF time > 2400 THEN time = time - 2400
IF a$ = "0" THEN GOTO possib
IF a$ = "1" THEN GOTO leave
IF a$ = "6" THEN GOTO bar
IF a$ = "5" THEN GOTO space
IF a$ = "3" THEN GOTO imperial
IF a$ = "2" THEN GOTO shop
IF a$ = "s" OR a$ = "S" THEN GOTO skills
IF a$ = "u" OR a$ = "U" THEN GOTO items
IF a$ = "4" THEN GOTO medic
IF a$ = "g" OR a$ = "G" THEN GOTO savgam
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "q" OR a$ = "Q" THEN RUN "starwars.bas"
GOTO possib

REM ---------Leave Mos Eisley
leave:
COLOR 7
CLS : PRINT "Leaving Mos Eisley..."
PRINT "Again you are being checked upon.": IF rebel > -2 THEN PRINT "A Stormtrooper tells you:"; : COLOR 2: PRINT ; "'Be careful out there, we think there is a Rebel-Hideout somewhere": PRINT "out there.'": COLOR 7
COLOR 4: IF schau = -4 THEN PRINT "The Mon Calamari jumps into his glider and heads east.": schau = -5
COLOR 7
IF glid = -1 THEN PRINT "You jump into your glider and boost of into the endless desert." ELSE PRINT "Slowly you start your march through the endless desert."
GOSUB saver
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
RUN "tatmap.sw"

REM ---------In der Bar
bar:
IF time < 1600 THEN bb = 2: GOTO possib
IF aa = -1 THEN aa = 0 ELSE CLS
COLOR 7
PRINT "The "; : COLOR 4: PRINT "Brawling Wookie "; : COLOR 7: PRINT "is THE meeting point for all"
PRINT "smugglers, pirates and bounty hunters on this world. A band of strange musicians"
PRINT "is playing strange music. It is very loud and the smoke is thick."
PRINT "The barkeeper is a fat man who rushes up and down the bar all the time,"
PRINT "serving strange drinks for 5 Creds each."
PRINT "A gambler sits at the back of the bar."
IF aa = 1 THEN aa = 0: COLOR 4: PRINT "And how do you think you will pay ???"
PRINT "The time is:"; time: COLOR 7
akt = skill(18): GOSUB roll: IF rolled > 8 THEN GOSUB alien
uu = 0: oo = 0: FOR i = 1 TO 10
IF INSTR(item$(i), " for ") <> 0 THEN uu = -1
IF item$(i) = "" AND uu = 0 THEN oo = i
NEXT i
IF ship = -1 AND oo > 0 AND uu = 0 AND INT(RND * 3) + 1 = 1 THEN GOSUB geschaeft
COLOR 14: PRINT "1.Leave this place": COLOR 7
PRINT "2.Communicate"
PRINT "3.Start a fight with the locals"
PRINT "4.Order a drink - 5 Creds"
IF jabba = -6 THEN PRINT "5.Question Barkeeper"
PRINT
PRINT "S.Use a skill"
PRINT "Your command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
time = time + 10
IF time > 2400 THEN time = 0
IF a$ = "4" THEN GOTO barorder
IF a$ = "2" THEN GOTO bartalk
IF a$ = "3" THEN GOTO barfight
IF a$ = "s" OR a$ = "S" THEN GOTO barskill
IF a$ = "1" THEN GOTO possib
IF a$ = "5" AND jabba = -6 THEN GOTO barkeeper
GOTO bar
barkeeper:
PRINT
PRINT "Question him ";
COLOR 2: PRINT "1.'What do you know about Jabba's enemy?"
PRINT "             2.'Tell me what you know about Jabba's new enemy!'"
PRINT "             3.'Tell me all you know 'bout Jabba's enemy or DIE NOW!'"
PRINT "             4.'I'll kill your whole family and blow up this planet if"
PRINT "                you don't immediately tell me all you know about Jabba's"
PRINT "                newest enemy and his favorite Bounty Hunter, you SLUG !!"
COLOR 7: INPUT "What do you say "; a
IF a < 1 OR a > 4 THEN CLS : GOTO barkeeper
diff = 0: IF a = 1 THEN diff = 18: akt = skill(54)
IF a = 2 THEN diff = 16: akt = skill(55)
IF a = 3 THEN diff = 15: akt = skill(22)
IF a = 4 THEN diff = 13: akt = skill(22)
IF diff = 0 THEN CLS : GOTO barkeeper
GOSUB roll
IF rolled < diff THEN COLOR 2: PRINT "'I don't know anything. Boost off before I get mad.'": GOSUB schleife: GOTO bar
IF rolled >= diff THEN uv = 1
IF rolled - 5 > diff THEN uv = uv + 1
IF rolled - 10 > diff THEN uv = uv + 1
IF rolled - 15 > diff THEN uv = uv + 1
IF rolled - 20 > diff THEN uv = uv + 1
jabba = -7
DATA"His Brother, Glibba the Hutt, is behind everything. He lives on Ord Mantell."
DATA"There he has a small organization similar to Jabba's here on Tattooine."
DATA"He has money enough to buy even the most infamous Bounty Hunters."
DATA"The Bounty Hunter, Jabba is looking for is Boba Fett."
DATA"Please don't kill me !!!!!"
RESTORE barkeeper
FOR i = 1 TO uv
COLOR 2: READ a$: PRINT a$: NEXT i
COLOR 7: PRINT "Then he turns away from you with a face full of fear."
GOSUB schleife: GOTO bar

barorder:
IF cred >= 5 THEN cred = cred - 5 ELSE aa = 1: GOTO bar
PRINT "You down the Sullustan Ale as quickly as possible. It burns like hell."
PRINT "As you pay for the drink, the barkeeper smiles at you:";
COLOR 2: PRINT "'Maybe another one ?'"
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
IF a$ = "y" OR a$ = "Y" THEN GOTO barorder
GOTO bar
bartalk:
DATA"Those Stormtroopers give me the creeps. You can't do nothin' while they're round."
DATA"I hate them fuckin' Imperials, always messin'up the place."
DATA"I heard there is a Rebel-Stronghold somewhere in the desert."
DATA"Jabba's men are lookin' for experienced bounty hunters.You know Jabba, don't you?"
DATA"This Sullustan Ale is especially great, if someone else pays for it."
DATA"You kno', ma wife left me for one of them damn Troopas. I 'ate 'em!"
DATA"You know where I got that scar? No? Well, go out to the desert, an' you'll know."
DATA"Without a good glider, you are helplessly lost in the desert."
DATA"This is the most boring planet, I've ever been on. In fact it's the only one."
DATA"Have you heard of the Millenium Falcon? My ship is faster."
DATA"Keep your head low, kid. There are many fights around here."
DATA"It's not that easy.Don't cross me, boy.You're fooling with things beyond your understanding...where's my bottle?"
DATA"Think of peace and honor - and act upon that only!"
DATA"Do you know Kessel? What's it like there? Is it really that bad?"
DATA"I have 30 wives, each more beautiful than the last, and every single of them is insatiable. Where I got them from? I found someone for Jabba."
DATA"Whaddaya want? I don't know anything, but thanks for the drink..."
DATA"Rebels are stupid Anarchists. I don't understand why he doesn't execute 'em all."
DATA"Have you ever seen a star-destroyer? They're quite impressive, you know?"
DATA"I hate them Aliens in this place. They take our jobs, our wives, everything. I hope the Empire will clear this place up soon."
DATA"Raw flesh, raw bantha flesh. I know it, believe me. It is the key to a longer life.
DATA"<Gulp> Thank you..."
DATA"Did you already meet Jabba? No, surly not, you wouldn't be sitting here with me if you had."
DATA"I always try to book a cheap passage from this crap planet, but they're sold out all the time and I can't afford the expensive ones."
DATA"'ave you ever played a game with Al? He's sitting at the back of the bar."
persons:
DATA"Sullustan","Smuggler","old man","robed figure","Ithorian","Twi'lek","Gamorrean","young pilot","drunkard"
RESTORE persons
RANDOMIZE TIMER
a = INT(RND * 8) + 1
FOR i = 1 TO a
READ a$
NEXT i
PRINT "You sit next to a "; a$: a$ = ""
COLOR 2: PRINT "'Pay me a drink (y/n)'"; : COLOR 7: INPUT a$
COLOR 7
IF a$ = "n" OR a$ = "N" THEN GOTO bar
IF a$ = "y" OR a$ = "Y" AND cred >= 5 THEN cred = cred - 5 ELSE GOTO bar
a = INT(RND * 24) + 1
RANDOMIZE TIMER: RESTORE bartalk
FOR i = 1 TO a
READ a$: NEXT i
COLOR 4: PRINT a$
DO WHILE INKEY$ = ""
LOOP
GOTO bar
barfight:
CLS
PRINT "You pick a fight with a local. Several others stand up to assist him."
PRINT "Do you want to "; : COLOR 4: PRINT "(1) hit 'em as hard as you can"
PRINT "               (2) buy them some drinks."
COLOR 7
IF cred >= 50 THEN PRINT "The drinks would be for 50 creds"
IF cred < 50 THEN PRINT "Well, the drinks would be too expensive for you..."
INPUT "Your command"; a
IF a < 1 OR a > 2 THEN GOTO barfight
IF a = 2 AND cred < 50 THEN GOTO barfight
IF a = 2 THEN cred = cred - 50: PRINT "You were lucky,"; : COLOR 4: PRINT "this time.": COLOR 7
IF a = 1 THEN PRINT "Suddenly the crowd steps aside so you have space for your fight.": PRINT "Someone says:"; : COLOR 2: PRINT "'I bet 20 creds, that the kiddo will be dead in 3 seconds!'"
DO WHILE INKEY$ = "": LOOP
IF a = 1 THEN combat$ = "barfight": GOSUB saver: RUN "fight.sw"
GOTO bar
barskill:
bs = -1
GOSUB skills
bs = 0
IF use = 14 THEN diff = 18: GOTO pickpock
IF use = 22 THEN diff = 26: GOTO intimid
IF use = 52 THEN GOTO gamble
IF use = 58 THEN GOTO barfight
IF use = 64 THEN GOTO plaster
IF use = 63 THEN GOTO armor
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP
GOTO bar

armor:
a = 0: FOR i = 1 TO 10
IF item$(i) = "Armor parts" THEN a = i
NEXT i
COLOR 4: IF a = 0 THEN PRINT "No replacement parts !": GOSUB schleife: GOTO possib
IF INSTR(ac$, "damaged") = 0 THEN PRINT "Your main armor is not damaged !": GOSUB schleife: GOTO possib
diff = 16: akt = skill(63): item$(a) = ""
GOSUB roll
IF rolled < diff THEN PRINT "It is still damaged !": GOSUB schleife: GOTO possib
PRINT "You did it !": ac = ac + 1
IF INSTR(ac$, "vest") <> 0 THEN ac$ = "Blast vest"
IF INSTR(ac$, "armor") <> 0 THEN ac$ = "Blast armor"
IF INSTR(ac$, "Battle") <> 0 THEN ac$ = "Battle suit"
GOSUB schleife
GOTO possib


plaster:
COLOR 4
a = 0: FOR i = 1 TO 10
IF item$(i) = "Blaster parts" THEN a = i
NEXT i
IF a = 0 THEN PRINT "You have no replacement parts !": GOSUB schleife: GOTO possib
parts = a
IF INSTR(weap$, "modified") <> 0 THEN PRINT "Your main-weapon is modified to its limits !": GOSUB schleife: GOTO possib
IF weap$ = "SC-75 Rifle" THEN PRINT "You can't modify a firearm !": GOSUB schleife: GOTO possib
IF weap$ = "Vibro Axe" THEN PRINT "You can't modify a hand-to-hand-weapon !": GOSUB schleife: GOTO possib
IF weap$ = "Lightsaber" THEN PRINT "A Lightsaber can't be modified !": GOSUB schleife: GOTO possib
diff = dam * 5: item$(parts) = ""
akt = skill(64): GOSUB roll
IF rolled < diff THEN PRINT "Seems it didn't work.": GOSUB schleife: GOTO possib
dam = dam + 1: weap$ = "modified " + weap$
PRINT "Yeah ! That's it!"
GOSUB schleife: GOTO possib

pickpock:
akt = skill(14)
GOSUB roll
IF rolled > diff THEN PRINT "Gotcha!!!" ELSE GOTO barfight
a = INT(RND * 100) + 1
cred = cred + a: PRINT "Nobody saw you when you just stole"; : COLOR 4: PRINT a; : COLOR 7: PRINT "Creds!"
DO WHILE INKEY$ = "": LOOP
GOTO bar
intimid:
akt = skill(22)
GOSUB roll
PRINT "You try to intimidate the barkeeper and ";
IF rolled > diff THEN COLOR 4: PRINT "succeed !": COLOR 7: PRINT "He tells you that sometimes there is an alien rebel-spy here."
IF rolled < diff THEN PRINT ".....Oh No!": PRINT "The barkeeper nods at a few guys, which stand up and face you."
DO WHILE INKEY$ = "": LOOP
IF rolled < diff THEN GOTO barfight
GOTO bar
alien:
akt = skill(18)
GOSUB roll
COLOR 4
IF rolled >= diff AND schau = -2 THEN COLOR 4: PRINT "There is a Mon Calamari at the back. These guys are known to be alligned with   the rebels!": COLOR 7: PRINT "As you spot him, he rushes out.": IF schau > -3 THEN schau = -3: GOTO ali
ali:
COLOR 7
RETURN
gamble:
CLS
PRINT "You move through the crowds to the back of the bar."
PRINT "There you find a card shark called Al."
gambl:
COLOR 7: PRINT "You have"; cred; "credits left."
COLOR 2: INPUT "Play a game(y/n)"; a$
color7: IF a$ = "N" OR a$ = "n" THEN GOTO bar
IF a$ = "Y" OR a$ = "y" THEN COLOR 2: PRINT "He shuffles the cards..."
COLOR 4: IF cred < 10 THEN PRINT "You don't have enough money!!!": GOTO gambl
time = time + 20: IF time > 2400 THEN time = 0
akt = skill(52)
GOSUB roll
RANDOMIZE TIMER
diff = INT(RND * 20) + 5
IF akt > diff THEN PRINT "You win 10 Creds!": cred = cred + 10
IF diff > akt THEN PRINT "You loose 10 Creds!": cred = cred - 10
GOTO gambl

REM ---------Space-port
space:
CLS : COLOR 4
PRINT "Mos Eisley "; : COLOR 7: PRINT "Spaceport is one of the filthiest places in the galaxy."
PRINT "Traders, Pilots and Technical personell are rushing about. Everyone seems to"
PRINT "think, that he is the most important guy on this world."
PRINT "A clerk is sitting behind a counter. He looks as if he would fall asleep any"
PRINT "moment now. A poster on the wall indicates several rebel terrorists for which"
PRINT "a high reward is paid."
PRINT "Another poster indicates, that experienced technical personell is wanted."
ansagen:
DATA"YT-1300 A-978-643 Stock Transport. Lift off permission granted."
DATA"YT-1300 C-112-658 Stock Transport. Lift off permission granted."
DATA"YT-1300 B-174-529 Stock Transport. Lift off permission granted."
DATA"YT-1300 K-854-368 Stock Transport. Lift off permission granted."
DATA"YT-1300 R-623-111 Stock Transport. Lift off permission granted."
DATA"YT-1300 U-999-121 Stock Transport. Lift off permission granted."
DATA"YT-1300 Q-138-657 Stock Transport. Lift off permission granted."
DATA"YT-1300 G-758-142 Stock Transport. Lift off permission granted."
DATA"Warning Platform 1! Stock light freighter will land in 5 Minutes."
DATA"Warning Platform 2! Stock light freighter will land in 5 Minutes."
DATA"Warning Platform 3! Stock light freighter will land in 5 Minutes."
DATA"Warning Platform 4! Stock light freighter will land in 5 Minutes."
DATA"Warning Platform 5! Stock light freighter will land in 5 Minutes."
DATA"Warning Platform 6! Stock light freighter will land in 5 Minutes."
DATA"Tech-Personell required at Platform 3"
DATA"Repair Crew required at Platform 2"
DATA"Passengers for Tyderian Shuttle proceed to Platform 1"
DATA"Please do not leave your bags unattended at any time."
DATA"Mind the platforms"
DATA"Stormtroopers required on platform 3"
DATA"Tie-Pilots report to your craft for patrol mission!"
DATA"Tie-Squadron Delta report to 'Defiant' immediately."
DATA"Tie-Squadron Alpha report to 'Defiant' immediately."
DATA"Welcome to Mos Eisley spaceport, we hope you have a pleasant stay."
RESTORE ansagen
RANDOMIZE TIMER: a = INT(RND * 24) + 1
FOR i = 1 TO a
READ a$
NEXT i
PRINT "A thundering voice shouts:"; : COLOR 2: PRINT a$
COLOR 7
IF ship = -1 THEN PRINT "On platform 8 your ship, the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT " is waiting for you."
IF ship = -2 THEN PRINT "On platform 8 your dropshuttle is waiting for you."
COLOR 14
IF jabba = -2 THEN COLOR 4: PRINT "You are engaged by a terrifying droid with his thugs.": GOTO ig88
PRINT
IF jabba = -4 AND qork = 0 AND lobot < 0 THEN qork = 1: COLOR 4: PRINT "A technican approaches you:"; : COLOR 2: PRINT "'Jabba wants to see you.'"
COLOR 7: PRINT "0.Let time pass": COLOR 14
PRINT "1.Leave ": COLOR 7
PRINT "2.Book a passage"
PRINT "3.Apply for job"
PRINT "4.Talk to clerk"
IF ship < 0 THEN PRINT "5.Board your Ship"
IF ship < 0 AND status$ <> "Okay" THEN PRINT "6.Have your ship repaired"
PRINT "Time:"; time
PRINT : a = 0
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
uv = 0: IF a$ = "0" THEN time = time + 100: uv = 1
time = time + 1: IF time > 2400 THEN time = time - 2400
IF uv = 1 THEN GOTO space
IF a$ = "1" THEN GOTO possib
IF a$ = "2" THEN GOTO passage
IF a$ = "3" THEN GOTO apply
IF a$ = "4" THEN GOTO clerk
IF a$ = "5" AND ship < 0 THEN GOTO ship
IF a$ = "6" AND ship < 0 AND status$ <> "Okay" THEN GOTO repair
GOTO space
repair:
pr = 8 - speed
pr = pr * 10000
COLOR 2
PRINT "That would cost"; pr; "Credits."
IF cred < pr THEN COLOR 4: PRINT "Not enough money !": GOSUB schleife: GOTO space
INPUT "Pay (y/n)"; a$
IF a$ = "Y" OR a$ = "y" THEN cred = cred - pr: speed = 8: status$ = "Okay": PRINT "The "; ship$; " is repaired.": GOSUB schleife: GOTO space
GOTO space

passage:
time = time + 10
PRINT "The clerk types something on his computer and then says:"
a = INT(RND * 20) + 1
IF a > 1 THEN COLOR 2: PRINT "'Sorry we're sold out.'": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO space
COLOR 2: PRINT "I'm afraid we're ... wait...there....I think, there is....Yes!"
PRINT "But it's not the cheapest, I must tell you."
IF cred > 100000 THEN pr = cred + 20000 ELSE pr = 100000
PRINT "It is for ..... let me see .... ah yes .... it costs"; pr; "Credits."
PRINT "Can you afford this ?"
COLOR 7: PRINT "As you deny, he says"; : COLOR 2: PRINT " 'Sorry 'bout that.'": COLOR 7
DO WHILE INKEY$ = "": LOOP
GOTO space
apply:
IF time > 800 THEN PRINT "You must come before 8:00 in the morning!": DO WHILE INKEY$ = "": LOOP: GOTO space
time = time + 180
PRINT "The clerk takes you to a back room, where a fat man waits for you."
COLOR 2: PRINT "'I am the technical coordinator here. I will test your abilities"
PRINT "to repair stock leight freighters like the YT-1300 and to repair their weapons.'"
COLOR 7
PRINT "He then asks you some questions about starships, laser cannons and stuff."
IF skill(77) + skill(79) >= 10 THEN GOTO weir
COLOR 2: PRINT "'Naa, pal, you dunno enuff to repair anything on these ships."
PRINT "Don't waste ma time anymore till you've learned 'nything.'"
DO WHILE INKEY$ = "": LOOP: GOTO space
weir:
COLOR 2: PRINT "'t looks you've seen a ship or two. Let's try."
COLOR 7: PRINT "You're liable for today's work."
DO WHILE INKEY$ = "": LOOP
CLS
DATA"YT-1300 Freighter","Tyderian Shuttle","Lone Scout-A","Stock Ghtroc Freighter"
DATA"YT-1210 light Freighter","Modified Corellian Transport"
RESTORE weir
a = INT(RND * 6) + 1
FOR i = 1 TO a: READ a$: NEXT i
PRINT "This day's job requires you to repair a "; : COLOR 4: PRINT a$
diff = INT(RND * 40) + 1
COLOR 7
IF diff < 10 THEN a$ = "hardly damaged at all"
IF diff > 9 AND diff < 20 THEN a$ = "quite damaged"
IF diff > 19 AND diff < 30 THEN a$ = "heavily damaged"
IF diff > 29 THEN a$ = "nearly destroyed"
PRINT "The craft is "; a$; "."
PRINT : PRINT "Push a key to repair"
DO WHILE INKEY$ = "": LOOP
akt = skill(77): GOSUB roll
IF rolled >= diff THEN GOTO good ELSE GOTO bad
good:
time = 1800: PRINT "You do a fine job and together with a few other mechanics, you"
PRINT "manage to repair the craft until 18:00."
PRINT "You earned 150 Creds for a day's work.": cred = cred + 150
DO WHILE INKEY$ = "": LOOP: GOTO space
bad:
time = 2000: PRINT "Though you do your best you work until 20:00, not at all finishing the "
PRINT "repairs of the craft. The damages were trickier than you thought."
PRINT "You are fined 50 Credits by the clerk as you leave.": cred = cred - 50
IF cred < 0 THEN cred = 0
DO WHILE INKEY$ = "": LOOP
GOTO space
clerk:
DATA"If you want to book a passage, forget it. They're sold out all the time."
DATA"<Yawn>"
DATA"I'm afraid I've got work to do."
DATA"Sometimes it's easier to steal a ship than to book a passage. Just kidding..."
DATA"Have you heard of them rebel terrorists? They sabotage Imperial shuttles here."
DATA"Since those Imperials are 'round, the crime rate has dropped. I like 'em."
DATA"See this YT-1300 landing over there ? 'tis a fine ship, I tell ya."
DATA"'ve you seen on of those rebel terrorists? I have heard there is a rebel camp somewhere east of Mos Eisley."
DATA"I personally met the Admiral that controls this Sector of space. A very nice man."
DATA"I'd love to own one of these Imperial Uniforms."
DATA"Who are you to disturb me?"
DATA"I've heard that Jabba is looking for Bounty Hunters. You know who Jabba is, don't you ?"
DATA"Have you tried the Bantha steak at the Brawling Wookie?"
DATA"Have you met Al, the cardshark yet?"
DATA"Beware of thieves at the bazaar! They stole my purse once."
RESTORE clerk
a = INT(RND * 15) + 1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
COLOR 7: time = time + 4
DO WHILE INKEY$ = "": LOOP
GOTO space
REM ---------Abflug
ship:
CLS
PRINT "You board your ship, the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT "."
PRINT "You feel strangely at home here. This is YOUR ship."
PRINT "After ten minutes your communicator cracks:"
COLOR 2
PRINT "<Crack> "; name$; ", prepare to take off. You have starting <crack> permission"
PRINT "Repeat <crack> prepare to take <crack> off! You have starting permission."
COLOR 7
PRINT "Then the communicator falls silent again. As you power up the engines,"
PRINT "lights start flickering and the astrogation console humms to life."
PRINT "The ship slowly lifts off the platform and again the comm-link cracks:"
COLOR 2: PRINT "Good bye,"; ship$; ",have a pleaseant flight!"
COLOR 7
PRINT "A Tie Fighter escorts you up to the outer orbit. From then on you are all alone."
PRINT "You go past an Imperial Star-Destroyer (a very impressive sight) and set your"
PRINT "Astrogation console to..."
DO WHILE INKEY$ = "": LOOP
CLS : GOSUB saver
RUN "space.sw"

REM ---------Imperial Outpost
imperial:
CLS : COLOR 7
PRINT "You enter a highly guarded room with blast proof walls. Behind a desk sits"
PRINT "A man clad in an imperial uniform. As you step in he looks up from his monitor."
PRINT "Men in Stormtrooper armor rush through the room."
PRINT "On the far wall there is a poster:"; : COLOR 4: PRINT "SERVE THE EMPEROR ABOVE ALL OTHERS!": COLOR 7
PRINT "The whole surrounding looks sterile and clean. You feel like on another planet"
PRINT "or on an imperial Starship."
PRINT "Cameras watch your every move and you feel quite uneasy."
PRINT "A shining silvery protocol droid faces you."
COLOR 4: IF INSTR(weap$, "Blaster Rifle") <> 0 THEN PRINT "You are attacked !"; : COLOR 2: PRINT " Blaster Rifles are illegal!": GOSUB schleife: combat$ = "impfight": GOSUB saver: RUN "fight.sw"
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Talk to Protocol Droid"
IF rebel = -1 THEN PRINT "3.Give away secret location of rebel hideout."
IF mis9 = 0 AND rebel = -2 AND mis7 = -1 THEN PRINT "3.Report destruction of ZX-7/2 on Calamari."
PRINT
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO possib
IF a$ = "2" THEN GOTO protocol
IF a$ = "3" AND mis9 = 0 AND rebel = -2 AND mis7 = -1 THEN GOTO report
IF a$ = "3" AND rebel = -1 THEN GOTO verrat
GOTO imperial
report:
CLS
PRINT "You report your doings to the Commander of this Outpost.": COLOR 2
GOSUB schleife
PRINT "'Very good, indeed, Captain "; name$; "."
PRINT "The Emperor needs spies like you. You are very precious. Well, this time,"
PRINT "I won't give you any money. This time I will report to the Sector's Commander"
PRINT "Wait a moment.'"
COLOR 7
PRINT "Then he leaves the room for about twenty minutes.": GOSUB schleife
COLOR 2
PRINT "'You won't believe it. Commander Hotchkin is at this moment directly reporting"
PRINT "your heroic efforts for the Empire to the Grand Moff and to his Majesty himself"
PRINT "You are to meet the Emperor and Darth Vader personally at Coruscant !"
PRINT "Go there directly. There you will be promoted and instructed about the Emperor's"
PRINT "will."
COLOR 7
PRINT "Then he salutes you and waits for you to salute as well."
GOSUB schleife: mis9 = -1
GOTO imperial

protocol:
DATA"The Rewards for giving away terrorists are high...very high."
DATA"The galactic Empire consists of thousand-thousand worlds."
DATA"The Emperor Palpatine will surley visit this planet one day."
DATA"Serve the Emperor !"
DATA"The planetary Governor Hotchkin is on his Stardestroyer 'Defiant' in orbit around Tattooine."
DATA"Mind the brawling wookie. Lots of Anarchists there."
DATA"Soon the danger of the sand people will be taken care off."
DATA"Mind Jabba the Hutt."
DATA"There is a high reward for the head of Princess Leia."
DATA"The center of the universe is Coruscant."
DATA"There is a high reward for the heads of General Madine and Admiral Ackbar."
DATA"There is a high reward on Luke Skywalker."
DATA"Don't trade with Jawas. Trade with humans only."
DATA"Blaster Rifles are illegal in Mos Eisley. Military only."
RESTORE protocol
RANDOMIZE TIMER: a = INT(RND * 14) + 1
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$: COLOR 7
DO WHILE INKEY$ = "": LOOP
GOTO imperial
verrat:
CLS
rebel = -2
PRINT "As you start to talk, the man behind his desk jumps up and looks at you:"
COLOR 2: PRINT "'Do you know what you're saying here ? This is GREAT !'"
COLOR 7: PRINT "He starts shouting orders into his comlink while Stormtroopers"
PRINT "armed with light repeating Blasters rush out and jump into gliders."
PRINT "Then the attandand opens a channel to the Stardestroyer in orbit:"
COLOR 2: PRINT "'Ahem...this is Mos Eisley troop commander Hicks. aaah can I speak"
PRINT "to the Governor ?'"
COLOR 7: PRINT "Then it takes a few minutes": COLOR 2: PRINT "'<crack> Hotchkins here. I hope <crack> it is important!'"
COLOR 7: PRINT "The color fades from the attendand's face as he answers:"
COLOR 2: PRINT "'We've got the verified coordinates of the rebel hideout."
PRINT "I suggest you begin planetary bombardment at coordinates 192-483-a2 right now."
PRINT "My men are on their way to clean up the mess afterwards.'"
COLOR 7: PRINT "After he turns off the comlink, he looks at you sincerely and hands"
PRINT "you 50.000 Credits."
PRINT "Then he pushes you out with the words:"; : COLOR 2: PRINT "Thanks. Serve the Emperor again and be rewarded again."
cred = cred + 50000
PRINT : COLOR 7
PRINT "You hear a low, rumbling sound as the Rebels are bombed out by the Star            Destroyer."
DO WHILE INKEY$ = "": LOOP
GOTO possib

REM ---------Shops
shop:
IF time < 800 OR time > 1900 THEN bb = 3: GOTO possib
CLS : COLOR 7
PRINT "You enter an extremely fucked up area. People buy and sell crap for horrifiing"
PRINT "prices. Here you can buy "; : COLOR 4: PRINT "Weapons, Equipment and armor"; : COLOR 7: PRINT ", if you can afford it, you"
PRINT "can even buy a "; : COLOR 4: PRINT "sand speeder"; : COLOR 7: PRINT "."
PRINT "Imperial patrols are very tight here. People seem to be very aware, that "
PRINT "pickpockets are 'working' around here."
PRINT "  You can:": COLOR 14
PRINT "1. Leave this strange bazaar": COLOR 7
PRINT "2. Buy something"
PRINT "3. Sell something"
PRINT : PRINT "S. Use a skill"
PRINT "Time :"; time
RANDOMIZE TIMER: i = INT(RND * 100) + 1: IF i < 6 THEN GOSUB bestohlen
COLOR 7
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
time = time + 2: IF time > 2400 THEN time = 0
IF a$ = "1" THEN GOTO possib
IF a$ = "2" THEN GOTO shopbuy
IF a$ = "3" THEN GOTO shopsell
IF a$ = "s" OR a$ = "S" THEN GOTO shopskill
GOTO shop
shopskill:
bs = -1: GOSUB skills: bs = 0
IF use = 2 OR use = 58 THEN GOTO impfight
IF use = 48 THEN diff = 14: GOTO bargain:
IF use = 14 THEN diff = 25: GOTO shopsteal
IF use = 64 THEN GOTO plaster
IF use = 63 THEN GOTO armor
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO shop
bargain:
akt = skill(48): GOSUB roll
COLOR 4: a = 0
IF rolled >= diff AND billig = 0 THEN a = 1: billig = -1: PRINT "You clervely act and the shopkeeper promises to sell everything a bit cheaper."
IF rolled < diff THEN COLOR 2: PRINT "'Be serious, young man. My wife and my 3 children want me to buy food for them.'"
IF billig = -1 AND a = 0 THEN COLOR 2: PRINT "'I can't give you anything cheaper than I already do!"
COLOR 7: a = 0
DO WHILE INKEY$ = "": LOOP
GOTO shop
shopsteal:
akt = skill(14)
GOSUB roll
c = rolled
akt = 3
GOSUB roll
diff = diff + rolled
IF c < diff THEN COLOR 2: PRINT "'Stop the thief!!!": COLOR 7: GOTO impfight
IF c >= diff THEN COLOR 4: PRINT "Picked a fat purse, actually:"; : a = INT(RND * 2000) + 2000: cred = cred + a: PRINT a; "credits."
DO WHILE INKEY$ = "": LOOP
GOTO shop
shopbuy:
CLS : COLOR 7
PRINT "The shopkeeper smiles at you:"; : COLOR 2: PRINT "'Wad canna do for ya?'"
COLOR 14
PRINT "0.Leave": COLOR 7
PRINT "1.Comlink                   300 Cr."
PRINT "2.Medpac                    600 Cr."
PRINT "3.Frag Grenades            1500 Cr."
PRINT "4.Dispersal Canister        400 Cr."
PRINT "5.PX-7 Heat Sensor          250 Cr."
PRINT "6.Hold-out Blaster          275 Cr."
PRINT "7.Datapad                   100 Cr."
PRINT "8.Blaster Pistol            500 Cr."
PRINT "9.Heavy Blaster            1250 Cr."
PRINT "10.Blast vest               300 Cr."
PRINT "11.Macrobinoculars          100 Cr."
PRINT "12.Sand Speeder           15000 Cr."
IF billig = -1 THEN COLOR 2: PRINT "'Let's see, I'll give you 10 percent on any item you want."
COLOR 7
PRINT : PRINT "Your purse tells you, that you've got"; : COLOR 4: PRINT cred; : COLOR 7: PRINT "credits left."
INPUT "Your command"; a
IF a = 0 THEN GOTO shop
erk$ = "": IF a < 1 OR a > 12 THEN GOTO shopbuy
IF a = 1 THEN it$ = "Comlink": pr = 300: erk$ = "A medium range personal comunicator."
IF a = 2 THEN it$ = "Medpac": pr = 600: erk$ = "This useful item helps to save lifes."
IF a = 3 THEN it$ = "Frag Grenade": pr = 1500
IF a = 4 THEN it$ = "Dispersal Canister": pr = 400: erk$ = "Whether at home, in a busy office or even in a cramped shipboard, you can now get rid of unwanted trash easily."
IF a = 5 THEN it$ = "PX-7 Heat Sensor": pr = 250: erk$ = "This device can detect heat-sources up to 100 metres away."
IF a = 6 THEN it$ = "Hold-out Blaster": pr = 275
IF a = 7 THEN it$ = "Datapad": pr = 100: erk$ = "Your personal computer for the 'take-away'."
IF a = 8 THEN it$ = "Blaster Pistol": pr = 500
IF a = 9 THEN it$ = "Heavy Blaster": pr = 1250
IF a = 10 THEN it$ = "Blast vest": pr = 300
IF a = 11 THEN it$ = "Macrobinoculars": pr = 100: erk$ = "The ideal device for long range scanning of your environment."
IF a = 12 THEN it$ = "Sand Speeder": pr = 15000
IF a = 12 THEN GOSUB wirklich
IF billig = -1 THEN GOTO prozente
GOTO weit:
prozente:
b = pr / 10
pr = pr - b
weit:
IF erk$ <> "" THEN PRINT erk$
COLOR 2: PRINT "'I say ya pay me"; pr; "bucks.'": COLOR 7
IF cred < pr THEN COLOR 4: PRINT "As you show him your purse, he looks angry and says:"; : COLOR 2: PRINT "'Don't waste ma time !'": COLOR 4: PRINT "He turns away from you, talking to another customer.": billig = 0: DO WHILE INKEY$ = "": LOOP: GOTO shop
COLOR 2: INPUT "Is this okay (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO shopbuy
IF a$ <> "y" AND a$ <> "Y" THEN GOTO weit
backpack:
CLS
IF pr > 10000 THEN GOTO glider
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
COLOR 2: PRINT "'I love to make business with people like you!'"
COLOR 7
DO WHILE INKEY$ = "": LOOP: GOTO shopbuy
glider:
COLOR 2
PRINT "'An excellent decision, Master! This baby, it's a Ubrikkian 9000 Z004, is"
PRINT "extremely popular round 'ere! It is sleek and low riding, and, while in flight,"
PRINT "it is a deadly predator."
PRINT "It features holographic displays, computer assist navigation and counter"
PRINT "balancers for a stable ride over rough terrain.'"
COLOR 4
cred = cred - pr
glid = -1: PRINT "He then smiles at you and says:"; : COLOR 2: PRINT "'It waits for you outside town.'"
DO WHILE INKEY$ = "": LOOP: GOTO shopbuy
shopsell:
CLS
COLOR 7: PRINT "The shopkeeper eyes you suspiciously,"; : COLOR 2: PRINT "'So what do you think that"
PRINT "you have, that I may want ?": COLOR 7
o = 0
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
IF glid = -1 THEN PRINT " 11 .Sandglider"
INPUT "What do you want to sell (0-go back)"; a
pr = 0
IF a = 0 THEN GOTO shop
COLOR 2
IF glid = -1 AND a = 11 THEN pr = 5000: PRINT "Nice Glider, but it looks used to me.": GOTO abba
IF a > 10 THEN GOTO shopsell
IF a < 1 OR item$(a) = "" THEN GOTO shopsell
IF INSTR(item$(a), "Mos Eisley") <> 0 THEN pr = 8000: COLOR 2: PRINT "'Ah, finally the cargo has arrived. You get 8000 for it.'"
IF INSTR(item$(a), "Narcotics") <> 0 THEN pr = pr + 4000: COLOR 2: PRINT "'4000 Extra in appretiation of the danger involved in this cargo.'"
IF INSTR(item$(a), " for ") <> 0 AND pr = 0 THEN COLOR 2: PRINT "Sorry. This is NOT the destiny of your cargo.": GOSUB schleife: GOTO shopsell
IF INSTR(item$(a), "damaged") <> 0 THEN pr = 20: COLOR 2: PRINT "'This crap thing is damaged !"
IF INSTR(item$(a), "modified") <> 0 THEN pr = 1200: COLOR 2: PRINT "'Modified this weapon, ey? I'll take it."
IF item$(a) = "Heavy Blaster" THEN pr = 330: COLOR 2: PRINT "'Well,well,..."
IF item$(a) = "Blaster Rifle" THEN pr = 1000: COLOR 2: PRINT "'Well, well that is indeed something I want."
IF item$(a) = "Vibro Axe" THEN pr = 2000: COLOR 2: PRINT "'Whew, killed one a dose Sandpeople, did ya? I surley take it."
IF item$(a) = "Thermal Detonator" THEN pr = 2000: COLOR 2: PRINT "'A very rare weapon. Even on the black market.'": pr = 1900
IF item$(a) = "SC-75 Rifle" THEN pr = 2000: COLOR 2: PRINT "'Yes, I can imagine you want to sell this crap gun. (O Blasphemy)'"
IF pr = 0 THEN COLOR 2: PRINT "Well, well, I could do without this.": pr = INT(RND * 100) + 100
abba:
COLOR 2: PRINT "'I pay you"; pr; "Credits.'"
IF pr <> 8000 THEN pr = pr + INT(RND * (pr / 2)) + 1
INPUT "'How much do you want for it'"; b
IF b = 0 THEN GOTO shopsell
IF b <= 0 THEN b = 0: COLOR 2: PRINT "I take everything, if it's for free."
IF b > pr THEN PRINT "'Stupid,ey? I can get it cheaper 'round every corner here!"
IF b <= pr AND a = 11 THEN glid = 0: PRINT "'Okay, I'll take it back.": GOSUB schleife: GOTO shopsell
IF b <= pr THEN item$(a) = "": PRINT "'Great, t'was a pleasure for me.'": COLOR 7: PRINT "He takes his purse out and pays you.": cred = cred + b
COLOR 7: DO WHILE INKEY$ = "": LOOP
GOTO shopsell

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
REM skill von possib aus:
skiposs:
IF use = 2 OR use = 58 OR use = 22 THEN GOTO impfight
IF use = 26 THEN diff = 16: GOTO streetwise
IF use = 14 THEN diff = 19: GOTO pick
IF use = 64 THEN GOTO plaster
IF use = 63 THEN GOTO armor
PRINT "Of no use."
DO WHILE INKEY$ = "": LOOP: GOTO possib
pick:
akt = skill(14)
GOSUB roll
c = rolled
akt = 3
GOSUB roll
diff = diff + akt: RANDOMIZE TIMER
COLOR 2: b = INT(RND * 500) + 1
IF c >= diff THEN PRINT "You managed to steal under the eyes of Stormtroopers.": cred = cred + b: PRINT "You stole"; b; "Credits!"
IF diff > c THEN PRINT "A perceptive Stormtrooper saw what you tried to do!!!": GOTO impfight
DO WHILE INKEY$ = "": LOOP
GOTO possib
impfight:
COLOR 4
PRINT "The imperial Stormtroopers suddenly draw their weapons and shoot at you."
combat$ = "impfight"
GOSUB saver
DO WHILE INKEY$ = "": LOOP
RUN "fight.sw"
streetwise:
akt = skill(26)
GOSUB roll
CLS
IF rolled >= diff THEN PRINT "You know this kind of place. In the bar it should be easy to make money through": PRINT "gambling and stealing. The barkeeper may know something, he hears all those": PRINT "stories of this pirate scum.": PRINT "If it was possible to steal here, the outcome would be greater, but those": PRINT "Stormtroopers..."
IF rolled < diff THEN PRINT "Nothing comes to your mind that could help."
DO WHILE INKEY$ = "": LOOP
GOTO possib

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
IF a < 1 OR a > 10 OR item$(a) = "" THEN COLOR 2: PRINT "What a sophisticated joke...": DO WHILE INKEY$ = "": LOOP: GOTO possib
herrlich:
COLOR 4: PRINT "U"; : COLOR 7: PRINT "se / "; : COLOR 4: PRINT "D"; : COLOR 7: PRINT "rop / "; : COLOR 4: PRINT "R"; : COLOR 7: PRINT "earrange"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "u" OR a$ = "U" THEN GOTO herrlicher
IF a$ = "d" OR a$ = "D" THEN item$(a) = "": GOTO possib
IF a$ = "r" OR a$ = "R" THEN GOTO rearrange
GOTO herrlich
rearrange:
INPUT "Change place with (1-10) "; b
IF b < 1 OR b > 10 THEN GOTO rearrange
SWAP item$(a), item$(b)
GOTO possib
herrlicher:
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
IF item$(a) = "Lightsaber" THEN GOTO changweap
PRINT "Of no use.": DO WHILE INKEY$ = "": LOOP: GOTO possib
changweap:
b = 0
INPUT "Use this as your main weapon (y/n)"; a$
IF a$ = "n" OR a$ = "N" THEN GOTO possib
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
GOTO possib
changarm:
b = 0
INPUT "Use this as you main armor (y/n)"; a$
IF a$ = "N" OR a$ = "n" THEN GOTO possib
IF a$ = "Y" OR a$ = "y" THEN SWAP ac$, item$(a): b = 1
IF item$(a) = "Nothing" THEN item$(a) = ""
IF b = 0 THEN GOTO changarm
IF INSTR(ac$, "Battle") <> 0 THEN ac = 4
IF INSTR(ac$, "Blast armor") <> 0 THEN ac = 2
IF INSTR(ac$, "Blast vest") <> 0 THEN ac = 1
IF INSTR(ac$, "damaged") <> 0 THEN ac = ac - 1
GOTO possib

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
GOTO possib

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
PRINT health$; : IF lost > 0 THEN PRINT "( -"; STR$(lost); "D )"
IF lost = 0 THEN PRINT
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
IF a$ <> "s" AND a$ <> "S" THEN GOTO possib

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

CLS : GOTO possib

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

REM -------------Bestohlen!
bestohlen:
akt = 4
GOSUB roll
c = rolled
akt = stat(4)
GOSUB roll: COLOR 4
IF rolled >= c THEN PRINT "You just stopped a thief from stealing your money.": GOTO gefasst
a = INT(RND * 2) + 1
stahl:
IF a = 1 THEN GOTO stuhl ELSE cred = cred - 200: COLOR 4: PRINT "Some of your money is gone!": IF cred < 0 THEN cred = 0
RETURN
stuhl:
IF rancor > 0 THEN a = 2: GOTO stahl
a = 0: FOR i = 1 TO 10
IF item$(i) <> "" THEN a = a + 1
NEXT i
IF a = 0 THEN a = 2: GOTO stahl
stihl:
a = INT(RND * 10) + 1
IF item$(a) = "" THEN GOTO stihl
item$(a) = "": rancor = a: RETURN
RETURN
gefasst:
COLOR 2: PRINT "Please, please! Don't hurt me, the boy shouts."
COLOR 4: PRINT "1.Attack !": PRINT "2.Slap him and let him go.": PRINT "3.Hand him over to the Imperials"
INPUT "What do you do "; a
COLOR 7: IF a = 2 THEN PRINT "Grateful the young thief runs off.": RETURN
IF a = 3 THEN PRINT "The Imperials thank you and execute him here at the bazaar.": RETURN
IF a = 1 THEN combat$ = "thief": GOSUB saver: RUN "fight.sw"
GOTO gefasst

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
COLOR 4: IF lost <= 0 THEN PRINT "You are not wounded!!!!": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO possib
diff = lost * 3
akt = skill(74) + skill(71)
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB verwundet: DO WHILE INKEY$ = "": LOOP: GOTO possib
COLOR 2: PRINT "The medpac did not help you."
DO WHILE INKEY$ = "": LOOP: GOTO possib

medic:
COLOR 2: IF lost <= 0 THEN PRINT "But you are not wounded !": COLOR 7: DO WHILE INKEY$ = "": LOOP: GOTO possib
pr = lost * 1000: haha = lost
PRINT : PRINT " After examining you, Dr.Baumi demands"; pr; "credits."
IF cred < pr THEN COLOR 4: PRINT " You don't have enough money!": DO WHILE INKEY$ = "": LOOP: GOTO possib
ahem:
INPUT " Pay this excessive price (y/n)"; a$
IF a$ = "y" OR a$ = "Y" THEN lost = 0: COLOR 2: PRINT " You feel a lot better now. (Your purse feels a lot worse, actually)": DO WHILE INKEY$ = "": LOOP: GOSUB verwundet: cred = cred - pr: GOTO possib
IF a$ = "n" OR a$ = "N" THEN GOTO possib
GOTO ahem

wirklich:
IF skill(40) > 3 THEN RETURN
COLOR 7: PRINT "The shopkeeper looks at you and shakes his head.": COLOR 2
PRINT "Naaa, I dun think you can handle this baby. You need some skill first."
PRINT "Really, these repulsorlifts are a lot harder to drive than you think."
COLOR 7: INPUT "Do you still want to buy it (y/n)"; a$
IF a$ = "y" OR a$ = "Y" THEN RETURN ELSE RETURN shopbuy

ig88:
PRINT "As he raises his built-in Concussion Grenade Launcher a metallic voice shouts:"
COLOR 2: PRINT "'So you are the human that Jabba sent after me. I must tell you"
PRINT "that your chance to survive this combat is below 0.5%. Surrender and you"
PRINT "have a 30% chance to survive. I am far more capable to withstand blaster fire"
PRINT "than you. This tactic has a 0% propability curve for success."
COLOR 7: combat$ = "ig88": GOSUB schleife: GOSUB saver: RUN "fight.sw"

schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

geschaeft:
COLOR 2: PRINT "'Shh, hey you over there !'"; : COLOR 7: PRINT " someone whispers."
PRINT "Ignore (y/n) ?"
gess:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "Y" OR a$ = "y" THEN RETURN
IF a$ = "n" OR a$ = "N" THEN COLOR 2 ELSE GOTO gess
PRINT "'I need someone for a little cargo run :";
DATA "Spice","Narcotics","Foodstuffs","Robot parts","Hydro-screwdrivers"
DATA"Hydrogen","Holos"
tos:
DATA" for Kari"," for Cloud-City"
RANDOMIZE TIMER
a = INT(RND * 7) + 1
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
RETURN


