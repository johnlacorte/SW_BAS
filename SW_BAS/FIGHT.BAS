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
REM Gegner...Bezeichnung,Waffe,Schaden,Hitchance,strength+armor,item
REM Opponent...ID, Weapon, Damage
REM schleife is just press a key to continue
IF planet$ <> "Kosma" THEN GOTO gegnertat
COLOR 7: PRINT "The man with the red scarf explains: "; : COLOR 2: PRINT "The fight lasts until one of"
PRINT "you surrenders ! You will fight with your bare hands, weapons are not allowed.": COLOR 7
PRINT "The crowd yowls as you enter the ring together with your enemy...": GOSUB schleife
baumi$ = weap$: baumi = dam
dam = stat(5): weap$ = "Fists"

REM *JL this looks like enemy lists for plantets, there are more below in if statements and cond is set below when they are loaded
REM *JL some of these have their item$ changed to allow different items to be dropped
REM IG-88 can shoot down grenades
REM speaking of grenades, it looks like if they are carrying one they a 1 in 6 chance of throwing it, that might be too much
gegnertat:
DATA "Sandtrooper","Blaster Rifle",6,3,3,"Macrobinoculars"
DATA"Stormtrooper","Blaster Rifle",6,3,3,"Frag Grenade"
DATA"Tusken Raider","Vibro Axe",7,4,3,""
DATA"Jawa","Hold-out Blaster",3,3,1,"Droid parts"
DATA"Bantha","Bantha horn",7,3,8,"Bantha Steak"
DATA"Smuggler","Heavy Blaster",5,3,3,""
DATA"Bounty Hunter","Blaster Rifle",6,4,4,"Thermal Detonator"
DATA"Drunkard","Fists",3,3,2,""
DATA"Rebel-leader","Blaster Rifle",6,4,4,"Thermal Detonator"
DATA"Rebel-soldier","Blaster Rifle",6,3,3,"Macrobinoculars"
DATA"Rancor","Claws",10,4,7,""
DATA"Gamorrean","Vibro Axe",7,5,4,""
DATA"IG-88","Concussion Grenade Launcher",7,7,5,"Blast armor"
DATA"Thief","modified Hold-out Blaster",4,3,2,"Blaster parts"

REM the controllers stop combat there needs to be that way to exit combat
gegnerbes:
DATA"Wing-guard","Blaster Pistol",4,4,3,"Comlink"
DATA"Cyborg-guard","Blaster Rifle",6,5,4,"Cyborg head"
DATA"Ugnaught","Hold-out Blaster",3,2,3,"Datapad"
DATA"Assassin-droid","Blaster Rifle",6,5,5,"Frag Grenade"
DATA"Lobot","SC-75 Rifle",8,10,4,"Cyborg-controller"
DATA"Ugnaught-king","modified Blaster Rifle",7,5,4,"Lobot-controller"
DATA"Angry guy","Fists",4,7,3,"Bruce-Lee-manual"

gegnerhoth:
DATA"Stormtrooper","Blaster Rifle",6,4,3,"Glowrod"
DATA"Snowtrooper","Blaster Rifle",6,5,5,"Frag Grenade"
DATA"Wampa","Claws",8,5,7,""
DATA"Probe-droid","Blaster Cannon",9,5,4,""
DATA"Scout","Blaster Rifle",6,4,5,"Glowrod"
DATA"Army Trooper","Blaster Rifle",6,7,2,"Glowrod"
DATA"Scout Walker","Blaster Cannon",13,4,12,""

REM Boba Fett can shoot down grenades and cant be run from
gegnerord:
DATA"Cop","Blaster Rifle",6,6,4,"Blast vest"
DATA"Bounty Hunter","Blaster Rifle",6,5,4,"Frag Grenade"
DATA"Sabre-Tiger","Claws",7,6,3,""
DATA"Rogue","Blaster Pistol",4,6,3,""
DATA"Thief","Blaster Pistol",4,5,3,""
DATA"Tiger","Claws",5,5,3,""
DATA"T-Rex","Claws",10,5,8,"T-Rex Steak"
DATA"Boba Fett","modified Blaster Rifle",7,8,7,"damaged Battle suit"
DATA"Cheyenne","modified Blaster Rifle",7,7,4,"Blast vest"
DATA"Elite-thug","Blaster Rifle",6,6,4,"Blast vest"
DATA"Glibba","Claws",6,4,7,"Treaty with Boba Fett"

gegnercal:
DATA"Mon Cal-guard","Blaster Rifle",6,4,3,""

gegnermin:
DATA"mutant Taurus","Claws",8,4,5,""
DATA"mutant Taura","Claws",7,5,4,""
DATA"Mutant","Claws",6,4,3,""
DATA"Sandrat","Bite",3,3,2,""
DATA"huge Reptile","Claws",7,4,4,""
DATA"Taurus Bull","Claws",9,5,6,"Picture of Cow"

REM lightsabers can parry blasters
gegnerdag:
DATA"huge Reptile","Claws",7,4,4,""
DATA"giant Eagle","Claws",6,5,4,""
DATA"BoaConstrictor","Bite",8,4,6,""
DATA"giant Turtle","Claws",5,5,8,""
DATA"Orang-Utan","Claws",6,5,4,""
DATA"giant Hawk","Claws",7,7,4,""
DATA"huge Insect","Bite",5,4,2,""
DATA"Swamp Thing","Claws",8,5,6,"Swamp Thing"
DATA"Skywalker","Lightsaber",10,10,4,""

gegnerkos:
DATA"Clawbacca","Claws",6,7,5,""
DATA"Naroug","Fists",4,5,3,""
DATA"ZV-22","Fists",5,4,7,""
DATA"Amaiza","Fists",4,7,4,""
DATA"Valance","Fists",3,3,2,""
DATA"Jax","Fists",4,5,4,""
DATA"Visitor","Fists",1,1,1,""

endorgut:
DATA"Stormtrooper","Blaster Rifle",6,4,4,"Frag Grenade"
DATA"Scout","Blaster Rifle",6,5,5,"Frag Grenade"
DATA"Wolf","Claws",5,8,5,""
DATA"Dark Ewok","Claws",7,8,6,""
DATA"Probe-droid","Blaster Cannon",9,7,6,""
DATA"Army Trooper","Blaster Rifle",6,6,3,""

endorboes:
DATA"Ewok","Claws",4,7,4,""
DATA"Rebel Commando","modified Blaster Rifle",7,8,7,"Thermal Detonator"
DATA"Rebel Trooper","Blaster Rifle",6,6,5,"Blast vest"
DATA"Rebel","Blaster Rifle",6,5,4,""
DATA"Wolf","Claws",5,8,5,""
DATA"Reptile","Claws",6,6,6,""

REM *JL looks like o is the number of items to load from data a seems to be one choice from data
RANDOMIZE TIMER
IF planet$ = "Endor" THEN o = 6
IF planet$ = "Calamari" THEN o = 1
IF planet$ = "Ord Mantell" THEN o = 7
IF planet$ = "Hoth" THEN o = 7
IF planet$ = "Tattooine" THEN o = 7
IF planet$ = "Bespin" THEN o = 4
IF planet$ = "Minos IV" THEN o = 5
IF planet$ = "Dagobah" THEN o = 8
IF planet$ = "Kosma" THEN o = 7
a = INT(RND * o) + 1
REM *JL looks like picking a random from the list and checking if 
IF combat$ = "dummy" THEN a = 9
IF combat$ = "bulls" THEN a = 6
IF combat$ = "revglib" THEN a = 11
IF combat$ = "glibfight" THEN a = 10
IF combat$ = "glibthug" THEN a = 9
IF combat$ = "bobafett" THEN a = 8
IF combat$ = "cops" THEN a = 1
IF combat$ = "revenge" THEN a = 7
IF combat$ = "wampa" THEN a = 3
IF combat$ = "troops" THEN a = 6
IF combat$ = "guards" THEN a = 1
IF combat$ = "ugnaut" THEN a = 6
IF combat$ = "lobot" THEN a = 5
IF combat$ = "thief" THEN a = 14
IF combat$ = "ig88" THEN a = 13
IF combat$ = "rancor" THEN a = 11
IF combat$ = "jabfight" THEN a = 12
IF combat$ = "rebelguard" THEN a = 10
IF combat$ = "rebfight" THEN a = 9
IF combat$ = "impfight" THEN a = 2
IF combat$ = "barfight" AND a < 4 THEN a = 6: GOTO weiter
IF combat$ = "barfight" AND a >= 4 THEN a = 8: GOTO weiter
IF combat$ = "barfight" THEN a = 8
weiter:
IF planet$ = "Tattooine" THEN RESTORE gegnertat
IF planet$ = "Bespin" THEN RESTORE gegnerbes
IF planet$ = "Hoth" THEN RESTORE gegnerhoth
IF planet$ = "Ord Mantell" THEN RESTORE gegnerord
IF planet$ = "Calamari" THEN RESTORE gegnercal
IF planet$ = "Minos IV" THEN RESTORE gegnermin
IF planet$ = "Dagobah" THEN RESTORE gegnerdag
IF planet$ = "Kosma" THEN RESTORE gegnerkos
IF planet$ = "Endor" AND mis9 < 0 THEN RESTORE endorboes
IF planet$ = "Endor" AND mis9 = 0 THEN RESTORE endorgut
FOR i = 1 TO a: READ geg$, waf$, scha, dice, stark, it$
NEXT i
IF planet$ = "Tattooine" THEN GOTO tattooine
IF planet$ = "Bespin" THEN GOTO bespin
IF planet$ = "Hoth" THEN GOTO hoth
IF planet$ = "Ord Mantell" THEN GOTO ordmantell
IF planet$ = "Calamari" THEN GOTO calamari
IF planet$ = "Minos IV" THEN GOTO minos
IF planet$ = "Dagobah" THEN GOTO dagobah:
IF planet$ = "Kosma" THEN GOTO kosma
IF planet$ = "Endor" THEN GOTO endor

kosma:
RESTORE gegnerkos
geg = 1
kosmagegner:
READ geg$, waf$, scha, dice, stark, it$
IF geg$ <> combat$ THEN GOTO kosmagegner
geg$(1) = geg$: waf$(1) = waf$: scha(1) = scha: dice(1) = dice: stark(1) = stark: it$(1) = ""
cond(1) = 4
IF geg$(1) = "Visitor" THEN RANDOMIZE TIMER: dice(1) = INT(RND * 5) + 1: RANDOMIZE TIMER: scha(1) = INT(RND * 4) + 1: stark(1) = scha(1)
GOTO wei

calamari:
geg = 5
FOR i = 1 TO 5
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
NEXT i
GOTO wei

endor:
geg = INT(RND * 5) + 1
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 5
IF geg$(i) = "Probe-droid" THEN cond(i) = 8
NEXT i
IF combat$ = "finalegut" THEN GOTO finalegut
IF combat$ = "finalebîs" THEN GOTO finaleboes ELSE GOTO wei
finaleboes:
geg = 5
geg$(1) = "Skywalker": waf$(1) = "Lightsaber": scha(1) = 10: dice(1) = 10: stark(1) = 6: it$(1) = "Skywalker's head"
geg$(2) = "Han Solo": waf$(2) = "modified Heavy Blaster": scha(2) = 7: dice(2) = 13: stark(2) = 6: it$(2) = "Solo's head"
geg$(3) = "Chewbacca": waf$(3) = "modified Bowcaster": scha(3) = 8: dice(3) = 9: stark(3) = 9: it$(3) = "Chewbacca's head"
geg$(4) = "Leia Organa": waf$(4) = "modified Blaster Rifle": scha(4) = 7: dice(4) = 7: stark(4) = 4: it$(4) = "Leia's head"
geg$(5) = "C3-P0": waf$(5) = "Claws": scha(5) = 2: dice(5) = 5: stark(5) = 2: it$(5) = "Droid parts"
FOR i = 1 TO 5: cond(i) = 6: NEXT i
GOTO wei
finalegut:
geg = 5
geg$(3) = "Emperor": waf$(3) = "Lightningbolts": scha(3) = 6: dice(3) = 10: stark(3) = 5: it$(3) = "": cond(3) = 9
geg$(4) = "Darth Vader": waf$(4) = "Lightsaber": scha(4) = 10: dice(4) = 10: stark(4) = 9: it$(4) = "": cond(4) = 8
geg$(1) = "Royal Guard": waf$(1) = "Vibro Axe": scha(1) = 6: dice(1) = 8: stark(1) = 5: it$(1) = "Frag Grenade": cond(1) = 4
geg$(2) = "Royal Guard": waf$(2) = "Vibro Axe": scha(2) = 6: dice(2) = 8: stark(2) = 5: it$(2) = "Frag Grenade": cond(2) = 4
geg$(5) = "Royal Guard": waf$(5) = "Vibro Axe": scha(5) = 6: dice(5) = 8: stark(5) = 5: it$(5) = "Frag Grenade": cond(5) = 4
GOTO wei

dagobah:
geg = INT(RND * 5) + 1
IF combat$ = "dummy" THEN geg = 1
IF combat$ = "self" THEN geg = 1
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 5
IF combat$ = "self" THEN geg$(i) = name$: waf$(i) = weap$: scha(i) = dam: dice(i) = stat(1) + 4: stark(i) = ac + stat(5): it$(i) = "": cond(i) = 6
NEXT i
GOTO wei

minos:
geg = INT(RND * 4) + 1
IF combat$ = "bulls" THEN geg = 1
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
NEXT i
IF combat$ = "" THEN GOTO wei
geg = 5
FOR i = 2 TO 5
geg$(i) = "mutant Bull": waf$(i) = waf$: scha(i) = 8: dice(i) = 5: stark(i) = 5
it$(i) = "": cond(i) = 4
NEXT i
GOTO wei

ordmantell:
geg = INT(RND * 5) + 1
IF combat$ = "revglib" THEN geg = 1
IF combat$ = "glibfight" THEN geg = 5
IF combat$ = "glibthug" THEN geg = 1
IF combat$ = "bobafett" THEN geg = 1
IF geg$ = "T-Rex" AND geg > 2 THEN geg = 2
IF combat$ = "cops" THEN geg = 5
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
IF geg$(i) = "Boba Fett" THEN cond(i) = 7
IF geg$(i) = "T-Rex" THEN cond(i) = 5
IF geg$(i) = "Glibba" THEN cond(i) = 5
IF geg$(i) = "Bounty Hunter" THEN sack = -1: GOSUB bounty
NEXT i
IF combat$ = "revglib" THEN GOTO revglib
IF combat$ = "glibthug" THEN GOTO glibthug ELSE GOTO wei
revglib:
geg = 5: FOR i = 2 TO 5
geg$(i) = "Elite-thug": waf$(i) = "modified Blaster Rifle": scha(i) = 7: dice(i) = 7: stark(i) = 5
it$(i) = "Blast armor": cond(i) = 4
NEXT i
GOTO wei
glibthug:
geg = 5: FOR i = 2 TO 5
geg$(i) = "Thug": waf$(i) = "modified Heavy Blaster": scha(i) = 6: dice(i) = 7: stark(i) = 4
it$(i) = "Blast vest": cond(i) = 4
NEXT i
GOTO wei

hoth:
IF a = 7 OR a = 3 OR a = 4 THEN geg = 1 ELSE geg = INT(RND * 5) + 1
IF combat$ = "troops" THEN geg = 5
IF combat$ = "wampa" THEN geg = 5: stark = stark + 1: dice = dice + 1
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
IF geg$(i) = "Scout Walker" THEN cond(i) = 8
IF geg$(i) = "Probe-droid" THEN cond(i) = 6
NEXT i
GOTO wei

bespin:
IF a = 5 THEN geg = 1 ELSE geg = INT(RND * 5) + 1
IF a = 6 THEN geg = 1
IF combat$ = "guards" THEN geg = 5
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
IF geg$(i) = "Lobot" THEN cond(i) = 6
NEXT i
IF combat$ = "ugnaut" THEN GOTO ugnaut ELSE GOTO wei
ugnaut:
geg = 5
FOR i = 2 TO 5
geg$(i) = "Ugnaught": waf$(i) = "Heavy Blaster": scha(i) = 5: dice(i) = 4: stark(i) = 3: cond(i) = 4
it$(i) = "Frag Grenade": NEXT i
wei:
GOTO bildaufbau

tattooine:
geg = 0
IF a = 14 THEN geg = 1
IF a = 13 THEN geg = 1
IF a = 12 THEN geg = 5
IF a = 11 THEN geg = 1
IF a = 5 THEN geg = 1
IF a = 9 OR a = 10 THEN geg = 5
IF geg = 0 THEN a = INT(RND * 4) + 2: geg = a
IF combat$ = "impfight" THEN geg = 5
FOR i = 1 TO geg
geg$(i) = geg$: waf$(i) = waf$: scha(i) = scha: dice(i) = dice: stark(i) = stark
it$(i) = it$: cond(i) = 4
IF geg$ = "Bounty Hunter" THEN GOTO bounty
IF geg$ = "Jawa" THEN GOTO jawa ELSE GOTO wtr
bounty:
o = INT(RND * 5) + 1
IF o = 1 THEN it$(i) = "Frag Grenade"
IF o = 2 THEN it$(i) = "modified Hold-out Blaster"
IF o = 3 THEN it$(i) = "Blast vest": stark(i) = stark(i) + 1
IF o = 4 THEN it$(i) = "Thermal Detonator"
IF sack = -1 THEN RETURN
GOTO wtr
jawa:
o = INT(RND * 4) + 1
IF o = 1 THEN it$(i) = "Blaster parts"
IF o = 2 THEN it$(i) = "Armor parts"
wtr:
NEXT i
IF geg$(1) = "Bantha" THEN geg = 2: geg$(2) = "Tusken Bantha Rider": waf$(2) = "Vibro Axe": scha(2) = 7: stark(2) = 4: dice(2) = 4: it$(2) = "": cond(2) = 4
IF a = 13 THEN cond(1) = 6
IF a = 13 THEN geg = 5: FOR i = 2 TO 5: geg$(i) = "Thug": waf$(i) = "Heavy Blaster": scha(i) = 5: dice(i) = 3: stark(i) = 3: it$(i) = "Frag Grenade": cond(i) = 4: NEXT i
GOTO bildaufbau

bildaufbau:
GOSUB grafiken
routine:
COLOR 7
LINE (0, 326)-(640, 420), 0, BF
LOCATE 23, 3
REM ----alle gegner tot?
a = 0: FOR i = 1 TO geg
IF geg$(i) = "R.I.P." THEN a = a + 1
NEXT i
IF a = geg THEN GOTO gewonnen
REM ------Spieler
dodge = 0: fulldodge = 0
PRINT "You can: 1.Attack": LOCATE 24, 3
PRINT "         2.Dodge": LOCATE 25, 3
PRINT "         3.Use an item": LOCATE 26, 3
IF planet$ = "Kosma" THEN PRINT "         4.Surrender": LOCATE 27, 3 ELSE PRINT "         4.Try to flee": LOCATE 27, 3
PRINT "         5.Full Dodge (no additional actions allowed.)"
LOCATE 23, 35: PRINT "0.Cancel": LOCATE 28, 3
IF lost > 0 THEN COLOR 4: PRINT "You are "; health$; ".";  ELSE GOTO brut
IF lost > 0 THEN PRINT " (-"; STR$(lost); "D)"
GOSUB schleife: LINE (0, 432)-(640, 480), 0, BF: LOCATE 28, 3
brut:
COLOR 2: INPUT "How many actions in this combat round"; aktionen
COLOR 7: IF aktionen < 1 OR aktionen > 10 THEN LOCATE 28, 3: GOTO brut
LINE (0, 432)-(640, 480), 0, BF
FOR o = 1 TO aktionen
frage:
olle = 0: FOR f = 1 TO geg
IF geg$(f) <> "R.I.P." THEN olle = olle + 1
NEXT f
IF (o - 1) + olle <= aktionen THEN COLOR 7 ELSE COLOR 0
LOCATE 24, 35: PRINT "6.All out attack"
LOCATE 28, 3: COLOR 7
PRINT "What shall be your"; STR$(o); : INPUT ". action"; a
IF a = 0 AND o = 1 THEN GOTO routine
IF a = 4 THEN GOTO flee
IF a = 3 THEN GOTO use
IF a = 2 THEN GOTO dodge
IF a = 1 THEN GOTO attack
IF a = 5 THEN GOTO fulldodge
IF a = 6 AND (o - 1) + olle <= aktionen THEN GOTO allout
GOTO frage
flee:
IF planet$ = "Kosma" THEN GOTO surrender
GOSUB loschen
IF aktionen > 1 THEN PRINT "You cannot plan more than one action AND try to flee!": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "revglib" THEN COLOR 2: PRINT "No chance. You are surrounded !": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "bobafett" THEN COLOR 2: PRINT "'Nobody escapes Fett !' with his Jetpack he follows you easily.": GOSUB schleife: GOTO weitrr
IF combat$ = "ugnaut" THEN COLOR 2: PRINT "The security door is closed !": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "rancor" THEN COLOR 2: PRINT "There is no escape where there is no exit.": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "ig88" THEN COLOR 2: PRINT "You know that, should you run, Jabba will send his men after YOU !": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "wampa" THEN COLOR 2: PRINT "Sorry, but the monsters are blocking your escape.": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "dummy" THEN COLOR 2: PRINT "There is no way out !": GOSUB schleife: GOSUB loschen: GOTO frage
IF combat$ = "self" THEN COLOR 2: PRINT "There is no way out !": GOSUB schleife: GOSUB loschen: GOTO frage
PRINT "You try to run away and...";
hochdex = 0
FOR a = 1 TO geg
dex = 0
IF geg$ <> "R.I.P." THEN dex = dice(a)
IF dex > hochdex THEN hochdex = dex
NEXT a
diff = hochdex
akt = skill(15)
GOSUB roll
lauf = rolled
akt = diff
GOSUB roll
COLOR 4
IF lauf >= rolled AND combat$ = "glibthug" THEN PRINT "succeed!": combat$ = "": CLS : COLOR 14: PRINT "You run from the tower.": GOSUB schleife: GOSUB saver: RUN "ordmap.bas"
IF lauf >= rolled THEN PRINT "succeed!": GOSUB schleife: GOTO ende
PRINT "fail ! You don't run fast enough."
GOSUB schleife: GOSUB loschen
GOTO weitrr

use:
IF planet$ = "Kosma" THEN GOSUB loschen: COLOR 4: PRINT "NO ITEMS ALLOWED IN THIS FIGHT !": GOSUB schleife: GOSUB loschen: GOTO frage
LINE (0, 326)-(640, 480), 0, BF
FOR i = 1 TO 4
LOCATE 24, i * 20 - 18: PRINT STR$(i); "."; LEFT$(item$(i), 15)
NEXT i
FOR i = 5 TO 8
a = i - 4
LOCATE 25, a * 20 - 18: PRINT STR$(i); "."; LEFT$(item$(i), 15)
NEXT i
LOCATE 26, 2: PRINT " 9."; LEFT$(item$(9), 15)
LOCATE 26, 22: PRINT "10."; LEFT$(item$(10), 15)
LOCATE 26, 62: PRINT " 0.Back"
nun:
INPUT "Which item"; a
IF a = 0 THEN GOSUB neuzeichnen: GOTO frage
IF a > 10 THEN a = 0
IF a < 1 OR a > 10 OR item$(a) = "" THEN a$ = "": GOSUB neuzeichnen: GOTO frage
GOSUB neuzeichnen: GOSUB loschen
IF INSTR(item$(a), "aster") <> 0 AND item$(a) <> "Blaster parts" THEN GOTO changweap
IF item$(a) = "modified Bowcaster" THEN GOTO changweap
IF item$(a) = "Vibro Axe" THEN GOTO changweap
IF INSTR(item$(a), "Blast ") <> 0 THEN GOTO changarm
IF item$(a) = "Frag Grenade" THEN item$(a) = "": op = 6: GOTO granate
IF item$(a) = "Thermal Detonator" THEN item$(a) = "": op = 10: GOTO granate
IF item$(a) = "Medpac" THEN item$(a) = "": GOTO heilen
IF item$(a) = "SC-75 Rifle" THEN GOTO changweap
IF item$(a) = "Cyborg-controller" THEN GOTO kontroll
IF item$(a) = "Lobot-controller" THEN GOTO lopott
IF item$(a) = "Lightsaber" THEN GOTO changweap
IF INSTR(item$(a), "Battle") <> 0 THEN GOTO changarm
PRINT "Of no use.": GOSUB schleife: GOSUB neuzeichnen: GOSUB loschen: GOTO weitrr
lopott:
GOSUB neuzeichnen: GOSUB loschen: COLOR 2
PRINT "You activate the Lobot-controller and "
IF geg$(1) = "Lobot" THEN geg$(1) = "R.I.P.": PRINT "    Lobot looks at you and says:"; : COLOR 2: PRINT "'What happened to me ?'": COLOR 7: PRINT "Lobot is back to normal again.": GOSUB schleife: lobot = -3: combat$ = "": GOSUB saver: RUN "cc.bas"
PRINT ; "nothing happens.": GOSUB schleife: GOSUB loschen: GOTO weitrr
kontroll:
GOSUB neuzeichnen: GOSUB loschen: COLOR 2
INPUT "Use on which enemy "; a: COLOR 7
IF a < 1 OR a > geg OR geg$(a) = "R.I.P." THEN GOTO kontroll
IF INSTR(geg$(a), "ybor") <> 0 THEN GOSUB loschen: geg$(a) = "R.I.P.": cond(a) = 0: PRINT "You turn him off.": GOSUB schleife: GOSUB loschen: GOTO weitrr
GOSUB loschen: PRINT "Of no use.": GOSUB schleife: GOSUB loschen: GOTO weitrr

changweap:
b = 0
GOSUB neuzeichnen: GOSUB loschen
COLOR 2: INPUT "Use this as your main weapon (y/n)"; a$
color7: IF a$ = "n" OR a$ = "N" THEN GOSUB neuzeichnen: GOSUB loschen: GOTO frage
IF a$ = "y" OR a$ = "Y" THEN SWAP weap$, item$(a): b = 1
IF item$(a) = "Fists" THEN item$(a) = ""
IF b = 0 THEN GOTO changweap
IF weap$ = "SC-75 Rifle" THEN dam = 8
IF INSTR(weap$, "Hold-out Blaster") <> 0 THEN dam = 3
IF INSTR(weap$, "Blaster Pistol") <> 0 THEN dam = 4
IF INSTR(weap$, "Heavy Blaster") <> 0 THEN dam = 5
IF INSTR(weap$, "Blaster Rifle") <> 0 THEN dam = 6
IF weap$ = "Lightsaber" THEN dam = 10
IF weap$ = "Vibro Axe" THEN dam = 3 + stat(5)
IF weap$ = "modified Bowcaster" THEN dam = 7
IF INSTR(weap$, "modified") <> 0 THEN dam = dam + 1
GOSUB loschen: GOTO weitrr
changarm:
GOSUB neuzeichnen: GOSUB loschen
b = 0
COLOR 2: INPUT "Use this as you main armor (y/n)"; a$
COLOR 7: IF a$ = "N" OR a$ = "n" THEN GOSUB neuzeichnen: GOSUB loschen: GOTO frage
IF a$ = "Y" OR a$ = "y" THEN SWAP ac$, item$(a): b = 1
IF item$(a) = "Nothing" THEN item$(a) = ""
IF b = 0 THEN GOTO changarm
IF INSTR(ac$, "Blast armor") <> 0 THEN ac = 2
IF INSTR(ac$, "Blast vest") <> 0 THEN ac = 1
IF INSTR(ac$, "Battle") <> 0 THEN ac = 4
IF INSTR(ac$, "damaged") <> 0 THEN ac = ac - 1
GOSUB loschen: GOTO weitrr
granate:
GOSUB neuzeichnen: GOSUB loschen
COLOR 2: PRINT "You throw your grenade and ";
IF geg$(2) = "Han Solo" OR geg$(1) = "Boba Fett" OR geg$(1) = "IG-88" OR geg$(1) = "Lobot" THEN GOTO shootdown ELSE GOTO upup
shootdown:
IF geg$(2) = "Han Solo" THEN auto = 2 ELSE auto = 1
akt = dice(auto) - 2: GOSUB roll
IF rolled > 22 THEN PRINT geg$(auto); " shoots it in midair.": GOSUB schleife: GOSUB loschen: GOTO weitrr
upup:
akt = skill(9)
IF aktionen > 1 THEN akt = akt - (aktionen - 1)
IF akt < 1 THEN akt = 1
IF op = 6 THEN diff = 13 ELSE diff = 19
IF combat$ = "troops" THEN diff = diff + 2
GOSUB roll
IF rolled < diff THEN PRINT "miss!": GOSUB schleife: GOSUB loschen: GOTO weitrr
COLOR 4: PRINT "HIT !": COLOR 7
GOSUB schleife
FOR p = 1 TO geg
IF geg$(p) = "R.I.P." THEN GOTO hallo
GOSUB loschen
akt = op
GOSUB roll
pop = rolled
akt = stark(p)
GOSUB roll
a = (4 - cond(p)) * 4
rolled = rolled + a
IF pop < rolled THEN PRINT geg$(p); " is unaffected.": GOTO hallo1
IF pop - 15 > rolled THEN PRINT geg$(p); " is blasted into tiny pieces.": geg$(p) = "R.I.P.": GOTO hallo1
IF pop - 4 > rolled THEN PRINT geg$(p); " is wounded.": cond(p) = cond(p) - 2: dice(p) = dice(p) - 1: stark(p) = stark(p) - 1: GOTO hallo1
IF pop >= rolled THEN PRINT geg$(p); " is scratched by a few splinters.": cond(p) = cond(p) - 1: dice(p) = dice(p) - 1: GOTO hallo1
hallo1:
GOSUB schleife
IF stark(p) < 0 THEN stark(p) = 0
IF dice(p) < 0 THEN dice(p) = 0
hallo:
NEXT p
GOSUB loschen: GOTO weitrr

dodge:
GOSUB loschen
IF dodge > 0 THEN PRINT "You have already dodged this round !!!": GOSUB schleife: GOSUB loschen: GOTO frage
akt = skill(7)
IF aktionen > 1 THEN akt = akt - (aktionen - 1)
IF akt < 1 THEN akt = 1
GOSUB roll
dodge = rolled
IF dodge = 0 THEN dodge = 1
PRINT "    You dodge out of the way.": GOSUB schleife: GOSUB loschen: GOTO weitrr

allout:
o = o - 1: GOSUB loschen
FOR p = 1 TO geg
IF geg$(p) = "R.I.P." THEN GOTO weigersdorfer
o = o + 1: penner = -1: GOSUB penner
GOSUB schleife: GOSUB loschen
weigersdorfer:
penner = 0
NEXT p
GOTO weitrr

attack:
GOSUB loschen
p = 0: PRINT "Which enemy (1 -"; STR$(geg); : INPUT ")from left to right"; p
IF p = 0 THEN GOSUB loschen: GOTO frage
IF p > 10 THEN GOTO attack
IF p < 1 OR p > geg OR geg$(p) = "R.I.P." THEN GOTO attack
GOSUB loschen
penner:
IF INSTR(1, weap$, "laster") <> 0 THEN w = 1: akt = skill(2) ELSE w = 2: akt = skill(1)
IF weap$ = "SC-75 Rifle" THEN w = 1: akt = skill(8): RANDOMIZE TIMER: carl = INT(RND * 3) + 1
IF carl < 3 AND weap$ = "SC-75 Rifle" AND planet$ = "Endor" THEN COLOR 1: PRINT "Your mighty rifle jams !": GOTO hallo2
diff = 0
IF weap$ = "modified Bowcaster" THEN w = 1: akt = skill(4)
IF weap$ = "Fists" THEN w = 2: akt = skill(58)
IF weap$ = "Lightsaber" THEN w = 2: akt = skill(10): diff = 20
IF weap$ = "SC-75 Rifle" THEN diff = 19
IF INSTR(weap$, "Blaster Rifle") <> 0 THEN diff = 10
IF weap$ = "Vibro Axe" THEN diff = 17
IF diff = 0 THEN diff = 12
IF combat$ = "troops" THEN diff = diff + 12
IF aktionen > 1 THEN akt = akt - (aktionen - 1)
IF akt < 1 THEN akt = 1
GOSUB roll: COLOR 2
IF w = 1 THEN PRINT "You shoot the "; geg$(p); " and "; : COLOR 2 ELSE PRINT "You swing at the "; geg$(p); " and "; : COLOR 2
IF weap$ <> "Lightsaber" THEN GOTO salmon
IF rolled + 10 < diff THEN COLOR 4: PRINT "injure yourself with the Lightsaber !" ELSE GOTO salmon
akt = 10: GOSUB roll
hit = rolled: akt = stat(5) + ac: GOSUB roll
GOSUB schleife: GOSUB loschen
REM *JL heres some stuff on how attacks damage you
IF rolled > hit THEN COLOR 2: PRINT "  Luckily you are not wounded !": GOSUB schleife: IF penner = -1 THEN RETURN ELSE GOSUB loschen: GOTO weitrr
COLOR 4: IF hit - 16 > rolled THEN PRINT "You are killed outright.": GOSUB schleife: RUN "starwars.bas"
IF hit - 14 > rolled THEN PRINT "You are mortally wounded!": lost = lost + 3: GOSUB verwundet: GOTO upsala
IF hit - 12 > rolled THEN PRINT "You are seriously wounded!": lost = lost + 2: GOSUB verwundet: GOTO upsala
IF hit >= rolled THEN PRINT "You are wounded!": lost = lost + 1: GOSUB verwundet: GOTO upsala
upsala:
IF penner = -1 THEN RETURN
GOSUB schleife
GOSUB loschen: GOTO weitrr
salmon:
IF rolled < diff THEN PRINT "miss.": GOSUB schleife: GOSUB loschen: GOTO dumpf
COLOR 4: PRINT "hit !!!": pups = rolled
GOSUB schleife: GOSUB loschen
hugo = 0: IF waf$(p) = "Lightsaber" OR waf$(p) = "Claws" OR waf$(p) = "Fists" OR waf$(p) = "Bantha horn" OR waf$(p) = "Vibro Axe" THEN hugo = 1
IF weap$ = "Lightsaber" AND waf$(p) <> "Lightsaber" THEN hugo = 0
IF hugo = 1 AND (weap$ = "Vibro Axe" OR weap$ = "Fists" OR weap$ = "Lightsaber") THEN akt = dice(p) ELSE GOTO purr
GOSUB roll
IF pups < rolled THEN COLOR 7: PRINT "The "; geg$(p); " parries your blow !": IF penner = -1 THEN RETURN ELSE GOSUB schleife: GOSUB loschen: GOTO weitrr
purr:
IF waf$(p) = "Lightsaber" AND INSTR(weap$, "laster") <> 0 THEN akt = dice(p) ELSE GOTO pursl
GOSUB roll
IF pups < rolled THEN COLOR 7: PRINT geg$(p); " parries your shot with the Lightsaber.": IF penner = -1 THEN RETURN ELSE GOSUB schleife: GOSUB loschen: GOTO weitrr
pursl:
akt = stark(p)
GOSUB roll
op = rolled
akt = dam
GOSUB roll
a = (4 - cond(p)) * 3
rolled = rolled + a
IF rolled < op THEN PRINT geg$(p); " is unaffected.": GOTO hallo2
IF rolled - 15 > op AND planet$ = "Kosma" THEN PRINT geg$(p); " surrenders !": GOSUB schleife: GOTO matee
IF rolled - 15 > op THEN PRINT geg$(p); " is killed.": geg$(p) = "R.I.P.": GOTO hallo2
IF rolled - 4 > op THEN PRINT geg$(p); " is wounded.": cond(p) = cond(p) - 2: dice(p) = dice(p) - 1: stark(p) = stark(p) - 1: GOTO hallo2
IF rolled >= op THEN PRINT geg$(p); " is barely scratched.": dice(p) = dice(p) - 1: cond(p) = cond(p) - 1: GOTO hallo2
hallo2:
IF dice(p) < 1 THEN dice(p) = 1
IF stark(p) < 1 THEN stark(p) = 1
IF penner = -1 THEN RETURN
GOSUB schleife: GOSUB loschen
GOTO weitrr
dumpf:
IF penner = 0 THEN GOTO weitrr ELSE RETURN weigersdorfer

surprise:
a = INT(RND * geg) + 1
cond(a) = cond(a) - 2: dice(a) = dice(a) - 1: stark(a) = stark(a) - 1
RETURN

fulldodge:
GOSUB loschen
IF aktionen > 1 THEN PRINT "Sorry, ordinary dodge ONLY because you chose more than 1 action.": GOSUB schleife: GOSUB loschen: GOTO frage
fulldodge = -1: GOTO dodge

weitrr:
LINE (0, 299)-(640, 270), 0, BF
LINE (0, 301)-(640, 324), 0, BF
FOR i = 1 TO geg
LOCATE 20, (i * 15) - 10
IF cond(i) >= 6 THEN COLOR 7
IF cond(i) = 5 THEN COLOR 7
IF cond(i) = 4 THEN COLOR 2
IF cond(i) = 3 THEN COLOR 14
IF cond(i) = 2 THEN COLOR 12
IF cond(i) <= 1 THEN COLOR 4
IF geg$(i) = "R.I.P." THEN COLOR 4
PRINT geg$(i)
NEXT i
COLOR 7
a = 0: FOR i = 1 TO geg
IF geg$(i) = "R.I.P." THEN a = a + 1
NEXT i
IF a = geg THEN o = aktionen
NEXT o
IF a = geg THEN GOTO gewonnen

REM -------Gegner
COLOR 7
FOR o = 1 TO geg
IF geg$(o) = "R.I.P." THEN GOTO jippi
GOSUB losch: burp = 1
IF dice(o) >= 6 THEN burp = dice(o) - 4: PRINT geg$(o); " choses to make"; burp; "attacks.": GOSUB schleife: GOSUB losch
FOR alex = 1 TO burp
GOSUB losch: COLOR 2
PRINT STR$(o); "."; geg$(o); " is attacking you with his ";
IF it$(o) = "Frag Grenade" OR it$(o) = "Thermal Detonator" THEN a = 6 ELSE a = 1
b = INT(RND * a) + 1
COLOR 4
IF b = 6 THEN PRINT it$(o) ELSE PRINT waf$(o)
GOSUB schleife
akt = dice(o) - (burp - 1)
GOSUB roll
REM -----difficulty to hit berechnen
diff = 0: sch = 0
IF it$(o) = "Frag Grenade" AND b = 6 THEN sch = 5: diff = 15: it$(o) = ""
IF it$(o) = "Thermal Detonator" AND b = 6 THEN sch = 10: diff = 22: it$(o) = ""
IF b = 6 THEN it$(o) = ""
IF waf$(o) = "Lightsaber" AND b < 6 THEN diff = 20
IF waf$(o) = "Vibro Axe" AND b < 6 THEN diff = 17
IF waf$(o) = "Blaster Rifle" THEN diff = 10
IF waf$(o) = "Claws" THEN diff = 18
IF waf$(o) = "SC-75" THEN diff = 19
IF diff = 0 THEN diff = 14
IF fulldodge = -1 THEN diff = diff + dodge
IF dodge > diff THEN diff = dodge
akt = dice(o): ah = b
expode = 0: GOSUB roll
IF rolled < diff THEN COLOR 2: PRINT "  But misses...": GOSUB schleife: GOSUB losch: GOTO weitrrr
IF ah = 6 THEN COLOR 4: PRINT "  It explodes near you.  "; : expode = 1 ELSE COLOR 4: PRINT "  And hits you.  ";
hugo = 0: IF waf$(o) = "Bite" OR waf$(o) = "Lightsaber" OR waf$(o) = "Fists" OR waf$(o) = "Claws" OR waf$(o) = "Vibro Axe" OR waf$(o) = "Bantha horn" THEN hugo = -1
IF expode = 1 THEN hugo = 0
IF weap$ = "Lightsaber" AND INSTR(waf$(o), "aster") <> 0 AND expode = 0 THEN akt = skill(10) ELSE GOTO popspops
IF aktionen > 1 THEN akt = akt - (aktionen - 1)
IF akt < 1 THEN akt = 1
pups = rolled: GOSUB roll
IF pups < rolled THEN COLOR 2: PRINT "You parry the Blaster bolt with your Lightsaber !": GOSUB schleife: GOTO weitrrr
popspops:
IF (weap$ = "Lightsaber" OR weap$ = "Vibro Axe" OR weap$ = "Fists") AND hugo = -1 THEN akt = skill(12) ELSE GOTO pops
IF weap$ = "Fists" THEN akt = skill(6)
IF weap$ = "Lightsaber" THEN akt = skill(10)
rolled = pups: IF aktionen > 1 THEN akt = akt - (aktionen - 1): IF akt < 1 THEN akt = 1
GOSUB roll
IF pups < rolled THEN COLOR 2: PRINT "You parry the blow !": GOSUB schleife: GOSUB loschen: GOTO weitrrr

pops:
IF sch = 0 THEN sch = scha(o)
akt = sch
GOSUB roll
op = rolled + lost
akt = stat(5) + ac
GOSUB roll
haha = lost
IF op < rolled THEN COLOR 2: PRINT "Nothing happened to you.": GOSUB schleife: GOSUB losch: GOTO weitrrr
COLOR 4: IF op - 16 > rolled THEN PRINT "You are killed outright.": GOSUB schleife: RUN "starwars.bas"
IF op - 14 > rolled THEN PRINT "You are mortally wounded!": lost = lost + 3: GOSUB verwundet: GOTO ups
IF op - 12 > rolled THEN PRINT "You are seriously wounded!": lost = lost + 2: GOSUB verwundet: GOTO ups
IF op >= rolled THEN PRINT "You are wounded!": lost = lost + 1: GOSUB verwundet: GOTO ups
ups:
RANDOMIZE TIMER
aa = 0: a = INT(RND * 6) + 1
IF a = 1 THEN aa = INT(RND * 6) + 1
IF INSTR(ac$, "damaged") <> 0 OR ac$ = "" THEN aa = 0
IF aa = 6 THEN COLOR 14: PRINT "Your armor has been damaged !": ac = ac - 1: ac$ = "damaged " + ac$
GOSUB schleife
weitrrr:
GOSUB losch
NEXT alex
jippi:
GOSUB losch
NEXT o
GOTO routine
           
grafiken:
CLS
IF combat$ = "finalegut" THEN a$ = "Die, young " + name$ + " !"
IF combat$ = "finalebîs" THEN a$ = "So these wimps are the mighty rebel-champions ?"
IF combat$ = "Clawbacca" THEN a$ = "The mighty Wookie-champion roars at you !"
IF combat$ = "Naroug" THEN a$ = "Let the fight begin !"
IF combat$ = "ZV-22" THEN a$ = "This droid looks fucking dangerous !"
IF combat$ = "Amaiza" THEN a$ = "Let the battle commence !"
IF combat$ = "Valance" THEN a$ = "This chap does not look too dangerous !"
IF combat$ = "Jax" THEN a$ = "May the battle begin !"
IF combat$ = "Visitor" THEN a$ = "Two visitors fight each other ! May the better win !"
IF combat$ = "dummy" THEN a$ = "Is this really Skywalker ?"
IF combat$ = "self" THEN a$ = "That is YOU, you are attacking !"
IF combat$ = "bulls" THEN a$ = "These Tauri seem to think with their Triceps."
IF combat$ = "calfight" THEN a$ = "Angry Mon-Cals surround you."
IF combat$ = "surprise" THEN a$ = "You manage to hit once before you are noticed"
IF combat$ = "revglib" THEN a$ = "Glibba is still laughing."
IF combat$ = "glibfight" THEN a$ = "These guys mean business."
IF combat$ = "glibthug" THEN a$ = "The girl orders the thugs to attack."
IF combat$ = "bobafett" THEN a$ = "Boba Fett raises his Rifle to deliver a final shot."
IF combat$ = "cops" THEN a$ = "These cops seem to be braking their own law..."
IF combat$ = "revenge" THEN a$ = "'Nobody asked you to kill Lobot ! Now pay the price.'"
IF combat$ = "wampa" THEN a$ = "A horrific roar fills the cave as the Wampas attack."
IF combat$ = "troops" THEN a$ = "Well dug-in troops attack you !"
IF combat$ = "guards" THEN a$ = "Wing-guards answer the cyborgs shout."
IF combat$ = "lobot" THEN a$ = "Lobot raises an Assault-rifle."
IF combat$ = "ugnaut" THEN a$ = "The Security door slams shut behind you !"
IF combat$ = "thief" THEN a$ = "The boy fumbles with his blaster."
IF combat$ = "ig88" THEN a$ = "The Droid fires his grenade launcher."
IF combat$ = "jabfight" THEN a$ = "Those guards don't look harmless at all !"
IF combat$ = "rancor" THEN a$ = "Laughter starts and you hear trampling feet as people move in to watch."
IF combat$ = "rebelguard" THEN a$ = "The guards open fire !"
IF combat$ = "rebfight" THEN a$ = "Fiercly looking rebels seek revenge !"
IF combat$ = "" AND planet$ = "Endor" THEN a$ = "This moon seems to be crowded with attackers !"
IF combat$ = "" AND planet$ = "Hoth" THEN a$ = "Even on this ice-planet there is hostility !"
IF combat$ = "" AND planet$ = "Bespin" THEN a$ = "You are attacked !"
IF combat$ = "" AND planet$ = "Tattooine" THEN a$ = "Someone has waylaid you in the desert !!!"
IF combat$ = "" AND planet$ = "Ord Mantell" THEN a$ = "Someone brakes through the woods."
IF combat$ = "" AND planet$ = "Minos IV" THEN a$ = "You are attacked thanks to the miracle of atomic mutation."
IF combat$ = "" AND planet$ = "Dagobah" THEN a$ = "Scary sounds echo through the woods. Suddenly you are attacked !"
IF combat$ = "impfight" THEN a$ = "Suddenly blaster bolts flash all around you !!!"
IF combat$ = "barfight" THEN a$ = "These guys don't look as if they wanted to talk..."
IF combat$ = "surprise" THEN combat$ = "": GOSUB surprise
a = LEN(a$) / 2: LOCATE 15, 40 - a
COLOR 2: PRINT a$
DO WHILE INKEY$ = "": LOOP
FOR i = 1 TO geg
LOCATE 20, (i * 15) - 10
COLOR 2: IF cond(i) > 4 THEN COLOR 7
IF cond(i) < 4 THEN COLOR 12
PRINT geg$(i)
NEXT i
COLOR 7
LINE (0, 300)-(640, 300)
LINE (0, 325)-(640, 325)
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

REM -------warteschleife
schleife:
DO WHILE INKEY$ = "": LOOP
RETURN

REM -------ad bild
loschen:
LINE (0, 432)-(640, 480), 0, BF
LOCATE 28, 3: COLOR 7
RETURN

REM -------Kampf gewonnen!
gewonnen:
IF combat$ = "finalegut" THEN xp = xp + 25000
IF combat$ = "finalebîs" THEN xp = xp + 25000: mis20 = -1
IF combat$ = "dummy" THEN xp = xp + 2000
IF combat$ = "revglib" THEN xp = xp + 600
IF combat$ = "glibthug" THEN xp = xp + 200
IF combat$ = "bobafett" THEN xp = xp + 5000
IF combat$ = "wampa" THEN xp = xp + 600
IF combat$ = "ugnaut" THEN xp = xp + 1000
IF combat$ = "lobot" THEN xp = xp + 500: lobot = -2:
IF combat$ = "rancor" THEN jabba = -1
IF combat$ = "ig88" THEN jabba = -3: xp = xp + 3000
IF combat$ = "bulls" THEN xp = xp + 300: mis11 = -1
a = 0: COLOR 7
FOR i = 1 TO geg
IF waf$(i) <> "Lightningbolts" AND waf$(i) <> "" AND waf$(i) <> "Bite" AND waf$(i) <> "Blaster Cannon" AND waf$(i) <> "Fists" AND waf$(i) <> "Concussion Grenade Launcher" AND waf$(i) <> "Claws" THEN a = a + 1: a$(a) = waf$(i)
NEXT i
FOR i = 1 TO geg
IF it$(i) <> "" THEN a = a + 1: a$(a) = it$(i)
NEXT i
IF combat$ = "bobafett" THEN a$(3) = "Boba Fett's Head": a = a + 1
IF combat$ = "revglib" THEN a = a + 1: a$(a) = "Map of Ord Mantell"
gef = INT(RND * geg) + 1: gef = gef * 100: IF it$(1) = "Bantha Steak" OR waf$(1) = "Claws" OR waf$(1) = "Blaster Cannon" THEN gef = 0
IF combat$ = "thief" THEN gef = gef + 2000
IF waf$ = "Bite" OR waf$ = "Claws" THEN gef = 0
RANDOMIZE TIMER
IF gef > 0 THEN gef = INT(RND * gef) + 1
IF gef > 0 THEN COLOR 4: PRINT "You found"; gef; "credits !": cred = cred + gef: GOSUB schleife
ugalala:
COLOR 14
CLS : o = 0
IF a > 0 THEN COLOR 14: PRINT "You found something!"
COLOR 7
IF a > 0 THEN FOR i = 1 TO a: PRINT STR$(i); "."; a$(i): NEXT i
COLOR 14: b = 0
IF a > 0 THEN PRINT : INPUT "Take anything (0-No!) "; b
IF b = 0 THEN GOTO nein
IF b > 10 THEN GOTO ugalala
IF b < 1 OR b > a OR a$(b) = "" THEN GOTO ugalala
ovar = 0: PRINT "  --Your backpack--"
FOR i = 1 TO 10: PRINT STR$(i); "."; item$(i)
IF item$(i) = "" THEN ovar = i
NEXT i
IF ovar > 0 THEN SWAP item$(ovar), a$(b): GOTO ugalala
INPUT "Put it where "; c
IF c = 0 OR a$(b) = "" THEN GOTO ugalala
IF c < 1 OR c > 10 THEN GOTO ugalala
IF a$(b) = "" THEN GOTO ugalala
SWAP item$(c), a$(b): GOTO ugalala
nein:
CLS : COLOR 14
IF combat$ = "self" THEN PRINT "Gratulations, you killed yourself..."
IF combat$ = "dummy" THEN PRINT "I bet that was not the last you saw of Skywalker."
IF combat$ = "bulls" THEN PRINT "You hear a distant roar: MU !"
IF combat$ = "calfight" THEN PRINT "You quickly leave the area and hope that nobody saw what you did."
IF combat$ = "revglib" THEN PRINT "Hopefully Jabba will anticipate your efforts": mis4 = -4: jabba = -8
IF combat$ = "glibfight" THEN PRINT "Glibba's thugs seem to be more expensive than Jabba's."
IF combat$ = "glibthug" THEN PRINT "The way is now free for you to ascend to Glibba's audience-room.": mis4 = -1
IF combat$ = "bobafett" THEN PRINT "It looks as if 'The Return Of the Jedi' lied to us when it told us how Fett died...": jabba = -9
IF combat$ = "cops" THEN PRINT "As soon as the last cop has fallen, the next cops have arrived."
IF combat$ = "revenge" THEN PRINT "Wow, now that was a TOUGH fight."
IF combat$ = "wampa" THEN PRINT "Hopefully these were the only inhabitants of this cave !": mis1 = -2
IF combat$ = "troops" THEN PRINT "You are driven away from the trenches !"
IF combat$ = "thief" THEN PRINT "Some people look at you in disgust as the dead boy lies at your feet."
IF combat$ = "guards" THEN PRINT "You leave before the next wave of attackers arrives."
IF combat$ = "rebelguard" THEN file$ = "tatmap.bas": PRINT "Soon after you are driven away by more rebels !"
IF combat$ = "rebfight" THEN PRINT "So these sobs have survived to be killed by you now..."
IF combat$ = "ugnaut" THEN PRINT "Seems these Ugnaughts were driving Lobot crazy !"
IF combat$ = "lobot" AND lobot = -2 THEN PRINT "Now Lobot is NOT crazy any more !"
IF combat$ = "lobot" AND lobot > -2 THEN PRINT "Fortunately Lobot didn't follow you !"
IF combat$ = "ig88" THEN PRINT "Unfortunately IG-88's weapon is built-in and cannot be used anymore.": rancor = 120
IF combat$ = "rancor" THEN xp = xp + 1500: PRINT "As you ascend through the hole in the ceiling, back up to the throne room, the laughter is silenced."
IF combat$ = "barfight" THEN PRINT "People back up away from you, nobody looks at you. Before the barkeeper can call the Imperials, you rush out of the bar."
IF combat$ = "impfight" THEN xp = xp + 100: PRINT "Before the next patrol arrives, you are long gone."
IF combat$ = "jabfight" THEN PRINT "Jabba's Thugs look respectfully at you."
IF combat$ = "finalebîs" THEN PRINT "You managed to kill the rebel-leaders. This should disrupt their operations": PRINT "on this moon. Now go and report back to the Emperor on the Deathstar !"
IF combat$ = "finalegut" THEN PRINT "You killed the Emperor ! But now it's time to get out of here, before the ": PRINT "whole station explodes. You flee in the same shuttle that brought you": PRINT "here to the surface of Endor. You should report to the rebels soon !"
IF combat$ <> "" THEN GOSUB schleife
gef = INT(RND * geg) + 1
IF combat$ <> "wampa" THEN combat$ = ""
e = 0
IF geg = 1 THEN geg = 1: GOTO prdlwmpf
IF geg = 2 THEN geg = 3: GOTO prdlwmpf
IF geg = 3 THEN geg = 6: GOTO prdlwmpf
IF geg = 4 THEN geg = 9: GOTO prdlwmpf
IF geg = 5 THEN geg = 12: GOTO prdlwmpf
prdlwmpf:
IF o = 0 THEN xp = xp + geg * (stark + scha)
IF o = 0 THEN xp = xp + scha * 6
IF xp > 18000 THEN COLOR 2: PRINT "You have enough Experience to raise a stat !!!": e = 1
IF e = 0 AND xp > 1000 THEN COLOR 2: PRINT "You have enough Experience to raise a skill !": e = 1
IF e = 1 THEN INPUT "Accept (y/n)"; a$
IF e = 0 THEN GOSUB saver: RUN file$
IF a$ = "y" OR a$ = "Y" THEN GOSUB saver: RUN "adv.bas"
GOSUB saver: RUN file$


REM -------ZurÅck
ende:
IF combat$ <> "wampa" THEN combat$ = ""
o = 1
FOR i = 1 TO geg
IF geg$(i) = "R.I.P." THEN xp = xp + scha(i) * 6
NEXT i
GOTO nein

REM ----ad bild
neuzeichnen:
LOCATE 23, 3
LINE (0, 326)-(640, 480), 0, BF: COLOR 7
PRINT "You can: 1.Attack": LOCATE 24, 3
PRINT "         2.Dodge": LOCATE 25, 3
PRINT "         3.Use an item": LOCATE 26, 3
PRINT "         4.Try to flee": LOCATE 27, 3
PRINT "         5.Full Dodge (no additional actions allowed.)": LOCATE 28, 3
RETURN

REM ----ad bild
losch:
LINE (0, 326)-(640, 480), 0, BF
LOCATE 25, 2
COLOR 7
RETURN

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
GOSUB loschen
COLOR 4: IF lost <= 0 THEN PRINT "You are not wounded!!!!": COLOR 7: GOSUB schleife: GOSUB loschen: GOTO frage
diff = lost * 3
akt = skill(74) + skill(71)
IF aktionen > 1 THEN akt = akt - aktionen
IF akt < 1 THEN akt = 1
GOSUB roll
haha = lost
IF rolled > diff THEN lost = lost - 2: PRINT "The medpac did a good job there.": GOSUB schleife: GOSUB loschen: GOSUB verwundet: GOTO weitrr
COLOR 2: PRINT "The medpac did not help you."
GOSUB schleife: GOSUB loschen: GOTO weitrr

matee:
weap$ = baumi$: dam = baumi
CLS
COLOR 2: PRINT "'The winner is "; name$; " !!! "; : COLOR 7: PRINT "The crowd gives standing ovations."
cred = cred + 500: xp = xp + 250
PRINT "The man with the red scarf gives you 500 Credits."
COLOR 2: PRINT "So who will fight next in the arena ??? (...)"
e = 0: GOSUB schleife
IF xp > 18000 THEN COLOR 2: PRINT "You have enough Experience to raise a stat !!!": e = 1
IF e = 0 AND xp > 1000 THEN COLOR 2: PRINT "You have enough Experience to raise a skill !": e = 1
IF e = 1 THEN INPUT "Accept (y/n)"; a$
IF e = 0 THEN GOSUB saver: RUN "wh.bas"
IF a$ = "y" OR a$ = "Y" THEN GOSUB saver: RUN "adv.bas"
GOSUB saver: RUN "wh.bas"

surrender:
weap$ = baumi$: dam = baumi
CLS
COLOR 2: PRINT "'The winner is "; combat$; " !!!!": COLOR 7: PRINT ; " You are ignored."
COLOR 2: PRINT "So who dares to challenge "; combat$; " ? Who fights better than "; name$; " ?"
COLOR 7: GOSUB schleife: e = 0
IF xp > 18000 THEN COLOR 2: PRINT "You have enough Experience to raise a stat !!!": e = 1
IF e = 0 AND xp > 1000 THEN COLOR 2: PRINT "You have enough Experience to raise a skill !": e = 1
IF e = 1 THEN INPUT "Accept (y/n)"; a$
IF e = 0 THEN GOSUB saver: RUN "wh.bas"
IF a$ = "y" OR a$ = "Y" THEN GOSUB saver: RUN "adv.bas"
GOSUB saver: RUN "wh.bas"

