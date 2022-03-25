#ifndef TARJETA_H
#define TARJETA_H

#include "ComponenteEquipo.h"


class Tarjeta : public ComponenteEquipo {
    public:
        Tarjeta(float precion,std::string nombre);
        void aceptar(VisitanteEquipo & visitante) const;
};

#endif
