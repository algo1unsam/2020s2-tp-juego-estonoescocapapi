import wollok.game.*

object piso {

	method mostrarPiso() {
		20.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n - 1, 0)))})
		20.times({ n => game.addVisual(new PisoDePasto(position = game.at(n - 1, 1)))})
		30.times({ n => game.addVisual(new Agua(position = game.at(n + 19, 0)))})
		7.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 42, 16)))})
		8.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 17, 7)))})
		5.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 23, 13)))})
		14.times({ n => game.addVisual(new PisoDePasto(position = game.at(n - 1, 15)))})
		26.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 5, 23)))})
		18.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 23, 28)))})
		
	}

}

object llaves {

	method mostrarLlave() {
		game.addVisual(new Llave(position = game.at(2, 16)))
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

	method position() = game.at(47, 17)

	method image() = "puerta_cerrada.png"

}
