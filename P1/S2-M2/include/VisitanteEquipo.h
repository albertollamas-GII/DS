#ifndef VISITANTEEQUIPO_H
#define VISITANTEEQUIPO_H

#include "auxy.h"

enum TCliente{SinDescuento, Estudiante, Mayorista};

class Bus;
class Tarjeta;
class Disco;

class VisitanteEquipo {

    protected:
        TCliente tipo;
        float descuento;

        VisitanteEquipo(TCliente tipo);

    public:
        virtual void visitarDisco(const Disco & d) = 0;

        virtual void visitarTarjeta(const Tarjeta & t) = 0;

        virtual void visitarBus(const Bus & b) = 0;

};

#endif
