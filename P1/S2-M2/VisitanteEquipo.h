#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

class VisitanteEquipo {
    public:
        virtual void visitarDisco(Disco d);

        virtual void visitarTarjeta(Tarjeta t);

        virtual void visitarBus(Bus b);
};

#endif
