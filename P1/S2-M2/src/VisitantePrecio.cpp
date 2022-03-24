#include "VisitantePrecio.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

void VisitantePrecio::visitarDisco(const Disco & d){
    total += d.getPrecio();
}

void VisitantePrecio::visitarBus(const Bus & b){
    total += b.getPrecio();
}

void VisitantePrecio::visitarTarjeta(const Tarjeta & t){
    total += t.getPrecio();
}

float VisitantePrecio::getTotalPrice(){
    return total;
}
