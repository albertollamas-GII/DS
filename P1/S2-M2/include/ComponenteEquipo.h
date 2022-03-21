#ifndef COMPONENTEEQUIPO_H
#define COMPONENTEEQUIPO_H


#include "auxy.h"

class ComponenteEquipo {

    private:
        char nombre;

        float precio;

    public:
        virtual void aceptar(int visitante);

};

#endif
