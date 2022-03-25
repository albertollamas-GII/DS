#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "auxy.h"

class Bus;
class Tarjeta;
class Disco;

class VisitanteEquipo {
    public:
        virtual void visitarDisco(const Disco & d) = 0;

        virtual void visitarTarjeta(const Tarjeta & t) = 0;

        virtual void visitarBus(const Bus & b) = 0;

        VisitanteEquipo();
        ~VisitanteEquipo();

};

#endif
