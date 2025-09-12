object morfeo {
    var property kgMorfeo = 90
    var property transporte = camion
    var property puedeLlamar = false
    method peso() = transporte.peso() + kgMorfeo
}

object trinity {
    var property kgtrinity = 900
    var property puedeLlamar = false
}

object neo {
    var property kgneo = 0
    var property puedeLlamar = true //false 
}
object camion {
    var property acoplados = 1
    method peso() = 500 * acoplados     
}
object monopatin {
    var property peso =  1   
}
object puente {
    method dejarPasar(mensajero) = mensajero.peso() < 1000
}
object paquete {
    var property pago = false
    var property destino = puente

    method estaPago() = pago
    method pagar() {pago = true}
    method destino(lugar) { destino = lugar} 
    method puedeSerEntregadoPor(mensajero) = (destino.dejarPasar(mensajero)) and pago

}
object matrix {
    method dejarPasar(mensajero) = mensajero.puedeLlamar()
    }