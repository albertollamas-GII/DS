#ifndef DISCO_H
#define DISCO_H

#include "ComponenteEquipo.h"

class Disco : public ComponenteEquipo {
    public:
        void aceptar(VisitanteEquipo visitante);
        Disco(float precion,std::string nombre);
};

#endif
