#ifndef COMPONENTEEQUIPO_H
#define COMPONENTEEQUIPO_H

#include "VisitanteEquipo.h"
#include "auxy.h"

class ComponenteEquipo {

    private:
        string nombre;

        float precio;

    public:
        virtual void aceptar(VisitanteEquipo visitante);

};

#endif
