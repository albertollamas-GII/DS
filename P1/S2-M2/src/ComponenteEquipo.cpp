
#include "auxy.h"
#include "ComponenteEquipo.h"

ComponenteEquipo::ComponenteEquipo(float precio, char * nombre){
    this->precio = precio;
    this->nombre = nombre;
}

std::string ComponenteEquipo::getNombre()const{
    return nombre;
}

float ComponenteEquipo::getPrecio()const{
    return precio;
}

/*void ComponenteEquipo::aceptar(VisitanteEquipo visitante){

}*/
