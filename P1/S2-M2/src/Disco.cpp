#include "Disco.h"
#include "VisitanteEquipo.h"

void Disco::aceptar(VisitanteEquipo visitante){
    visitante.visitarDisco(*this);
}

Disco::Disco(float precion,std::string nombre){
    this->nombre = nombre;
    this->precio = precio;
}