object morfeo {
    var property kgMorfeo = 90
    var property transporte = camion
    var property puedeLlamar = false
    method peso() = transporte.peso() + kgMorfeo
}

object trinity {
    var property kgtrinity = 900
    var property puedeLlamar = true
    method peso() =  kgtrinity
}

object neo {
    var property kgneo = 0
    var property credito = true
    method puedeLlamar() = credito

    method peso() =  kgneo
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
object matrix {
    method dejarPasar(mensajero) = mensajero.puedeLlamar()
    }
object paquete {
    var property precio =  50
    var property pago = false
    var property destino = puente

    method estaPago() = pago
    method pagar() {pago = true}
    method destino(lugar) { destino = lugar} 
    method puedeSerEntregadoPor(mensajero) = (destino.dejarPasar(mensajero) and pago)
    method puedeEntregar(mensajero) = ((destino.dejarPasar(mensajero) and pago))
}
object paquetito {
    var property pago = true
    method puedeEntregar(mensajero) = true
}


object paquetonViajero {
    const property destinos = #{}
    var property precio  = 100
    var property total = 0
    method agregarDestinos(lugar) { 
        destinos.add(lugar)
       total = precio * destinos.size()
    }
    method pagar(pago) { total = total - pago}
   // para enviarce debe estar pagodo totalmente
   //el mensajero debe poder ir a todos los lugares
   method puedeEntregar(mensajero) = destinos.all({destino => destino.dejarPasar(mensajero) }) and total == 0 
   }
