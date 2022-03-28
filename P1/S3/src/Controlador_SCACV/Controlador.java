/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador_SCACV;

import Modelo_SCACV.EstadoMotor;
import Modelo_SCACV.Motor;

/**
 *
 * @author Luis Guerra
 * @author Jose Jiménez
 * @author Alberto Llamas
 * @author Óscar López
 */
public class Controlador {
   
    final int FACTOR_VELOCIDAD = 70;
    private float desiredRPM;
    private EstadoMotor estadoM;
    private Motor motor;
    
    public void apagarMotor(){
        motor.kill();
    }
    
    public void modificarEstado(EstadoMotor estado){
        estadoM = estado;
    }
    
    public Controlador(Motor motor){
        desiredRPM = 0;
        this.estadoM = EstadoMotor.APAGADO;
        this.motor = motor;
    }
    
    public void encenderAutomatico(float RPMactuales){
        estadoM = EstadoMotor.MANTENER;
        desiredRPM = RPMactuales;
    }
    
    public void reiniciarAutomatico(){
        estadoM = EstadoMotor.MANTENER;
    }
   
    public void pushRPM(float RPM){
        
        float gas = 0;
        float diferenciaRPM;
        System.out.println("Actual: " + RPM + "\tDeseada :" + desiredRPM);
        if(estadoM == EstadoMotor.REINICIANDO || estadoM == EstadoMotor.MANTENER){
            if(RPM > desiredRPM){ //RPM ACTUAL : 200  DESIRED : 100
                diferenciaRPM = RPM-desiredRPM; // 100
                gas = 0;
                if(gas < -FACTOR_VELOCIDAD){ 
                    gas = -FACTOR_VELOCIDAD;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                }
            }else if(RPM < desiredRPM){ //RPM ACTUAL : 100 DESIRED : 200
                diferenciaRPM = RPM-desiredRPM; // = 100
                
                gas = -diferenciaRPM*0.25f + RPM*0.1f;
                if(gas > FACTOR_VELOCIDAD){
                    gas = FACTOR_VELOCIDAD;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                }
            }
        }else{
            switch (estadoM) {
                case ACELERANDO: 
                    gas = FACTOR_VELOCIDAD + RPM*0.1f;
                    break;
                case FRENANDO:
                    gas = -FACTOR_VELOCIDAD;
                    if(RPM<=FACTOR_VELOCIDAD){
                        gas = -RPM;
                    }
                    break;
            }
        }
        System.out.println(estadoM + " : " + RPM + " : " + gas);
        motor.controlar(gas,estadoM);
    }
}
