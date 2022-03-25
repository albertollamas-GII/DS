#ifndef EQUIPO_H
#define EQUIPO_H

#include "ComponenteEquipo.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"

class Equipo {

    private:
        Bus bus;
        Disco disco;
        Tarjeta tarjeta;

    public:
        void visitar(VisitanteEquipo & visitante);
        Equipo(Bus b, Tarjeta t, Disco d);
    
};

#endif
