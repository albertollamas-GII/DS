
#include "auxy.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "VisitanteEquipo.h"
#include "VisitantePrecio.h"
#include "VisitantePrecioDetalle.h"
#include "Equipo.h"



using namespace std;


int main(int argc, char * argv[]) {

    Bus b1 = Bus(2.0f,"BusPro");
    Bus b2 = Bus(5.0f,"Buskk");

    Disco d1 = Disco(5.5f,"Frisbe");
    Disco d2 = Disco(7.25f,"AritoPapa");
    
    Tarjeta t1 = Tarjeta(23.0f,"Nvidia me das");
    Tarjeta t2 = Tarjeta(15.0f,"Amedias");

    Equipo e1 = Equipo(b1,t1,d1);
    Equipo e2 = Equipo(b2,t2,d2);

    cout << "========================================================================" << endl << "EQUIPO 1" << endl << "========================================================================" << endl;
    VisitantePrecio * vp1 = new VisitantePrecio(TCliente::SinDescuento);
    VisitantePrecioDetalle * vpd1 = new VisitantePrecioDetalle(TCliente::SinDescuento);
    
    e1.visitar(*vp1);
    cout    << "El precio total por el visitante 1 es : " << vp1->getTotalPrice() << endl;
    
    e1.visitar(*vpd1);

    cout << "========================================================================" << endl << "EQUIPO 2" << endl << "========================================================================" << endl;
    
    VisitantePrecio * vp2 = new VisitantePrecio(TCliente::SinDescuento);
    VisitantePrecioDetalle * vpd2 = new VisitantePrecioDetalle(TCliente::SinDescuento);


    e2.visitar(*vp2);
    cout    << "El precio total por el visitante 1 es : " << vp2->getTotalPrice() << endl;
    
    e2.visitar(*vpd2);

    return 0;
}