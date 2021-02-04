REM ----------------Echo-Base:
DIM map$(55, 18)
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
file$ = "eb.sw"
SCREEN 12
routine:
IF rancor = 33 THEN rancor = 0: GOTO hangar
CLS
COLOR 7: PRINT "The "; : COLOR 4: PRINT "former rebel-base"; : COLOR 7: PRINT " has been adapted to Imperial needs. There are "
COLOR 4: PRINT "Launch-bays"; : COLOR 7: PRINT " for Tie-fighters, a docking-bay for an AT-AT and several AT-STs."
PRINT "Troopers armed with Blaster Rifles and eventually light repeating Blasters are"
PRINT "swarming around the place. You are completely ignored."
PRINT "The whole base -formerly constructed out of the ice by the rebels- is now"
PRINT "being constructed anew, this time completly out of metal."
IF imper = -1 THEN COLOR 4: imper = -2: PRINT "Suddenly the detonite goes off. Hell knows what started the explosion too": PRINT "early. The whole hangar deck collapses upon the Fighters, technicans, Walkers": PRINT "and so on. Troopers rush in to help."
DATA"Tie-Fighter Alpha 1 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 2 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 3 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 4 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 5 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 6 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 7 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 8 prepare for Scout Mission !"
DATA"Tie-Fighter Alpha 9 prepare for Scout Mission !"
DATA"Tie-Fighter Beta 1 prepare for Scout Mission !"
DATA"Tie-Fighter Beta 2 prepare for Scout Mission !"
DATA"Attention, Scout-Walker entering docking bay."
DATA"Attention, Tie is landing in Area 5."
DATA"Attention, Tie is landing in Area 4."
DATA"Attention, Tie is landing in Area 3."
DATA"Attention, Tie is landing in Area 2."
DATA"Attention, Tie is landing in Area 1."
DATA"Construction-droids needed in Area 4."
DATA"Construction-droids needed in Area 2."
DATA"Construction-droids needed in Area 5."
RESTORE routine
RANDOMIZE TIMER: a = INT(RND * 20) + 1
FOR i = 1 TO a
READ a$: NEXT i
IF imper = 0 THEN COLOR 2: PRINT "'"; a$; "'"
IF imper = -2 THEN COLOR 2: PRINT "Medical personell required at Tie-hangar immediately !!!"
COLOR 14
PRINT
PRINT "1.Leave": COLOR 7
IF imper = 0 THEN PRINT "2.Enter Tie-Hangar"
IF imper = -2 THEN COLOR 4: PRINT "2.XXXXX XXXxXXXXXX": COLOR 7
PRINT "3.Enter Cantina"
PRINT "4.Enter Medical Center"
PRINT
PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT "V.View Character"
PRINT "G.Save Game"
PRINT "Q.Quit Game"
PRINT
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" AND mis9 < 0 THEN GOSUB sec
IF a$ = "1" THEN PRINT "Leaving......": GOSUB schleife: GOSUB saver: RUN "hothmap.sw"
IF a$ = "v" OR a$ = "V" THEN GOTO viewchar
IF a$ = "q" OR a$ = "Q" THEN RUN "Starwars.bas"
IF a$ = "g" OR a$ = "G" THEN GOSUB savgam: GOTO routine
IF a$ = "2" AND imper = -2 THEN COLOR 4: PRINT "There is no such thing as a hangar anymore...": GOSUB schleife: GOTO routine
IF a$ = "2" THEN GOTO hangar
IF a$ = "3" THEN GOTO cantina
IF a$ = "4" THEN GOTO medical
IF a$ = "u" OR a$ = "U" THEN GOTO item
IF a$ = "s" OR a$ = "S" THEN GOTO skill
GOTO routine
sec:
a = 0: b = 0
FOR i = 1 TO 10
IF item$(i) = "Security Pass" THEN a = 1
IF item$(i) = "" THEN b = i
NEXT i
IF a = 1 THEN RETURN
IF a = 0 THEN COLOR 2: PRINT "Wait ! You have no Sec-Pass ! Take this one !": COLOR 7
IF b > 0 THEN item$(b) = "Security Pass": RETURN
GOSUB schleife
supertoll:
CLS
PRINT "Your backpack:"
PRINT "--------------"
FOR i = 1 TO 10
PRINT i; "."; item$(i)
NEXT i
INPUT "Put it where "; b
IF b < 1 OR b > 10 THEN GOTO supertoll
item$(b) = "Security Pass": RETURN
hangar:
CLS : COLOR 7
PRINT "You enter an area that reminds you of Mos-Eisley Space-port (not as dirty, but"
PRINT "nearly the same craft - Ties and Imperial shuttles). An unused AT-AT is "
PRINT "docked here as well. Pilots run to their ships, technical personell is lifting"
PRINT "the Ties via tractor beams, catapulting them out into the snowstorm."
PRINT "Everyone seems to be busy."
PRINT "A depot designated 'Fuel' stands next to a depot designated 'Torpedoes and heavy"
PRINT "rockets'."
IF mis9 < 0 AND ship = -1 THEN PRINT "Your ship, the "; : COLOR 4: PRINT ship$; : COLOR 7: PRINT " is here."
IF mis9 < 0 AND ship = -2 THEN PRINT "Your "; : COLOR 4: PRINT "dropshuttle"; : COLOR 7: PRINT " is here."
IF imper = -1 THEN COLOR 4: PRINT "A load of Detonite is attached to the fuel-container.": COLOR 7
PRINT : COLOR 14: PRINT "1.Leave": COLOR 7
IF mis9 < 0 THEN PRINT "2.Board your ship"
PRINT : PRINT "U.Use Item"
PRINT "S.Use Skill"
PRINT : PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO board
IF a$ = "s" OR a$ = "S" THEN GOTO useskill
IF a$ = "u" OR a$ = "U" THEN GOTO useitem
GOTO hangar
board:
CLS
PRINT "Slowly, a tractor-guidance-beam lifts you off the hangar bay and your ship"
PRINT "hovers towards the opening hangar doors. Slowly your ship accelerates and"
PRINT "shoots out into the blizzard of ice and snow.": COLOR 2
PRINT "<Crack> Echo Base Tower here, t'was a pleasure to have you here !": COLOR 7
IF imper = -1 THEN imper = -2: PRINT "Below you the hangar explodes in a ball of fire as the detonite explodes.": COLOR 2: PRINT "<CrackCrackCrackCrack>....": COLOR 7
GOSUB schleife
GOSUB saver
RUN "space.sw"
useitem:
bs = -1: GOSUB item: bs = 0
IF item$(a) = "Detonite-Pack" THEN GOTO spreng
PRINT "Of no use here."
GOSUB schleife: GOTO hangar
useskill:
bs = -1: GOSUB skill: bs = 0
IF use = 68 THEN GOTO und
PRINT "Of no use here.": GOSUB schleife: GOTO hangar
und:
a = 0: FOR i = 1 TO 10
IF item$(i) = "Detonite-Pack" THEN a = i
NEXT i
IF a = 0 THEN PRINT "You need something powerful to blow these babies up.": GOSUB schleife: GOTO hangar
spreng:
item$(a) = ""
akt = skill(68): GOSUB roll
diff = 8
IF rolled < 8 THEN COLOR 4: PRINT "You attach your Detonite-Pack to the depot, but something tells you that you did something wrong. Something terribly wrong. Then the whole stuff blows up with you in the middle...": GOSUB schleife: RUN "starwars.bas"
PRINT "You attach the Detonite and set it to 10 Minutes. That should give you enough time to get away."
imper = -1: xp = xp + 3000
GOSUB schleife: GOTO hangar

cantina:
CLS : COLOR 7
PRINT "You enter the cantina. Here troops are provided with food and drink."
PRINT "Unfortunatly it is nothing like the Brawling Wookie. The food does NOT look"
PRINT "inviting to you. Troopers and Tech-personell are sitting around tables."
PRINT "It is noisy."
akt = stat(4): diff = 8: GOSUB roll
IF rolled < diff THEN GOTO mm
PRINT "You overhear someone say:";
DATA"'ve you heard of the new Deathstar, they're building ?"
DATA"I heard the Rebel fleet is massing off Sullust. Don't know why we don't just attack."
DATA"I hate this crap planet."
DATA"Fuckin' Ice-creatures. Killed one of my pals out there."
DATA"Sorry, I must return to my duty."
DATA"Harkov is pretty much fucking us up."
DATA"I am afraid of Grand Moffs, Moffs and people called 'Lord'."
DATA"I don't know, why we're still here. Those Rebels are long gone."
DATA"That thing about Alderaan, that was no good if ya ask me."
DATA"I'm just a pilot, fuck your political crap!"
DATA"We need more Walkers if we are to patrol this lump of ice properly."
DATA"You're the pilot, I'm just a ground technican."
DATA"Have you met Dr. Baumi on Tattooine ? He's the BEST !"
DATA"When I was young,..."
DATA"A long time ago in a galaxy far, far away..."
DATA"You heard the story 'bout H„nsel and Gretel ?"
DATA"Palpatine is mad, not attacking the Rebel fleet !"
DATA"Have you ever met an Interrogation droid ? No ? That's why you still talk this way."
a = INT(RND * 18) + 1
RESTORE cantina
FOR i = 1 TO a
READ a$: NEXT i
COLOR 2: PRINT a$
IF INSTR(a$, "ullust") <> 0 AND mis3 = 0 THEN mis3 = -1: COLOR 4: PRINT "What was that about Sullust ?"
mm:
COLOR 14: PRINT : PRINT "1.Leave": COLOR 7
PRINT "2.Order Food and Drinks"
PRINT "3.Talk to someone"
PRINT : PRINT "U.Use Item"
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO order
IF a$ = "3" THEN GOTO talk
IF a$ = "u" OR a$ = "U" THEN GOTO bantha
GOTO cantina
order:
PRINT : PRINT "You get your food. It is NO Bantha-steak...unfortunately": GOSUB schleife: GOTO cantina
talk:
DATA"I would prefer better food."
DATA"My morale is low as long as I can't get a good old McBantha."
DATA"I would fly much better if I could get better food."
DATA"I am a Tie-pilot"
DATA"My fighter is Tie-Beta 2"
DATA"Maybe I should leave now."
DATA"Strange, I've never seen you before."
DATA"This base is as unnessesary as this whole planet."
a = INT(RND * 8) + 1
RESTORE talk
PRINT "The guy next to you says:";
FOR i = 1 TO a: READ a$: NEXT i
COLOR 2: PRINT a$
GOSUB schleife: GOTO cantina
bantha:
bs = -1: GOSUB item: bs = 0
IF item$(a) = "Bantha Steak" THEN GOTO steak
PRINT "Of no use here.": GOSUB schleife: GOTO cantina
steak:
PRINT "As you offer the steak to the frustrated pilot, his eyes open wide:"
COLOR 2: PRINT "I'll give you everything for this steak !!!!"
uu = 0: FOR i = 1 TO 10
IF item$(i) = "Medical Pass" THEN uu = 1
NEXT i
IF uu = 0 THEN it$ = "Medical Pass" ELSE GOSUB tja
PRINT "I offer a "; : PRINT it$: COLOR 7
PRINT "Accept (y/n) ?"
burp:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO cantina
IF a$ = "y" OR a$ = "Y" THEN SWAP item$(a), it$: COLOR 2: PRINT "Thanks !"; : COLOR 7: PRINT " He swallows the Steak and burps.": GOTO burpburp
GOTO burp
burpburp:
COLOR 7: PRINT "Several others watch the hungry soldier swallow his Bantha-Steak. Sheer envy"
PRINT "is written across their faces as they eat their NOT-AT-ALL-Mc-Banthas..."
GOSUB schleife: GOTO cantina
tja:
RANDOMIZE TIMER
b = INT(RND * 7) + 1
IF b = 1 THEN it$ = "Blast vest"
IF b = 2 THEN it$ = "Glowrod"
IF b = 3 THEN it$ = "Blaster Rifle"
IF b = 4 THEN it$ = "Blaster Pistol"
IF b = 5 THEN it$ = "Blast armor"
IF b = 6 THEN it$ = "Holodisk"
IF b = 7 THEN it$ = "Datapad"
RETURN

medical:
CLS : COLOR 7
PRINT "You enter a medical center. A black droid looks at you and asks with a"
PRINT "mechanical voice:"; : COLOR 2: PRINT "'Insert medical pass into computer.'"
COLOR 7: PRINT "A computer sits on a desk nearby."
PRINT : COLOR 14
PRINT "1.Leave": COLOR 7
PRINT "2.Insert card"
PRINT "Your Command ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "1" THEN GOTO routine
IF a$ = "2" THEN GOTO medic
GOTO medical
medic:
uu = 0: FOR i = 1 TO 10
IF item$(i) = "Medical Pass" THEN uu = 1
NEXT i
IF uu = 0 THEN COLOR 4: PRINT "WHAT do you want to insert ????": GOSUB schleife: GOTO medical
IF lost > 0 THEN haha = lost: lost = 0: GOSUB verwundet: PRINT "The card jumps back out and the droid cures your wounds.": GOSUB schleife: GOTO medical
COLOR 2: PRINT "'You are not wounded, sir. Do you want to attend medical courses ?'"
quester:
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "n" OR a$ = "N" THEN GOTO medical
IF a$ = "y" OR a$ = "Y" THEN GOTO course
GOTO quester
course:
IF skill(74) = 2 THEN GOTO okok ELSE GOTO nene
nene:
IF skill(74) < 2 THEN PRINT "Sorry, but you don't know enough to be taught.": GOSUB schleife: GOTO medical
IF skill(74) > 2 THEN PRINT "I'm afraid you know more than I can teach you.": GOSUB schleife: GOTO medical
okok:
skill(74) = 3: skill(71) = skill(71) + 1
COLOR 7: PRINT "You are taught about Physiology ,Xenopathology and Cyberradiology."
GOSUB schleife: GOTO medical

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
IF bs = -1 THEN RETURN
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
IF bs = -1 THEN RETURN
IF use = 1 OR use = 2 OR use = 58 OR use = 22 THEN combat$ = "impfight": GOSUB saver: RUN "fight.sw"
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

