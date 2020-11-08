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

object abajo{
	
	method posicion(personaje) = personaje.position().down(1)
	
	method nombre() = "upDown"
}

object arriba{
	
	method posicion(personaje) = personaje.position().up(1)
	
	method nombre() = "upDown"
	
}