#ifndef COMPONENTEEQUIPO_H
#define COMPONENTEEQUIPO_H


#include "auxy.h"
class VisitanteEquipo;

class ComponenteEquipo {

    protected:
        std::string nombre;
        float precio;

    public:
        virtual void aceptar(VisitanteEquipo visitante);
        float getPrecio() const;
        std::string getNombre() const;

        ComponenteEquipo(float precion, char* nombre);

};

#endif
