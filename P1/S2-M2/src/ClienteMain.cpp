
#include "auxy.h"
#include "Bus.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "VisitantePrecio.h"
#include "VisitantePrecioDetalle.h"
#include "Equipo.h"



using namespace std;


int main(int argc, char * argv[]) {

    VisitantePrecio v1 = VisitantePrecio();
    VisitantePrecioDetalle v2 = VisitantePrecioDetalle();

    Bus b1 = Bus(2.0f,"BusPro");
    Bus b2 = Bus(5.0f,"Buskk");

    Tarjeta t1 = Tarjeta(23.0f,"Nvidia me das");
    Tarjeta t2 = Tarjeta(15.0f,"Amedias");

    Disco d1 = Disco(5.5f,"Frisbe");
    Disco d2 = Disco(7.25f,"AritoPapa");

    Equipo e1 = Equipo(b1,t1,d1);
    Equipo e2 = Equipo(b2,t2,d2);

    cout << "========================================================================" << endl << "EQUIPO 1" << endl << "========================================================================" << endl;

    e1.visitar(v1);
    e1.visitar(v2);

    cout    << "El precio total por el visitante 1 es : " << v1.getTotalPrice() << endl;
    cout    << "El precio total por el visitante 2 es : " << v2.getInfo().first << endl
            << "El nombre de los detalles por el visitante 2 son : " 
            << v2.getInfo().second[0] << " : " 
            << v2.getInfo().second[1] << " : " 
            << v2.getInfo().second[2] << endl;

    cout << "========================================================================" << endl << "EQUIPO 2" << endl << "========================================================================" << endl;

    e2.visitar(v1);
    e2.visitar(v2);

    cout    << "El precio total por el visitante 1 es : " << v1.getTotalPrice() << endl;
    cout    << "El precio total por el visitante 2 es : " << v2.getInfo().first << endl
            << "El nombre de los detalles por el visitante 2 son : " 
            << v2.getInfo().second[0] << " : " 
            << v2.getInfo().second[1] << " : " 
            << v2.getInfo().second[2] << endl;


    return 0;
}