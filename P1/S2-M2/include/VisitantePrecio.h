#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

#include "VisitanteEquipo.h"


class VisitantePrecio : public VisitanteEquipo {

    public:
        void visitarDisco(const Disco & d) override;

        void visitarTarjeta(const Tarjeta & t) override;

        void visitarBus(const Bus & b) override;

        float getTotalPrice();

};

#endif
