#include "Tarjeta.h"

void Tarjeta::aceptar(VisitanteEquipo visitante){
    visitante.visitarTarjeta(*this);
}