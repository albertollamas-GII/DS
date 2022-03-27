/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package S3Modificado;

/**
 *
 * @author luisg
 */
public class Controlador {
   
    final int FACTOR_VELOCIDAD = 30;
    private float desiredRPM;
    private EstadoMotor estadoM;
    private Motor motor;
    
    public void apagarMotor(){
        motor.kill();
    }
    
    public void modificarEstado(EstadoMotor estado){
        estadoM = estado;
    }
    
    Controlador(Motor motor){
        desiredRPM = 0;
        this.estadoM = EstadoMotor.APAGADO;
        this.motor = motor;
    }
    
    public void encenderAutomatico(float RPMactuales){
        estadoM = EstadoMotor.MANTENER;
        desiredRPM = RPMactuales*0.9f;
    }
    
    public void reiniciarAutomatico(){
        estadoM = EstadoMotor.MANTENER;
    }
   
    public void pushRPM(float RPM){
        
        float gas = 0;
        
        if(estadoM == EstadoMotor.REINICIANDO || estadoM == EstadoMotor.MANTENER){
            if(RPM > desiredRPM){ //RPM ACTUAL : 200  DESIRED : 100
                gas = RPM-desiredRPM; // //GAS = 100
                if(gas > FACTOR_VELOCIDAD){ 
                    gas = -FACTOR_VELOCIDAD;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                }
            }
            if(RPM < desiredRPM){ //RPM ACTUAL : 100 DESIRED : 200
                gas = desiredRPM - RPM; //GAS = 100
                if(gas > FACTOR_VELOCIDAD){
                    gas = FACTOR_VELOCIDAD;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                }
            }
        }else{
            switch (estadoM) {
                case ACELERANDO -> gas = FACTOR_VELOCIDAD;
                case FRENANDO -> gas = -FACTOR_VELOCIDAD;
            }
        }
        System.out.println(estadoM + " : " + RPM + " : " + gas);
        motor.controlar(gas,estadoM);
    }
}
