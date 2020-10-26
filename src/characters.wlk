import wollok.game.*
import adventureGame.*
import movimientos.*


class Personaje{
	
	var property position = null
	var property nombre = null
	var property movimiento = null
	var property vida = null
	
	method image()= movimiento.image()
	
	
	method mover(direccion){
		movimiento.direccion(direccion)
		self.position(movimiento.siguientePosicion())
	}
	
}

object casper inherits Personaje {

	const corazones = []
	var property llaves = []
	
	method inicializar(){
		nombre = "casper_el_robot"
		movimiento = new Movimiento(direccion = izquierda, personaje = self)
		position = game.at(1,2)
		vida = 5
		self.mostrarVida()
		
	}
	

	method mostrarVida() {
		vida.times({ cant => corazones.add(new Corazon(position = game.at(cant + 23, 34)))})
		corazones.forEach({ corazon => game.addVisual(corazon)})
	}

	method sacarVida(danio) {
		
		if (danio >= vida) {
			
			corazones.forEach({ corazon => game.removeVisual(corazon)})
			//corazones.clear()
			//vida = 0
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
			
		} else 	vida -= danio
				danio.times({ n => self.perderCorazon()})
		
		if(vida == 0){
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
		}
	}

	//method image() = "casper_el_robot.png"

	method perderCorazon() {
		game.removeVisual(corazones.first())
		corazones.remove(corazones.first())
	}
	method saltar(){
		self.subir()
		game.schedule(500, {self.caer()})
	}
	
	method subir(){
		position = position.up(2)
	}

	method caer(){
		position = position.down(2)
	}
	
	method hayUnaLlave()= game.getObjectsIn(self.position()).size() > 1
	
	method agarrarLlave(){
		if (not self.hayUnaLlave()){
			self.error("No hay ninguna llave")
		}else
			game.colliders(self).forEach({llave=> llave.agarrarLlave()})
	}

}

	

class Corazon {

	var property position

	method image() = "corazon.png"

}
