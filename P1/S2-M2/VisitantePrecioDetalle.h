#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

#include "VisitanteEquipo.h"

class VisitantePrecioDetalle : VisitanteEquipo {
    public:
        void visitarDisco(Disco d) override;

        void visitarTarjeta(Tarjeta t) override;

        void visitarBus(Bus b) override;

};

#endif
