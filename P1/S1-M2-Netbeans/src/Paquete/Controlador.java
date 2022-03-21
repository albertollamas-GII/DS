/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

/**
 *
 * @author luisg
 */
public class Controlador {
    
    private double revolucionAlmacenada;
    private ClienteMotor motor;
    private Alarma alarma;
    
    Controlador(ClienteMotor motor){
        this.motor = motor;
        this.alarma = new Alarma(this);
    }
    
    public void acelerar(){
        motor.setEstado(EstadoMotor.ACELERANDO);
    }
    public void frenar(){
        motor.setEstado(EstadoMotor.FRENANDO);
    }
    public void mantener(){
        revolucionAlmacenada = motor.getRevoluciones();
        motor.setEstado(EstadoMotor.MANTENER);
    }
    
    public void reiniciar(){
        double revolucionesActuales = motor.getRevoluciones();
        if( (revolucionAlmacenada-revolucionesActuales) > 0.005 ){
            motor.setEstado(EstadoMotor.ACELERANDO);
        }else if( (revolucionAlmacenada - revolucionesActuales) < 0.005){
            motor.setEstado(EstadoMotor.APAGADO);
        }
        alarma.activar();
    }
    
}
