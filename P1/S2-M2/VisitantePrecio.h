#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

#include "VisitanteEquipo.h"

class VisitantePrecio : VisitanteEquipo {
    public:
        void visitarDisco(Disco d) override;

        void visitarTarjeta(Tarjeta t) override;

        void visitarBus(Bus b) override;


};

#endif
