import wollok.game.*
import adventureGame.*
import movimientos.*

class Personaje {

	var property position = null
	var property nombre = null
	var property movimiento = null
	var property vida = null

	method image() = movimiento.image()

	method mover(direccion) {
		movimiento.direccion(direccion)
		self.position(movimiento.siguientePosicion())
	}

}

object casper inherits Personaje {

	const corazones = []
	var property llaves = []

	method inicializar() {
		nombre = "casper_el_robot"
		movimiento = new Movimiento(direccion = derecha, personaje = self)
		position = game.at(1, 2)
		vida = 5
		self.mostrarVida()
	}

	method mostrarVida() {
		vida.times({ cant => corazones.add(new Corazon(position = game.at(cant + 22, 33)))})
		corazones.forEach({ corazon => game.addVisual(corazon)})
	}

	method sacarVida(danio) {
		if (danio >= vida) {
			corazones.forEach({ corazon => game.removeVisual(corazon)})
				// corazones.clear()
				// vida = 0
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
		} else vida -= danio
		danio.times({ n => self.perderCorazon()})
		if (vida == 0) {
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
		}
	}

	// method image() = "casper_el_robot.png"
	method perderCorazon() {
		game.removeVisual(corazones.first())
		corazones.remove(corazones.first())
	}

	method saltar() {
		game.removeTickEvent("Gravedad")
		game.onTick(10, "Salto", {self.subir(1)})
		game.schedule(150, {game.removeTickEvent("Salto")})
		game.schedule(150, {game.onTick(10, "Gravedad", {self.gravedad()})})
		
	}

	method subir(distancia) {
		position = position.up(distancia)
	}


	method hayUnaLlave() = game.getObjectsIn(self.position()).size() > 1

	method agarrarLlave() {
		if (not self.hayUnaLlave()) {
			self.error("No hay ninguna llave")
		} else game.colliders(self).forEach({ llave => llave.agarrarLlave() })
	}

	method hayUnaEscalera() = return game.getObjectsIn(self.position()).size() > 1

	method subirEscaleraSiEsPosible() {
		if (self.hayUnaEscalera()) {
			position = position.up(1)
		}
	}

	method gravedad() {
		if (self.puedeMover(abajo) and not self.hayUnaEscalera()) {
			self.position(self.position().down(1))
		}
	}

	method puedeMover(direccion) {
		const direccionAEvaluar = game.getObjectsIn(direccion.posicion(self))
		return direccionAEvaluar.isEmpty()
	}

}

class Enemigo inherits Personaje {

	const danio 
	const tipo
	
	//override method image() = "enemigo_1_derecha.png"

	method inicializar() {
		nombre = "enemigo" + tipo.toString() 
		movimiento = new Movimiento(direccion = derecha, personaje = self)
		vida = 1
	}

	method atacar(personaje) {
		personaje.sacarVida(danio)
	}

	method morir() {
		game.removeVisual(self)
	}
	override method mover(direccion){
		
		//game.schedule(100,{game.onTick(100,"enemigo",{self.mover(derecha)})})
		//game.schedule(150,{game.removeTickEvent("enemigo")})
		//movimiento.direccion(direccion)
		//self.position(movimiento.siguientePosicion())
		//game.schedule(150,{game.onTick(100,"enemigo",{self.mover(izquierda)})})
		//game.onTick(100,"enemigo",{self.mover(izquierda)})
		movimiento.direccion(direccion)
		self.position(movimiento.siguientePosicion())
		direccion.direccionOpuesta()
	}

}

class Corazon {

	var property position

	method image() = "corazon.png"

}

