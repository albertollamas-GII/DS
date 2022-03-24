#ifndef EQUIPO_H
#define EQUIPO_H

#include "ComponenteEquipo.h"

class Equipo {

    private:
        std::vector<ComponenteEquipo> componentes ;
        int n_elementos;

    public:
        void visitar(VisitanteEquipo visitante);
        Equipo(std::vector<ComponenteEquipo> componentes);
    
};

#endif
