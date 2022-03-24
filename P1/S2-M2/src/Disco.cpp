#include "Disco.h"
#include "VisitanteEquipo.h"

void Disco::aceptar(VisitanteEquipo visitante){
    visitante.visitarDisco(*this);
}