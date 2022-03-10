/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

/**
 *
 * @author luisg
 */
public class FiltroRepercutirRozamiento implements Filtro {

    float factorRozamiento = 0.1f;
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        return revoluciones - (revoluciones*factorRozamiento);
    }
    
    
    
}
