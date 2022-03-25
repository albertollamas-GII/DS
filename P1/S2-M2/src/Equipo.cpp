#include "Equipo.h"
#include "VisitanteEquipo.h"

void Equipo::visitar(VisitanteEquipo & visitante){
    bus.aceptar(visitante);
    disco.aceptar(visitante);
    tarjeta.aceptar(visitante);
}

Equipo::Equipo(Bus b, Tarjeta t, Disco d): bus(b), disco(d), tarjeta(t) {}