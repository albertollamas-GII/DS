#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "auxy.h"

class Bus;
class Tarjeta;
class Disco;

class VisitanteEquipo {
    public:
        virtual void visitarDisco(const Disco & d);

        virtual void visitarTarjeta(const Tarjeta & t);

        virtual void visitarBus(const Bus & b);

        VisitanteEquipo();
    protected:
        
        float total = 0;

};

#endif
