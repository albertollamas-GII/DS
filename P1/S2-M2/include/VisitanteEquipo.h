#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "auxy.h"

class VisitanteEquipo {
    public:
        virtual void visitarDisco(int d);

        virtual void visitarTarjeta(int t);

        virtual void visitarBus(int b);

};

#endif
