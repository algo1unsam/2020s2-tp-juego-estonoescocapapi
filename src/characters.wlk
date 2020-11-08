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
		movimiento = new Movimiento(direccion = izquierda, personaje = self)
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
		self.subir()
		game.schedule(500, { self.caer()})
	}

	method subir() {
		position = position.up(3)
	}

	method caer() {
		position = position.down(3)
	}

	method hayUnaLlave() = game.getObjectsIn(self.position()).size() > 1

	method agarrarLlave() {
		if (not self.hayUnaLlave()) {
			self.error("No hay ninguna llave")
		} else game.colliders(self).forEach({ llave => llave.agarrarLlave() })
	}

	method hayUnaEscalera() = game.getObjectsIn(self.position()).size() > 1 or game.getObjectsIn(position.down(1)).size() == 1

	method subirEscaleraSiEsPosible() {
		if (self.hayUnaEscalera()) {
			position = position.up(2)
		}
	}
	method gravedad(){
		if(self.puedeMover(abajo) and !self.hayUnaEscalera()){
			self.position(self.position().down(1))
		}
	}

}

class Enemigo inherits Personaje{
	
	const danio = 1
	
	method inicializar(){
		
		nombre = ""
		movimiento = new Movimiento(direccion = derecha, personaje = self)
		vida = 1
	}
	method atacar(personaje){
		personaje.sacarVida(danio)
	}
	method morir(){
		game.removeVisual(self)
	}
	
	
}

class Corazon {

	var property position

	method image() = "corazon.png"

}

