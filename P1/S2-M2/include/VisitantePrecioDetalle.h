#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

#include "VisitanteEquipo.h"

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"

class VisitantePrecioDetalle : public VisitanteEquipo {
    public:
        void visitarDisco(Disco d) override;

        void visitarTarjeta(Tarjeta t) override;

        void visitarBus(Bus b) override;

};

#endif
