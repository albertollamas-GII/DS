#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "auxy.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"

class VisitanteEquipo {
    public:
        virtual void visitarDisco(Disco d);

        virtual void visitarTarjeta(Tarjeta t);

        virtual void visitarBus(Bus b);

        VisitanteEquipo();
    protected:
        
        float total;

};

#endif
