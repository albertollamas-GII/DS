/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package S3Modificado;

import java.lang.invoke.MethodHandles;

/**
 *
 * @author luisg
 */
public class Controlador {
   
    final int FACTOR_VELOCIDAD = 100;
    private float desiredRPM;
    private EstadoMotor estadoM;
    private Motor motor;
    
    private boolean inyectorOn;
    private float valorInyector;
    private boolean alcanzado = false;
    
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
        this.inyectorOn = false;
        valorInyector = 0.0f;
    }
    
    public void encenderAutomatico(float RPMactuales){
        estadoM = EstadoMotor.MANTENER;
        desiredRPM = RPMactuales;
    }
    
    public void reiniciarAutomatico(){
        estadoM = EstadoMotor.MANTENER;
    }
    
    private void actualizarInyector(){
        if(inyectorOn){
            valorInyector += 0.1f;
        }else{
            valorInyector -= 0.1f;
        }
        if(valorInyector >= 1){
            valorInyector = 1;
        }else if(valorInyector <= 0){
            valorInyector = 0;
        }
    }
    
    private void actualizarAlcanzado(float rpm){
        if(Math.abs(desiredRPM - rpm) < 10){
            alcanzado = true;
        }
    }
   
    public void pushRPM(float RPM){
        actualizarInyector();
        actualizarAlcanzado(RPM);
        
        float gas = 0;
        float diferenciaRPM;
        int umbralAceleracion = 100;
        System.out.println("Actual: " + RPM + "\tDeseada :" + desiredRPM);
        if(estadoM == EstadoMotor.REINICIANDO || estadoM == EstadoMotor.MANTENER){
            if(RPM > desiredRPM){ //RPM ACTUAL : 200  DESIRED : 100
                System.out.println("He entrado en el primero");
                diferenciaRPM = RPM-desiredRPM; // 100
                gas = 0;
                if(gas < -umbralAceleracion){ 
                    gas = -umbralAceleracion;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                    alcanzado = true;
                }
            }else if(RPM < desiredRPM){ //RPM ACTUAL : 100 DESIRED : 200
                System.out.println("He entrado en el segundo");
                diferenciaRPM = RPM-desiredRPM; // = 100
                
                gas = -diferenciaRPM*0.25f + RPM*0.1f;
                if(gas > umbralAceleracion){
                    gas = umbralAceleracion;
                }else{
                    estadoM = EstadoMotor.MANTENER;
                    alcanzado = true;
                }
            }
        }else if(estadoM == EstadoMotor.MANTENER){ //MANTENIENDO
            if(Math.abs(RPM-desiredRPM) < FACTOR_VELOCIDAD*0.5 && alcanzado){ 
                inyectorOn = false;
                System.out.print("ENTRA\n");
            }else{
                if(RPM > desiredRPM){ //RPM ACTUAL : 200  DESIRED : 100
                    inyectorOn = false;
                    alcanzado = false;
                    gas = RPM-desiredRPM; //GAS = 100
                    if(gas > FACTOR_VELOCIDAD){ //SE PASA DE GAS
                        gas = -FACTOR_VELOCIDAD;
                    }
                }
                if(RPM < desiredRPM){ //RPM ACTUAL : 100 DESIRED : 200
                    inyectorOn = true;
                    alcanzado = false;
                    gas = ((desiredRPM - RPM)+RPM*0.01f)*valorInyector; //GAS = 100
                    if(gas > FACTOR_VELOCIDAD){ //SE PASA DE GAS
                        gas = FACTOR_VELOCIDAD;
                    }
                }
            }
        }else{
            switch (estadoM) {
                case ACELERANDO:
                    inyectorOn = true;
                    gas = (FACTOR_VELOCIDAD)*valorInyector;
                    break;
                case FRENANDO:
                    inyectorOn = false;
                    gas = -FACTOR_VELOCIDAD;
                    if(RPM<=FACTOR_VELOCIDAD){
                        gas = -RPM;
                    }
                    break;
                case ENCENDIDO:
                    inyectorOn = false;
                    break;
            }
        }
        System.out.println(estadoM + " : " + RPM + " : " + gas + "\n===================");
        motor.controlar(gas,estadoM);
    }
}
