
import "CoreLibs/graphics"

--Imposta in ogni file dove ti serve delle constanti locali che richiamano le librerie
--Questo incrementa le performance
local pd <const> = playdate
local gfx <const> = playdate.graphics

--Dichiaro 2 varaibili locali, rispettivamente 'playerX da 200' e 'playerY da 120'
local playerX, playerY = 200, 120
local playerRadius = 10
local playerSpeed = 1

--Questa funzione viene chiamata ogni il refresh dello schermo
--La console va a 30 FPS, quindi viene chiamata 30 volte al secondo
--Se la definizione di questa funzione non fosse presente, il gioco va in crash

function pd.update()
	gfx.clear()
	--la funzione 'getCrankPosition' ritorna angolo e gradi, ma la convertiamo in raggio
	local crackAngle = math.rad(pd.getCrankPosition())
	playerX += math.sin(crackAngle) * playerSpeed
	playerY -= math.cos(crackAngle) * playerSpeed
	gfx.fillCircleAtPoint(playerX, playerY, playerRadius)
end