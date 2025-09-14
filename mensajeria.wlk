import mensajeros.*

object mensajeria {
    // segunda parte
    const property mensajeros = []
    const property paquetesPendientes = #{}
    const property mensajerosDisponibles = []
    var property totalGanado = 0 
    const property conjuntoPaquetes = #{}
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
    //method peso() = mensajeros.average{mensajero => mensajero.peso()}
    method enviarPaquete(_paquete) {
        mensajerosDisponibles.addAll(mensajeros.filter ({mensajero => _paquete.puedeEntregar(mensajero)}) )
           if(mensajerosDisponibles.isEmpty()){paquetesPendientes.add(_paquete)}
           else{
            totalGanado = totalGanado + _paquete.precio()  
             }
    }   
    method enviarConjunto(_paquetes) {
            conjuntoPaquetes.addAll(_paquetes)
            conjuntoPaquetes.forEach({_paquete => self.enviarPaquete(_paquete)})
    }
    method pendiente() {
        if(paquetesPendientes.size()>0){
            self.enviarPaquetePendiente(paquetesPendientes.max({paquete => paquete.precio()}))
            paquetesPendientes.forEach({paquete => self.enviarPaquetePendiente(paquete)})
        }

    }
        method enviarPaquetePendiente(_paquete) {
        mensajerosDisponibles.addAll(mensajeros.filter ({mensajero => _paquete.puedeEntregar(mensajero)}) )
           if( mensajerosDisponibles.size()>0){
            totalGanado = totalGanado + _paquete.precio() 
            paquetesPendientes.remove(_paquete) 
            }
            else {return}
    }

    method prue() = paquetesPendientes.max({paquete => paquete.precio()})
}