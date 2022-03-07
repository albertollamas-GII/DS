package com.company;

public class FiltroCalcularVelocidad implements IFiltro{
    private int maxRevoluciones = 5000;
    private int minRevoluciones = 0;

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        switch(estadoMotor){
            case ACELERANDO:
                revoluciones = revoluciones+100 > maxRevoluciones ? revoluciones + 100 : maxRevoluciones;
                break;

            case FRENANDO:
                revoluciones = revoluciones-100 < minRevoluciones ? minRevoluciones : revoluciones-100;
                break;
        }
        return
    }
}
