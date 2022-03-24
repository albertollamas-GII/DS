
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

    v1.getTotalPrice();
    v2.getInfo();

    return 0;
}