#ifndef VISITANTEPRECIODETALLE_H
#define VISITANTEPRECIODETALLE_H

#include "VisitanteEquipo.h"

class VisitantePrecioDetalle : public VisitanteEquipo {
    public:
        void visitarDisco(const Disco & d) override;

        void visitarTarjeta(const Tarjeta & t) override;

        void visitarBus(const Bus & b) override;

        std::pair<float, std::vector<std::string>> getInfo();

    private:
        std::vector<std::string> nombres;

};

#endif
