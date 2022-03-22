#include "Equipo.h"

void Equipo::visitar(VisitanteEquipo visitante){
    for(int i = 0; i<n_elementos; i++){
        componentes[i].aceptar(visitante);
    }
}

Equipo::Equipo(ComponenteEquipo * componentes){
    this->componentes = componentes;
}