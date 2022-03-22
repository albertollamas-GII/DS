#include "VisitantePrecio.h"


void VisitantePrecio::visitarDisco(Disco d){
    total += d.getPrecio();
}

void VisitantePrecio::visitarBus(Bus b){
    total += b.getPrecio();
}

void VisitantePrecio::visitarTarjeta(Tarjeta t){
    total += t.getPrecio();
}

float VisitantePrecio::getTotalPrice(){
    return total;
}
