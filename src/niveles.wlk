import wollok.game.*
import adventureGame.*
import escenarios.*
import characters.*
import movimientos.*

object nivel_uno {

	const piso = []
	var property escaleras = []
	const nivel_uno = new FondoTablero(imagen = "fondo_1.png")
	const fantasma = new Enemigo(danio = 1, tipo = 2, position = game.at(10, 24))
	const puerta = new Puerta(position = game.at(48, 17))
	const llave = new Llave(position = game.at(2, 15))

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
		4.times({ n => escaleras.add(new Escalera(position = game.at(18, 1 + n), indice = 0))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(18, 5 + n), indice = 1))})
		4.times({ n => escaleras.add(new Escalera(position = game.at(24, 7 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(24, 11 + n), indice = 1))})
		8.times({ n => escaleras.add(new Escalera(position = game.at(27, 13 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(27, 21 + n), indice = 1))})
		3.times({ n => escaleras.add(new Escalera(position = game.at(24, 23 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(24, 26 + n), indice = 1))})
		7.times({ n => escaleras.add(new Escalera(position = game.at(12, 14 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(12, 21 + n), indice = 1))})
		escaleras.forEach({ unaEscalera => game.addVisual(unaEscalera)})
	}

	method mostrarFondo() {
		game.addVisual(nivel_uno)
	}

	method agregarVisuales() {
		self.mostrarFondo()
		self.mostrarPiso()
		self.mostrarEscaleras()
		casper.inicializar()
		game.addVisual(puerta)
		game.addVisual(casper)
		game.addVisual(llave)
	}

	method definirControles() {
		keyboard.right().onPressDo({ casper.mover(derecha)})
		keyboard.left().onPressDo({ casper.mover(izquierda)})
		keyboard.up().onPressDo({ casper.mover(arribaEnEscalera)})
		keyboard.down().onPressDo({ casper.mover(abajoEnEscalera)})
		keyboard.space().onPressDo({ casper.saltar()})
		keyboard.a().onPressDo({ casper.agarrarLlave()})
		keyboard.e().onPressDo({ casper.estaEnLaPuerta()})
	}

	method comenzar() {
		game.clear()
		self.agregarVisuales()
		self.definirControles()
		game.onTick(10, "Gravedad", { casper.gravedad()})
		game.onTick(400, "enemigo", { fantasma.mover(fantasma.movimiento().direccion())})
		fantasma.inicializar()
		game.addVisual(fantasma)
		game.onCollideDo(casper, { personaje => personaje.atacar(casper)})
	}

}

object nivel_dos {

	const piso = []
	var property escaleras = []
	
	const nivel_uno = new FondoTablero(imagen = "fondo_2.png")
	const fantasma = new Enemigo(danio = 2, tipo = 3, position = game.at(10, 24))
	const fantasma2 = new Enemigo(danio = 2, tipo = 2, position = game.at(30, 29))
	const puerta = new Puerta(position = game.at(48, 17))
	const llave = new Llave(position = game.at(2, 15))

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
		4.times({ n => escaleras.add(new Escalera(position = game.at(18, 1 + n), indice = 0))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(18, 5 + n), indice = 1))})
		4.times({ n => escaleras.add(new Escalera(position = game.at(24, 7 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(24, 11 + n), indice = 1))})
		8.times({ n => escaleras.add(new Escalera(position = game.at(27, 13 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(27, 21 + n), indice = 1))})
		3.times({ n => escaleras.add(new Escalera(position = game.at(24, 23 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(24, 26 + n), indice = 1))})
		7.times({ n => escaleras.add(new Escalera(position = game.at(12, 14 + n)))})
		2.times({ n => escaleras.add(new Escalera(position = game.at(12, 21 + n), indice = 1))})
		escaleras.forEach({ unaEscalera => game.addVisual(unaEscalera)})
	}

	method mostrarFondo() {
		game.addVisual(nivel_uno)
	}

	method agregarVisuales() {
		self.mostrarFondo()
		self.mostrarPiso()
		self.mostrarEscaleras()
		casper.inicializar()
		game.addVisual(puerta)
		game.addVisual(casper)
		game.addVisual(llave)
	}

	method definirControles() {
		keyboard.right().onPressDo({ casper.mover(derecha)})
		keyboard.left().onPressDo({ casper.mover(izquierda)})
		keyboard.up().onPressDo({ casper.mover(arribaEnEscalera)})
		keyboard.down().onPressDo({ casper.mover(abajoEnEscalera)})
		keyboard.space().onPressDo({ casper.saltar()})
		keyboard.a().onPressDo({ casper.agarrarLlave()})
		keyboard.e().onPressDo({ casper.estaEnLaPuerta()})
	}

	method comenzar() {
		game.clear()
		casper.nivel(2)
		casper.llaves().clear()
		self.agregarVisuales()
		self.definirControles()
		game.onTick(10, "Gravedad", { casper.gravedad()})
		game.onTick(200, "enemigo", { fantasma.mover(fantasma.movimiento().direccion())})
		fantasma.inicializar()
		game.addVisual(fantasma)
		game.onTick(200, "enemigo", { fantasma2.mover(fantasma2.movimiento().direccion())})
		fantasma2.inicializar()
		game.addVisual(fantasma2)
		game.onCollideDo(casper, { personaje => personaje.atacar(casper)})
	}

}

