#include "VisitantePrecio.h"
#include "VisitanteEquipo.h"

void VisitanteEquipo::visitarDisco(Disco d){
    total += d.getPrecio();
}

void VisitanteEquipo::visitarBus(Bus b){
    total += b.getPrecio();
}

void VisitanteEquipo::visitarTarjeta(Tarjeta t){
    total += t.getPrecio();
}

float VisitanteEquipo::getTotalPrice(){
    return total;
}
