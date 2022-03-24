#include "VisitantePrecioDetalle.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

void VisitantePrecioDetalle::visitarDisco(const Disco & d){
    total += d.getPrecio();
    nombres.push_back(d.getNombre());
}

void VisitantePrecioDetalle::visitarBus(const Bus & b){
    total += b.getPrecio();
    nombres.push_back(b.getNombre());
}

void VisitantePrecioDetalle::visitarTarjeta(const Tarjeta & t){
    total += t.getPrecio();
    nombres.push_back(t.getNombre());
}

std::pair<float, std::vector<std::string>> VisitantePrecioDetalle::getInfo(){
    std::pair<float, std::vector<std::string>> par = {total,nombres};
    return par;
}
