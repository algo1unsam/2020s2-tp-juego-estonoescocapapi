import wollok.game.*
import characters.*
import escenarios.*

object adventureGame {

	var nivel = 0

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

	method nivel_uno() {
		const nivel_uno = new FondoTablero(imagen = "fondo_1.png")
		game.clear()
		game.addVisual(nivel_uno)
		piso.mostrarPiso()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisualCharacter(casper)
		casper.mostrarVida()
		keyboard.num(0).onPressDo{ self.gameOver()}
	}

	method gameOver() {
		const gameOver = new FondoTablero(imagen = "gameover.png")
		game.clear()
		game.addVisual(gameOver)
		game.onTick(1000, "fin", game.stop())
	}

	method definirControles() {
		keyboard.num(1).onPressDo{ self.nivel_uno()}
		keyboard.num(0).onPressDo{ self.gameOver()}
	}

}

class FondoTablero {

	const imagen

	method image() = imagen

	method position() = game.origin()

}

