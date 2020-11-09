import wollok.game.*
import characters.*



object llaves {

	method mostrarLlave() {
		game.addVisual(new Llave(position = game.at(2, 15)))
	}

}

class PisoDeTierra {

	var property position

	method image() = "piso_nivel_1_sin_pasto.png"

}

class PisoDePasto {

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

	method agarrarLlave() {
		game.removeVisual(self)
		casper.llaves().add(self)
	}

}

class Escalera {

	var property position

	method image() = "escalera.png"
	
	method atacar(parametro) = 0

}

object puerta {

	method position() = game.at(47, 17)

	method image() = "puerta_cerrada.png"

}

class FondoTablero {

	const imagen

	method image() = imagen

	method position() = game.origin()

}

