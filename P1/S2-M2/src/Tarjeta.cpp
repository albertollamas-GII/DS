#include "Tarjeta.h"
#include "VisitanteEquipo.h"

void Tarjeta::aceptar(VisitanteEquipo visitante){
    visitante.visitarTarjeta(*this);
}