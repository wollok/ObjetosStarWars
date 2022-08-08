object arturito {
	const valentia = 10
	var bateria = 0.5
	
	method cargar(){
		bateria = 1
	}
	method descargar(descarga){
		bateria = bateria - descarga
	}
	method potencia(){
		return bateria * valentia
	}
}

object hanSolo {
	var congelado = false
	var arma = new Arma(energia = 70)
	
	method potencia() {
		return if (congelado) 0 else arma.energia() * 2
		
	}
	method congelar(){
		congelado = true
	}
	method descongelar(){
		congelado = false
	}
	
	method arma(nuevaArma){
		arma = nuevaArma
	}
}


class Arma {
	const energia
	method energia() {
		return energia
	}
}

class Planeta {
	var poblacion  
	const defensores = []
	
	method seVanLosDefensores(){
		defensores.clear()
	}
	method agregarDefensor(defensor){
		defensores.add(defensor)
	}
	method invasion(intensidad){ 
		if 	(intensidad > self.potenciaDefensiva())
			poblacion = poblacion * 0.9
	}
	method potenciaDefensiva(){ 
		return defensores.sum{defensor => defensor.potencia()}
	}
	method masPoderoso(){
		return defensores.max({defensor => defensor.potencia()}) 
	}
	method poblacion() {
		return poblacion
	}
}

class Lider{
	var amigo
	
	method potencia(){
		return amigo.potencia() * 2
 	}
}

object armaAlternativa{
	const componentes = [20,50,10]
	
	method energia() {
		return componentes.sum()
	} 
}


class Maestro {
	const midiclorianos
	var lado = luminoso
	var esperanza = 50
	const arma = new SableDeLuz(energia=100)
	
	method lado(nuevoLado){
		lado = nuevoLado
	}

	method lado(){
		return lado
	}
	
	method potencia() {
		return (midiclorianos / 1000 + arma.energia()) * lado.nivel() 
	}

	method vivir(suceso){
		suceso.serVividoPor(self)
	}
	
	method vivirSucesoIndividual(suceso){
		lado.vivir(suceso,self) 	
	}
	
	method variarEsperanza(variacion)	{
		esperanza = esperanza + variacion
	}
	
	method sinEsperanza() {
		return esperanza <= 0
	}
	
	method reiniciarEsperanza(){
		esperanza = 50
	}

}

class SableDeLuz{
	var property energia 
}

	
object luminoso{
	
	method nivel() {
		return 10
	}
	
	method vivir(suceso, maestro){
		maestro.variarEsperanza(suceso.carga())
		if(maestro.sinEsperanza()){
			maestro.lado(oscuro)
			oscuro.aumentarNivel()
		}
	}
	
	method descripcion() {
		return " El lado luminoso de la vida ... "
	}
}

object oscuro{
	var nivel = 0
	
	method nivel() {
		return nivel 
	}
	
	method aumentarNivel(){
		nivel = nivel + 1
	}
	
	method vivir(suceso,maestro){
		if (suceso.carga() > 100){
			maestro.lado(luminoso)
			maestro.reiniciarEsperanza()
			nivel = nivel / 2
		}
	}
	method descripcion() {
		return " El lado oscuro ... "
	}
}

class Suceso {
	var carga
	
	method serVividoPor(maestro) {
		maestro.vivirSucesoIndividual(self)
	}
	
	method carga() {
		return carga
	}
}


class SucesoCompuesto {
	const sucesos = []
	
	method carga() {
		return sucesos.sum{suceso=> suceso.carga()}
	}
	
	method serVividoPor(maestro) {
		sucesos.forEach{s=> maestro.vivir(s)}
	}
}
