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

	method primerNivel() {
		game.clear()
		nivel_uno.mostrarFondo()
		nivel_uno.mostrarPiso()
		nivel_uno.mostrarEscaleras()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisual(casper)
		casper.inicializar()
		keyboard.num(0).onPressDo({ self.gameOver()})
		self.definirControles()
		game.onTick(10, "Gravedad", {casper.gravedad()})
		var fantasma = new Enemigo(danio = 1, tipo = 2,  position = game.at(10, 24)) 
		fantasma.inicializar()
		game.addVisual(fantasma)
		game.onTick(500,"enemigo",{fantasma.mover(fantasma.movimiento().direccion())})
		var fantasma2 = new Enemigo(danio = 1, tipo = 3, position = game.at(30,29))
		fantasma2.inicializar()
		game.addVisual(fantasma2)
		//game.onTick(25,"enemigo",{fantasma2.mover(fantasma2.movimiento().direccion())})
		game.onTick(500,"Enemigo atacar",{fantasma.atacar(casper)})
	}

	method gameOver() {
		const gameOver = new FondoTablero(imagen = "gameover.png")
		game.clear()
		game.addVisual(gameOver)
		game.onTick(1500, "game over", { game.stop()})
	}

	method definirControles() {
		keyboard.num(1).onPressDo{ self.instrucciones()}
		keyboard.num(2).onPressDo{ game.stop()}
		keyboard.num(0).onPressDo{ self.gameOver()}
		keyboard.right().onPressDo({ casper.mover(derecha)})
		keyboard.left().onPressDo({ casper.mover(izquierda)})
		keyboard.up().onPressDo({ casper.mover(arribaEnEscalera)})
		keyboard.down().onPressDo({ casper.mover(abajoEnEscalera)})
		keyboard.space().onPressDo({ casper.saltar()})
		keyboard.a().onPressDo({ casper.agarrarLlave()})
	}
	method instrucciones(){
        game.clear()
        const tableroDeCarga = new FondoTablero(imagen = "instrucciones.png")
        game.addVisual(tableroDeCarga)

        game.schedule(1500, {self.primerNivel()})
    }

}

