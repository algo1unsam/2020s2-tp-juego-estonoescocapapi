import wollok.game.*
import adventureGame.*


class Personaje{
	
	var property position = null
	var nombre = null
	var property movimiento = null
	var property vida = null
	
	method image()= movimiento.image()
	
	
	method mover(direccion){
		movimiento.direccion(direccion)
		self.position(movimiento.siguientePosicion())
	}
	
}

object casper {

	const corazones = []
	var vidas = 3
	var property position = game.at(1, 2)
	

	method mostrarVida() {
		vidas.times({ cant => corazones.add(new Corazon(position = game.at(cant + 23, 34)))})
		corazones.forEach({ corazon => game.addVisual(corazon)})
	}

	method sacarVida(danio) {
		
		if (danio >= vidas) {
			
			corazones.forEach({ corazon => game.removeVisual(corazon)})
			//corazones.clear()
			//vidas = 0
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
			
		} else 	vidas -= danio
				danio.times({ n => self.perderCorazon()})
		
		if(vidas == 0){
			game.onTick(2000, "CHAU", { adventureGame.gameOver()})
		}
	}

	method image() = "casper_el_robot.png"

	method perderCorazon() {
		game.removeVisual(corazones.first())
		corazones.remove(corazones.first())
	}
	
	

}

class Corazon {

	var property position

	method image() = "corazon.png"

}
