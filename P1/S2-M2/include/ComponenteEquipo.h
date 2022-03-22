#ifndef COMPONENTEEQUIPO_H
#define COMPONENTEEQUIPO_H


#include "auxy.h"
#include "VisitanteEquipo.h"

class ComponenteEquipo {

    protected:
        char * nombre;
        float precio;

    public:
        virtual void aceptar( VisitanteEquipo visitante);
        float getPrecio();
        char * getNombre();

        ComponenteEquipo(float precion, char* nombre);

};

#endif
