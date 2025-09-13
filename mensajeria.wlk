import mensajeros.*

object mensajeria {
    // segunda parte
    const property mensajeros = []
    method agregarMensajero(nombre) {mensajeros.add(nombre)}
    method eliminarMensajero(nombre) {mensajeros.remove(nombre)}
    method eliminarATodo() { mensajeros.clear() }
    method esGrande() = (mensajeros.size() > 2)
    method primeroPuedeEntregar()  = paquete.puedeSerEntregadoPor(mensajeros.first()) 
    method ultimaCuantoPesa()  = mensajeros.last().peso() 

    // tercera parte  
    method puedeEntregar(_paquete) = mensajeros.any({mensajero => _paquete.puedeEntregar(mensajero)})
    method llevarPaquete(_paquete) = mensajeros.filter ({mensajero => _paquete.puedeEntregar(mensajero)}) 
    method sobrepeso() = mensajeros.average{mensajero => mensajero.peso()} > 500
    method peso() = mensajeros.average{mensajero => mensajero.peso()}
      
    
    }
             
