#include "Tarjeta.h"
#include "VisitanteEquipo.h"

void Tarjeta::aceptar(VisitanteEquipo & visitante) const{
    visitante.visitarTarjeta(*this);
}

Tarjeta::Tarjeta(float precio,std::string nombre) : ComponenteEquipo(precio,nombre){}