#include "Equipo.h"
#include "VisitanteEquipo.h"

void Equipo::visitar(VisitanteEquipo visitante){
    for(int i = 0; i<n_elementos; i++){
        componentes[i].aceptar(visitante);
    }
}

Equipo::Equipo(std::vector<ComponenteEquipo> componentes){
    this->componentes = componentes;
}