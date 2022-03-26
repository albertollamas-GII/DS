#include "VisitantePrecioDetalle.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

void VisitantePrecioDetalle::visitarDisco(const Disco & d){
    std::cout << "El disco \"" << d.getNombre() << "\" tiene un valor de : " << (d.getPrecio() - d.getPrecio()*descuento) << std::endl;
}

void VisitantePrecioDetalle::visitarBus(const Bus & b){
    std::cout << "El Bus \"" << b.getNombre() << "\" tiene un valor de : " << (b.getPrecio() - b.getPrecio()*descuento) << std::endl;
}

void VisitantePrecioDetalle::visitarTarjeta(const Tarjeta & t){
    std::cout << "La Tarjeta \"" << t.getNombre() << "\" tiene un valor de : " << (t.getPrecio() - t.getPrecio()*descuento) << std::endl;
}

VisitantePrecioDetalle::VisitantePrecioDetalle(TCliente tipo) : VisitanteEquipo(tipo){};
