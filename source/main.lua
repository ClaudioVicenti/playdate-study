
import "CoreLibs/graphics"

--Imposta in ogni file dove ti serve delle constanti locali che richiamano le librerie
--Questo incrementa le performance
local pd <const> = playdate
local gfx <const> = playdate.graphics

--Dichiaro 2 varaibili locali, rispettivamente 'playerX da 200' e 'playerY da 120'
local playerX, playerY = 200, 120
local playerRadius = 10
local playerSpeed = 3

--Questa funzione viene chiamata ogni il refresh dello schermo
--La console va a 30 FPS, quindi viene chiamata 30 volte al secondo
--Se la definizione di questa funzione non fosse presente, il gioco va in crash

local player = {}
player["X"] = 200
player["Y"] = 120
player["R"] = 10
player["S"] = 3
local crank = {}
crank["angle"] = 0
--crank["angleOld"] = 0

function pd.update()
	gfx.clear()
	--la funzione 'getCrankPosition' ritorna angolo e gradi, ma la convertiamo in raggio
	crank["angle"] = math.rad(pd.getCrankPosition())
	crank["change"], crank["acceleratedChange"] = pd.getCrankChange()
	local movement = 1
	if crank.change ~= 0 then
		if crank.change < 0 then
			movement = -1
		end
		crank.change = math.rad(crank.change)
		--player.X += math.sin(crankAngle)
		player.Y += math.cos(crank.change) * player.S * movement
	end
	--playerX += math.sin(crankAngle) * playerSpeed
	--playerY -= math.cos(crankAngle) * playerSpeed
	gfx.fillCircleAtPoint(player.X, player.Y, player.R)
end