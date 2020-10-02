import wollok.game.*

object adventureGame {

	var nivel = 1

	method jugar() {
		self.configurarPantalla()
		self.configurarCursor()
		self.agregarPersonajes()
		self.definirControles()
			// game.cellSize(80)
		piso.mostrarPiso()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisualCharacter(casper)
		casper.mostrarVida()
		game.start()
	;
	}

	method configurarPantalla() {
		game.title("Adventure Game")
		game.width(15)
		game.height(11)
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
	 keyboard.s().onPressDo {casper.sacarVida()}
	// keyboard.r().onPressDo {cursor.reforzarHeroe() }
	// keyboard.a().onPressDo {wakanda.esAtacada(cursor.heroeElegido())}
	// keyboard.s().onPressDo {wakanda.situacion()}
	// keyboard.num(1).onPressDo { capitanAmerica.cambiarEscudo(escudito)}
	// keyboard.num(2).onPressDo { capitanAmerica.cambiarEscudo(escudoSimple)}
	// keyboard.num(3).onPressDo { capitanAmerica.cambiarEscudo(cacerola)}
	}

}

object piso {

	method mostrarPiso() {
		8.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n - 1, 0)))})
		7.times({ n => game.addVisual(new Agua(position = game.at(n + 7, 0)))})
		4.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n + 6, 3)))})
		5.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n - 1, 5)))})
		2.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n + 12, 6)))})
		2.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n + 7, 7)))})
		3.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n + 1, 8)))})
	}

}

object llaves {

	method mostrarLlave() {
		game.addVisual(new Llave(position = game.at(3, 9)))
	}

}

class PisoDeTierra {

	var property position

	method image() = "piso_nivel_1.png"

}

class Agua {

	var property position

	method image() = "agua_1.png"

}

class Llave {

	var property position

	method image() = "llave.png"

}

object puerta {

	method position() = game.at(14, 7)

	method image() = "puerta_cerrada.png"

}

object casper {

	var vidas = null
	var property position = game.at(1, 1)

	method mostrarVida() {
		vidas = (1..3).map({ n => new Corazon(position = game.at(n + 11, 10))})
		//vidas.times({ n => game.addVisual(new Corazon(position = game.at(n + 11, 10)))})
		vidas.forEach({unCorazon => game.addVisual(unCorazon)})
	}

	method sacarVida() {
		vidas = vidas - 1
		vidas.remove()
		self.mostrarVida()
	}

	method image() = "casper_el_robot.png"

}

class Corazon{
	var property position

	method image() = "corazon.png"
	
}

