#ifndef EQUIPO_H
#define EQUIPO_H

#include "ComponenteEquipo.h"

class Equipo {

    private:
        ComponenteEquipo * componentes ;
        int n_elementos;

    public:
        void visitar(VisitanteEquipo visitante);
        Equipo(ComponenteEquipo * componentes);
    
};

#endif
