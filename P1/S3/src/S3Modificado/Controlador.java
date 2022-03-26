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
   
    final int FACTOR_VELOCIDAD = 100;
    private float desiredRPM;
    private EstadoMotor estadoM;
    private Motor motor;
    
    
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
        desiredRPM = RPMactuales;
    }
    
    public void reiniciarAutomatico(){
        estadoM = EstadoMotor.MANTENER;
    }
   
    public void pushRPM(float RPM){
        float gas = 0;
        if(estadoM == EstadoMotor.MANTENER){
            if(RPM > desiredRPM){
                gas = RPM-desiredRPM;
                if(gas< -10) gas = -10;
            }
            if(RPM < desiredRPM){
                gas = desiredRPM - RPM;
                if(gas > 10) gas = 10;
            }
        }else{
            switch (estadoM) {
                case ACELERANDO -> gas = FACTOR_VELOCIDAD;
                case FRENANDO -> gas = -FACTOR_VELOCIDAD;
                default -> gas = 0;
            }
        }
        motor.controlarGas(gas);
    }
}
