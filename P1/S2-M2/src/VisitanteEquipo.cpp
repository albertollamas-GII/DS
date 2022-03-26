#include "VisitanteEquipo.h"

VisitanteEquipo::VisitanteEquipo(TCliente tipo): tipo(tipo){
    switch (tipo)
    {
    case Estudiante:
        descuento = 0.1f;
        break;
    case Mayorista:
        descuento = 0.15f;
        break;
    case SinDescuento:
        descuento = 0.0f;
        break;
    
    default:
        break;
    }
};
 