
#include "auxy.h"
#include "ComponenteEquipo.h"
#include "VisitanteEquipo.h"

ComponenteEquipo::ComponenteEquipo(float precio, std::string nombre){
    this->precio = precio;
    this->nombre = nombre;
}

std::string ComponenteEquipo::getNombre()const{
    return nombre;
}

float ComponenteEquipo::getPrecio()const{
    return precio;
}