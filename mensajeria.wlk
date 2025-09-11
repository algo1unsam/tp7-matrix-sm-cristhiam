import mensajeros.*

object mensajeria {
    const property mensajeros = []
    method agregarMensajero(nombre) {mensajeros.add(nombre)}
    method eliminarMensajero(nombre) {mensajeros.remove(nombre)}
    method eliminarATodo() { mensajeros.clear() }
    method esGrande() = (mensajeros.size() > 2)
    method primeroPuedeEntregar()  {paquete.puedeSerEntregadoPor( mensajeros.first() ) }
    method ultimaCuantoPesa()  {mensajeros.last().peso() }
    }
             
