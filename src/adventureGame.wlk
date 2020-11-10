import wollok.game.*
import characters.*
import escenarios.*
import movimientos.*
import niveles.*

object adventureGame {

	method jugar() {
		self.configurarPantalla()
		self.definirControles()
		game.cellSize(15)
		game.start()
	}

	method configurarPantalla() {
		game.title("Adventure Game")
		game.width(50)
		game.height(35)
		const tableroDeCarga = new FondoTablero(imagen = "fondo_carga.png")
		game.addVisual(tableroDeCarga)
	}

	method gameOver() {
		const gameOver = new FondoTablero(imagen = "gameover.png")
		game.clear()
		game.addVisual(gameOver)
		game.onTick(1500, "game over", { game.stop()})
		game.onTick(1500, "1", {self.jugar()})
	}

	method nivelCompleto() {
		const nivelCompleto = new FondoTablero(imagen = "nivel_completo.png")
		game.clear()
		game.addVisual(nivelCompleto)
		game.onTick(1500, "nivelCompleto", { game.stop()})
	}

	method definirControles() {
		keyboard.num(1).onPressDo{ self.instrucciones()}
		keyboard.num(2).onPressDo{ game.stop()}
		keyboard.num(0).onPressDo{ self.gameOver()}
	}

	method instrucciones() {
		game.clear()
		const tableroDeCarga = new FondoTablero(imagen = "instrucciones.png")
		game.addVisual(tableroDeCarga)
		game.schedule(1500, { nivel_uno.comenzar()})
	}

}

