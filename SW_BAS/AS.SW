CLS : SCREEN 12: COLOR 15
daten:
DATA"Thanx:",9
DATA"Baumi's parents for making Baumi",15
DATA"Luke Skywalker for being blonde",15
DATA"Lrac for acting in this game",15
DATA"Wolfpack, for finding every single error",15
DATA"Paolo, for playtesting",15
DATA"Daniel, for the SSS Deathwing",15
DATA"Daniel, for the INSTALLER",15
DATA"and so on",15
DATA"This was in no way in order of priority !",15
DATA"Credits:",9
DATA"Graphics: Baumi",15
DATA"Sound: what ?",15
DATA"Story: Baumi and Anja and George Lucas",15
DATA"Win95 version: Pardon me ?",15
DATA"Star Wars II will feature:",9
DATA"brilliant up to date graphics",15
DATA"high end AWE32 Sound system",15
DATA"Win95 compatibility",15
DATA"the Schuldturm (finally)",15
DATA"3 CD's full of animated video",15
DATA"a 6 hour long dialogue with a dwarf",15
DATA"a chimera",15
DATA"To be continued...",9
DATA"Baumi-Soft thanks for playing Starwars",15
DATA"Ahem, THANK YOU",15
DATA"*",15
RESTORE daten
routine:
CLS
READ a$, col: IF a$ = "*" THEN GOTO ende
rout:
b = TIMER: IF col = 15 THEN b = b + .7
IF col = 9 THEN b = b + 1
a = LEN(a$) / 2: LOCATE 16, 40 - a
COLOR col: PRINT a$: IF col = 9 THEN col = 7
r2:
IF TIMER >= b + .8 THEN GOSUB cols ELSE GOTO r2
IF col = -1 THEN GOTO routine ELSE GOTO rout

cols:
IF col = 15 THEN col = 7: RETURN
IF col = 7 THEN col = 8: RETURN
IF col = 8 THEN col = 0: RETURN
IF col = 0 THEN col = -1: RETURN

ende:
COLOR 7: SCREEN 0: CLS : SYSTEM


