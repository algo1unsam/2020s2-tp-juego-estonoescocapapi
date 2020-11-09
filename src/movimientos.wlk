import wollok.game.*
import characters.*

class Movimiento{
	
	var property direccion
	const personaje
	
	
	method siguientePosicion()= direccion.posicion(personaje)
	
	method image()= personaje.nombre() + "_movement_" + direccion.nombre() + ".png"
	
}


object derecha{
	
	method posicion(personaje) = personaje.position().right(1) 
	
	method nombre() = "right"
	
	method direccionOpuesta() = izquierda
	
}

object izquierda{
	
	method posicion(personaje) = personaje.position().left(1)
	
	method nombre()= "left"
	
	method direccionOpuesta() = derecha
	
}
object abajo {
	
	method posicion(personaje){
		return personaje.position().down(1)
	}
}
	

object abajoEnEscalera{
	
	method posicion(personaje){
		return if (personaje.estaSobreEscalera() or personaje.abajoHayEscalera()) {
			personaje.position().down(1)
		}else {
			personaje.position().down(0)
		}
	}
	
	method nombre() = "upDown"
}

object arribaEnEscalera{
	
	method posicion(personaje) {
		return if(personaje.estaSobreEscalera()){
			personaje.position().up(1)
		}else {
			personaje.position().up(0)
		}
	}
	
	method nombre() = "upDown"
	
}