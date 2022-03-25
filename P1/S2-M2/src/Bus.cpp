#include "Bus.h"
#include "VisitanteEquipo.h"

void Bus::aceptar(VisitanteEquipo & visitante)const {
    visitante.visitarBus(*this);
}

Bus::Bus(float precio,std::string nombre) : ComponenteEquipo(precio,nombre){
}