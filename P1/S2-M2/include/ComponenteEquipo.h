#ifndef COMPONENTEEQUIPO_H
#define COMPONENTEEQUIPO_H


#include "auxy.h"

class VisitanteEquipo;

class ComponenteEquipo {

    protected:
        const std::string nombre;
        const float precio;
        
        ComponenteEquipo(float precio, std::string nombre);

    public:
        virtual void aceptar(VisitanteEquipo & visitante) const = 0;
        float getPrecio() const;
        std::string getNombre() const;

};

#endif
