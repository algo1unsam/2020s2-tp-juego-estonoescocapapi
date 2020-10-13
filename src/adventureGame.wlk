import wollok.game.*

object adventureGame {

	var nivel = 1

	method jugar() {
		self.configurarPantalla()
		self.configurarCursor()
		self.agregarPersonajes()
		self.definirControles()
		game.cellSize(15)
		piso.mostrarPiso()
		llaves.mostrarLlave()
		game.addVisual(puerta)
		game.addVisualCharacter(casper)
		casper.mostrarVida()
		game.start()
	}

	method configurarPantalla() {
		game.title("Adventure Game")
		game.width(50)
		game.height(35)
		game.boardGround("fondo_" + nivel + ".png")
	}

	method configurarCursor() {
	// game.addVisualCharacter(cursor)
	// game.whenCollideDo(cursor,{personaje => cursor.seleccionarHeroe(personaje)})
	}

	method agregarPersonajes() {
	// game.addVisual(ironMan)
	// game.addVisual(hulk)
	// game.addVisual(capitanAmerica)
	// game.addVisual(thor)
	// game.addVisual(escudito)
	// game.addVisual(escudoSimple)
	// game.addVisual(wakanda)
	// game.addVisual(cacerola)
	}

	method definirControles() {
		keyboard.s().onPressDo{ casper.sacarVida(5)}
	// keyboard.r().onPressDo {cursor.reforzarHeroe() }
	// keyboard.a().onPressDo {wakanda.esAtacada(cursor.heroeElegido())}
	// keyboard.s().onPressDo {wakanda.situacion()}
	// keyboard.num(1).onPressDo { capitanAmerica.cambiarEscudo(escudito)}
	// keyboard.num(2).onPressDo { capitanAmerica.cambiarEscudo(escudoSimple)}
	// keyboard.num(3).onPressDo { capitanAmerica.cambiarEscudo(cacerola)}
	}

	method perder() {
		game.stop()
	}

}

object piso {

	method mostrarPiso() {
		20.times({ n => game.addVisual(new PisoDeTierra(position = game.at(n - 1, 0)))})
		20.times({ n => game.addVisual(new PisoDePasto(position = game.at(n - 1, 1)))})
		30.times({ n => game.addVisual(new Agua(position = game.at(n + 19, 0)))})
		5.times({ n => game.addVisual(new PisoDePasto(position = game.at(n + 18, 6)))})
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

	method position() = game.at(14, 7)

	method image() = "puerta_cerrada.png"

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
			corazones.clear()
			vidas = 0
			game.onTick(2000, "CHAU", { adventureGame.perder()})
			
		} else 	vidas -= danio
				danio.times({ n => self.perderCorazon()})
		
		if(vidas == 0){
			game.onTick(2000, "CHAU", { adventureGame.perder()})
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

