#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

#include "VisitanteEquipo.h"

class VisitantePrecio : public VisitanteEquipo {
    public:
        void visitarDisco(int d) override;

        void visitarTarjeta(int t) override;

        void visitarBus(int b) override;


};

#endif
