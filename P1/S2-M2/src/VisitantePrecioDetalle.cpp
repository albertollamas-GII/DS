#include "VisitantePrecioDetalle.h"

void VisitantePrecioDetalle::visitarDisco(Disco d){
    total += d.getPrecio();
    nombres.push_back(d.getNombre());
}

void VisitantePrecioDetalle::visitarBus(Bus b){
    total += b.getPrecio();
    nombres.push_back(b.getNombre());
}

void VisitantePrecioDetalle::visitarTarjeta(Tarjeta t){
    total += t.getPrecio();
    nombres.push_back(t.getNombre());
}

std::pair<float, std::vector<char *>> VisitantePrecioDetalle::getInfo(){
    std::pair<float, std::vector<char *>> par = {total,nombres};
    return par;
}
