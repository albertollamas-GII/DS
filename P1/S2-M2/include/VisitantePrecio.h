#ifndef VISITANTEPRECIO_H
#define VISITANTEPRECIO_H

#include "VisitanteEquipo.h"


class VisitantePrecio : public VisitanteEquipo {

    private:

        float total;

    public:
        void visitarDisco(const Disco & d);

        void visitarTarjeta(const Tarjeta & t);

        void visitarBus(const Bus & b);

        float getTotalPrice() const;

};

#endif
