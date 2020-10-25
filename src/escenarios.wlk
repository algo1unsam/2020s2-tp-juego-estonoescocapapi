import wollok.game.*

object piso {

	method mostrarPiso() {
		20.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n - 1, 0)))})
		20.times({ n => game.addVisual(new PisoDePasto(position = game.at(n - 1, 1)))})
		30.times({ n => game.addVisual(new Agua(position = game.at(n + 19, 0)))})
		5.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 35, 6)))})
		5.times({ n => game.addVisual(new PisoDePasto(position = game.at(n - 1, 10)))})
		2.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 12, 6)))})
		2.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 7, 7)))})
		3.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 1, 8)))})
	}

}

object llaves {

	method mostrarLlave() {
		game.addVisual(new Llave(position = game.at(3, 9)))
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

}

object puerta {

	method position() = game.at(20, 8)

	method image() = "puerta_cerrada.png"

}
