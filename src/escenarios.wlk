import wollok.game.*
import characters.*
import adventureGame.*
import niveles.*

class Elementos {

	var property position

	method image()

	method atacar(personaje){
		
	}

}

class PisoDeTierra inherits Elementos {

	override method image() = "piso_nivel_1_sin_pasto.png"

}

class PisoDePasto inherits Elementos {

	override method image() = "piso_nivel_1.png"

}

class Agua inherits Elementos {

	override method image() = "agua_1.png"

	override method atacar(personaje) = 5

}

class Llave inherits Elementos {

	override method image() = "llave.png"

	method agarrarLlave() {
		game.removeVisual(self)
		casper.llaves().add(self)
	}

}

class Escalera inherits Elementos {

	const images = [ "escalera.png", "escalera_invisible.png" ]
	const indice = 0

	override method image() = images.get(indice)

}

class Puerta inherits Elementos {

	override method image() = "puerta_cerrada.png"

	method entrar() {
		// adventureGame.gameOver()
		adventureGame.nivelCompleto()
	}

}

class FondoTablero {

	const imagen

	method image() = imagen

	method position() = game.origin()

}

