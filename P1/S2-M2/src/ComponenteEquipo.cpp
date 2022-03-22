
#include "auxy.h"
#include "ComponenteEquipo.h"

ComponenteEquipo::ComponenteEquipo(float precio, char * nombre){
    this->precio = precio;
    this->nombre = nombre;
}

char * ComponenteEquipo::getNombre(){
    return nombre;
}

float ComponenteEquipo::getPrecio(){
    return precio;
}
