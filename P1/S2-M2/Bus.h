#ifndef BUS_H
#define BUS_H

#include "ComponenteEquipo.h"

class Bus : ComponenteEquipo {

    public:
        void aceptar(VisitanteEquipo visitante) override;


};

#endif
