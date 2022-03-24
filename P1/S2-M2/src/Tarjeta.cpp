#include "Tarjeta.h"
#include "VisitanteEquipo.h"

void Tarjeta::aceptar(VisitanteEquipo visitante){
    visitante.visitarTarjeta(*this);
}

Tarjeta::Tarjeta(float precion,std::string nombre){
    this->nombre = nombre;
    this->precio = precio;
}