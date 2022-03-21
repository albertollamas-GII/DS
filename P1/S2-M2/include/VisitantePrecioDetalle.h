#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

#include "VisitanteEquipo.h"

class VisitantePrecioDetalle : public VisitanteEquipo {
    public:
        void visitarDisco(int d) override;

        void visitarTarjeta(int t) override;

        void visitarBus(int b) override;

};

#endif
