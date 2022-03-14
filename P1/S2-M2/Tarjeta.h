#ifndef TARJETA_H
#define TARJETA_H

#include "ComponenteEquipo.h"
#include "VisitanteEquipo.h"

class Tarjeta : ComponenteEquipo {
    public:
        void aceptar(VisitanteEquipo visitante) override;
};

#endif
