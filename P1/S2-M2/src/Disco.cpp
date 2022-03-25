#include "Disco.h"
#include "VisitanteEquipo.h"

void Disco::aceptar(VisitanteEquipo & visitante) const{
    visitante.visitarDisco(*this);
}

Disco::Disco(float precio,std::string nombre) : ComponenteEquipo(precio,nombre) {}