import wollok.game.*
import characters.*

object nivel_uno {

	var piso = []
	var property escaleras = []
	const nivel_uno = new FondoTablero(imagen = "fondo_1.png")

	method mostrarPiso() {
		20.times({ n => piso.add(new PisoDeTierra(position = game.at(n - 1, 0)))})
		20.times({ n => piso.add(new PisoDePasto(position = game.at(n - 1, 1)))})
		30.times({ n => piso.add(new Agua(position = game.at(n + 19, 0)))})
		7.times({ n => piso.add(new PisoDePasto(position = game.at(n + 42, 16)))})
		8.times({ n => piso.add(new PisoDePasto(position = game.at(n + 17, 7)))})
		5.times({ n => piso.add(new PisoDePasto(position = game.at(n + 23, 13)))})
		14.times({ n => piso.add(new PisoDePasto(position = game.at(n - 1, 14)))})
		26.times({ n => piso.add(new PisoDePasto(position = game.at(n + 5, 23)))})
		18.times({ n => piso.add(new PisoDePasto(position = game.at(n + 23, 28)))})
		piso.forEach({ unPiso => game.addVisual(unPiso)})
	}

	method mostrarEscaleras() {
		4.times({ n => escaleras.add(new Escalera(position = game.at(18, 1 + n)))})
		4.times({ n => escaleras.add(new Escalera(position = game.at(24, 7 + n)))})
		8.times({ n => escaleras.add(new Escalera(position = game.at(27, 13 + n)))})
		3.times({ n => escaleras.add(new Escalera(position = game.at(24, 23 + n)))})
		7.times({ n => escaleras.add(new Escalera(position = game.at(12, 14 + n)))})
		escaleras.forEach({ unaEscalera => game.addVisual(unaEscalera)})
	}

	method mostrarFondo() {
		game.addVisual(nivel_uno)
	}

}

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

