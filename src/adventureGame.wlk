import wollok.game.*
import characters.*
import escenarios.*
import movimientos.*

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

	method nivel_uno() {
		const nivel_uno = new FondoTablero(imagen = "fondo_1.png")
		game.clear()
		game.addVisual(nivel_uno)
		piso.mostrarPiso()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisual(casper)
		casper.inicializar()
		keyboard.num(0).onPressDo({ self.gameOver()})
		self.definirControles()
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
		keyboard.right().onPressDo({casper.mover(derecha)})
		keyboard.left().onPressDo({casper.mover(izquierda)})
		keyboard.up().onPressDo({casper.mover(arriba)})
		keyboard.down().onPressDo({casper.mover(abajo)})
		keyboard.space().onPressDo({casper.saltar()})
		keyboard.a().onPressDo({casper.agarrarLlave()})
	}

}

class FondoTablero {

	const imagen

	method image() = imagen

	method position() = game.origin()

}

