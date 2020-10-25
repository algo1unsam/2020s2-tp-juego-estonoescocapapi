import wollok.game.*
import characters.*

class Movimiento{
	
	var property direccion
	const personaje
	
	
	method siguientePosicion()= direccion.posicion(personaje)
	
	method image()= personaje.nombre() + "_movement_" + direccion.nombre()
	
}


object derecha{
	
	method posicion(personaje) = personaje.position().rigth(1) 
	
	method nombre() = "right"
	
}

object izquierda{
	
	method posicion(personaje) = personaje.position().left(1)
	
	method nombre()= "left"
	
}

object abajo{
	
	method posicion(personaje) = personaje.position().down(1)
	
	method nombre() = "upDown"
}

object arriba{
	
	method posicion(personaje) = personaje.position().up(1)
	
	method nombre() = "upDown"
	
}