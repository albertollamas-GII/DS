#ifndef TARJETA_H
#define TARJETA_H

#include "ComponenteEquipo.h"


class Tarjeta : public ComponenteEquipo {
    public:

        void aceptar(int visitante) override;
};

#endif
