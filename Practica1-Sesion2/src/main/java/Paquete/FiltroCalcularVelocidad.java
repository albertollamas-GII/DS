/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;
/**
 *
 * @author luisg
 */
public class FiltroCalcularVelocidad implements Filtro{

    int factorVelocidad = 100;
    final int maximoRevoluciones = 5000;

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        switch (estadoMotor) {
            case ENCENDIDO:
                revoluciones += factorVelocidad;
                if(revoluciones > maximoRevoluciones) revoluciones = maximoRevoluciones;
                break;
            case FRENANDO: 
                revoluciones -= factorVelocidad;
                if(revoluciones <0) revoluciones = 0;
                break;
        }
        return revoluciones;
    }
    
    
    
}
