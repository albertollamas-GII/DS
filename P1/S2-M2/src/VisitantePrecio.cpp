#include "VisitantePrecio.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

void VisitantePrecio::visitarDisco(const Disco & d){
    total += (d.getPrecio() - d.getPrecio()*descuento);
}

void VisitantePrecio::visitarBus(const Bus & b){
    total += (b.getPrecio() - b.getPrecio()*descuento);
}

void VisitantePrecio::visitarTarjeta(const Tarjeta & t){
    total += (t.getPrecio() - t.getPrecio()*descuento);
}

float VisitantePrecio::getTotalPrice()const{
    return total;
}


VisitantePrecio::VisitantePrecio(TCliente tipo) : VisitanteEquipo(tipo){};
