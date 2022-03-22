#include "Bus.h"

void Bus::aceptar(VisitanteEquipo visitante){
    visitante.visitarBus(*this);
}