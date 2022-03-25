#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

#include "VisitanteEquipo.h"

class VisitantePrecioDetalle : public VisitanteEquipo {
    public:
        void visitarDisco(const Disco & d);

        void visitarTarjeta(const Tarjeta & t);

        void visitarBus(const Bus & b);

    private:

};

#endif
