#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

#include "VisitanteEquipo.h"

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"

class VisitantePrecio : public VisitanteEquipo {
    public:
        void visitarDisco(Disco d) override;

        void visitarTarjeta(Tarjeta t) override;

        void visitarBus(Bus b) override;

        float getTotalPrice();

    private:
        float total;

};

#endif
