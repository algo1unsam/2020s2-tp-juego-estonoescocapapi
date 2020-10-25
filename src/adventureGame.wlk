import wollok.game.*
import characters.*
import escenarios.*

object adventureGame {

	var nivel = 1

	method jugar() {
		self.configurarPantalla()
		self.configurarCursor()
		self.agregarPersonajes()
		self.definirControles()
		game.cellSize(15)
		piso.mostrarPiso()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisualCharacter(casper)
		casper.mostrarVida()
		game.start()
	}

	method configurarPantalla() {
		game.title("Adventure Game")
		game.width(50)
		game.height(35)
		game.boardGround("fondo_" + nivel + ".png")
	}

	method configurarCursor() {
	// game.addVisualCharacter(cursor)
	// game.whenCollideDo(cursor,{personaje => cursor.seleccionarHeroe(personaje)})
	}

	method agregarPersonajes() {
	// game.addVisual(ironMan)
	// game.addVisual(hulk)
	// game.addVisual(capitanAmerica)
	// game.addVisual(thor)
	// game.addVisual(escudito)
	// game.addVisual(escudoSimple)
	// game.addVisual(wakanda)
	// game.addVisual(cacerola)
	}

	method definirControles() {
		keyboard.s().onPressDo{ casper.sacarVida(5)}
	// keyboard.r().onPressDo {cursor.reforzarHeroe() }
	// keyboard.a().onPressDo {wakanda.esAtacada(cursor.heroeElegido())}
	// keyboard.s().onPressDo {wakanda.situacion()}
	// keyboard.num(1).onPressDo { capitanAmerica.cambiarEscudo(escudito)}
	// keyboard.num(2).onPressDo { capitanAmerica.cambiarEscudo(escudoSimple)}
	// keyboard.num(3).onPressDo { capitanAmerica.cambiarEscudo(cacerola)}
	}

	method perder() {
		game.stop()
	}

}


