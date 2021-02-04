SCREEN 12
COLOR 7
CLS : a$ = ""
LOCATE 12, 18: PRINT " Character Generation for Star Wars 2nd Ed."
DO WHILE a$ = ""
a$ = INKEY$
LOOP
CLS
DIM skill$(80), skill(80), cargo$(30)
REM   ---Skills auf Dexterity----
skill$(1) = "Archaic Weapons": skill$(2) = "Blaster": skill$(3) = "Blaster Artillery"
skill$(4) = "Bowcaster": skill$(5) = "Bows": skill$(6) = "Brawling Parry": skill$(7) = "Dodge"
skill$(8) = "Firearms": skill$(9) = "Grenade": skill$(10) = "Lightsaber": skill$(11) = "Melee Combat"
skill$(12) = "Melee Parry": skill$(13) = "Missile Weapons": skill$(14) = "Pick Pocket"
skill$(15) = "Running": skill$(16) = "Thrown Weapons": skill$(17) = "Vehicle Blasters"
REM   ---Skills auf Knowledge---
skill$(18) = "Alien Species": skill$(19) = "Bureaucracy": skill$(20) = "Business"
skill$(21) = "Cultures": skill$(22) = "Intimidation": skill$(23) = "Languages"
skill$(24) = "Law Enforcement": skill$(25) = "Planetary Systems": skill$(26) = "Streetwise"
skill$(27) = "Survival": skill$(28) = "Value": skill$(29) = "Willpower"
REM   ---Skills auf Mechanical---
skill$(30) = "Archaic Starship Piloting": skill$(31) = "Astrogation": skill$(32) = "Beast Riding"
skill$(33) = "Capital Ship Gunnery": skill$(34) = "Capital Ship Piloting": skill$(35) = "Capital Ship Shields"
skill$(36) = "Communications": skill$(37) = "Ground Vehicle Operation"
skill$(38) = "Hover Vehicle Operation": skill$(39) = "Powersuit Operation": skill$(40) = "Repulsorlift Operation"
skill$(41) = "Sensors": skill$(42) = "Space Transports": skill$(43) = "Starfighter Piloting"
skill$(44) = "Starship Gunnery": skill$(45) = "Starship Shields": skill$(46) = "Swoop Operation"
skill$(47) = "Walker Operation"
REM   ---Skills auf Perception---
skill$(48) = "Bargain": skill$(49) = "Command": skill$(50) = "Con": skill$(51) = "Forgery"
skill$(52) = "Gambling": skill$(53) = "Hide": skill$(54) = "Investigation"
skill$(55) = "Persuasion": skill$(56) = "Search": skill$(57) = "Sneak"
REM   ---Skills auf Strength---
skill$(58) = "Brawling": skill$(59) = "Climbing/Jumping": skill$(60) = "Lifting"
skill$(61) = "Stamina": skill$(62) = "Swimming"
REM   ---Skills auf Technical---
skill$(63) = "Armor Repair": skill$(64) = "Blaster Repair": skill$(65) = "Capital Starship Repair"
skill$(66) = "Capital Starship Weapon Repair": skill$(67) = "Computers"
skill$(68) = "Demolition": skill$(69) = "Droid Programming": skill$(70) = "Droid Repair"
skill$(71) = "First Aid": skill$(72) = "Ground Vehicle Repair": skill$(73) = "Hover Vehicle Repair"
skill$(74) = "Medicine": skill$(75) = "Repulsorlift Repair": skill$(76) = "Security"
skill$(77) = "Space Transports Repair": skill$(78) = "Starfighter Repair": skill$(79) = "Starship Weapon Repair"
skill$(80) = "Walker Repair"
REM   ---Neuer Charakter---
new:
d = 12: FOR i = 1 TO 6: stat(i) = 1: NEXT i
stat$(1) = "Dexterity": stat$(2) = "Knowledge": stat$(3) = "Mechanical"
stat$(4) = "Perception": stat$(5) = "Strength": stat$(6) = "Technical"
luup:
CLS
PRINT "You have"; d; "D left to put into stats"
FOR i = 1 TO 6
PRINT i; "."; stat$(i); stat(i); "D"
NEXT i
IF uv = 87 THEN uv = 0: COLOR 4: PRINT "Strength may not be raised beyond four !": COLOR 7
IF uv = 92 THEN uv = 0: COLOR 4: PRINT "You may not raise a stat beyond six !": COLOR 7
a = 0: INPUT "Which stat shall be improved by one D "; a
IF a < 1 OR a > 6 THEN BEEP: GOTO luup:
IF a = 5 AND stat(a) = 4 THEN BEEP: uv = 87: GOTO luup
IF stat(a) > 5 THEN BEEP: uv = 92: GOTO luup
d = d - 1: stat(a) = stat(a) + 1
IF d = 0 THEN GOTO luupend
GOTO luup
luupend:
CLS
PRINT "Now you can choose skills appropriate for your profession"
PRINT "(Simply make one up...it is not important)"
PRINT "You have got 8D to distribute (1 Bonus D for knowing Baumi)"
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
s = 1: d = 8
FOR i = 1 TO 17: skill(i) = skill(i) + stat(1): NEXT i
FOR i = 18 TO 29: skill(i) = skill(i) + stat(2): NEXT i
FOR i = 30 TO 47: skill(i) = skill(i) + stat(3): NEXT i
FOR i = 48 TO 57: skill(i) = skill(i) + stat(4): NEXT i
FOR i = 58 TO 62: skill(i) = skill(i) + stat(5): NEXT i
FOR i = 63 TO 80: skill(i) = skill(i) + stat(6): NEXT i
skill(10) = 0: skill(74) = 0
skills:
CLS
IF s = 7 THEN s = 1
IF s = 1 THEN an = 1: en = 17
IF s = 2 THEN an = 18: en = 29
IF s = 3 THEN an = 30: en = 47
IF s = 4 THEN an = 48: en = 57
IF s = 5 THEN an = 58: en = 62
IF s = 6 THEN an = 63: en = 80
LOCATE 1, 16: PRINT stat$(s); "-related skills:"
PRINT "Your "; stat$(s); " is"; stat(s); "D."
PRINT "You have got"; d; "D left."
FOR i = an TO en
PRINT i; "."; skill$(i); ":"; skill(i); "D"
NEXT i
PRINT an; "to"; en; "to improve a skill, Return to see next page"
IF uv = 27 THEN uv = 0: COLOR 4: PRINT "Lightsaber may not be improved at the beginning.": COLOR 7
IF uv = 83 THEN uv = 0: COLOR 4: PRINT "Medicine may not improved at the beginning. Try and select First Aid instead.": COLOR 7
INPUT "your command"; a
IF a = 0 THEN s = s + 1: GOTO skills
IF a = 10 THEN uv = 27: BEEP: GOTO skills
IF a = 74 THEN uv = 83: BEEP: GOTO skills
IF a < an OR a > en THEN BEEP: GOTO skills
d = d - 1: skill(a) = skill(a) + 1
IF d = 0 THEN GOTO endend ELSE GOTO skills
endend:
CLS
PRINT "A Character without a name is just a LULU so please..."
INPUT "By what name shallst thou be known"; name$
IF name$ = "" THEN name$ = "LULU"
IF name$ <> "LULU" THEN PRINT "Good Choice!" ELSE PRINT "Well, it seems that he is a LULU."
PRINT "You start off with a Blaster Pistol and 100 Credits."
DO WHILE INKEY$ = "": LOOP
PRINT "On a planet called Tattooine......"
DO WHILE INKEY$ = "": LOOP
PRINT "In Mos Eisley Spaceport..."
DO WHILE INKEY$ = "": LOOP
PRINT "In an ugly bar.."
a$ = "": DO WHILE a$ = ""
a$ = INKEY$
FOR i = 1 TO 30
IF i <= 5 THEN cargo$(i) = "Thermal Detonator" ELSE cargo$(i) = ""
NEXT i
LOOP: speed = 8: cannon = 5: status$ = "Okay": lobot = 0
CLS : time = 2000: planet$ = "Tattooine": x = 28: y = 11: glid = 0: health$ = "Okay"
cred = 100: weap$ = "Blaster Pistol": dam = 4: ac$ = "Nothing": ac = 0
file$ = "me.bas": rebel = 0: imper = 0: jabba = 0
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
REM ---------Save Game
savgam:
f$ = ""
COLOR 2: PRINT "Use which Slot (A-H) for this Game ?"
a$ = "": DO WHILE a$ = "": a$ = INKEY$: LOOP
IF a$ = "a" OR a$ = "A" THEN f$ = "a.bas"
IF a$ = "b" OR a$ = "B" THEN f$ = "b.bas"
IF a$ = "c" OR a$ = "C" THEN f$ = "c.bas"
IF a$ = "d" OR a$ = "D" THEN f$ = "d.bas"
IF a$ = "e" OR a$ = "E" THEN f$ = "e.bas"
IF a$ = "f" OR a$ = "F" THEN f$ = "f.bas"
IF a$ = "g" OR a$ = "G" THEN f$ = "g.bas"
IF a$ = "h" OR a$ = "H" THEN f$ = "h.bas"
IF f$ = "" THEN BEEP: GOTO savgam
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
PRINT
PRINT "Your Character has been saved. Hit a key to start the game."
a$ = ""
DO WHILE a$ = ""
a$ = INKEY$
LOOP
RUN "me.bas"







