
import "CoreLibs/graphics"

--Dichiaro 2 varaibili locali, rispettivamente 'playerX da 200' e 'playerY da 120'
local playerX, playerY = 200, 120
local playerRadius = 10

--Questa funzione viene chiamata ogni il refresh dello schermo
--La console va a 30 FPS, quindi viene chiamata 30 volte al secondo
function playdate.update()
	playdate.graphics.fillCircleAtPoint(playerX, playerY, playerRadius)
end