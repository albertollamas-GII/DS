#include "Disco.h"

void Disco::aceptar(VisitanteEquipo visitante){
    visitante.visitarDisco(*this);
}