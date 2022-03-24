#ifndef BUS_H
#define BUS_H

#include "ComponenteEquipo.h"

class Bus : public ComponenteEquipo {

    public:
        void aceptar(VisitanteEquipo visitante) ;
        Bus(float precion,std::string nombre);

};

#endif
