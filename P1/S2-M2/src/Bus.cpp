#include "Bus.h"
#include "VisitanteEquipo.h"

void Bus::aceptar(VisitanteEquipo visitante){
    visitante.visitarBus(*this);
}