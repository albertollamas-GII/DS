#ifndef BUS_H
#define BUS_H

#include "ComponenteEquipo.h"

class Bus : public ComponenteEquipo {

    public:
        void aceptar(VisitanteEquipo & visitante) const;
        Bus(float precio,std::string nombre);

};

#endif
