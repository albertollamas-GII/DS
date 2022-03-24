#include "Bus.h"
#include "VisitanteEquipo.h"

void Bus::aceptar(VisitanteEquipo visitante){
    visitante.visitarBus(*this);
}

Bus::Bus(float precion,std::string nombre){
    this->nombre = nombre;
    this->precio = precio;
}