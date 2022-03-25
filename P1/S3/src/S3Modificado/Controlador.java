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
    private float desiredRPM;
    private EstadoMotor estadoM;
    private boolean modoAutomatico;
    private Motor motor;
    private Salpicadero salpicadero;
    
    Controlador(Motor motor, Salpicadero salpicadero){
        desiredRPM = 0;
        this.modoAutomatico = false;
        this.estadoM = EstadoMotor.APAGADO;
        this.motor = motor;
        this.salpicadero = salpicadero;
    }
    
    public void modificarEstado(EstadoMotor estado){
        this.estadoM = estado;
    }
    
    public void alternarAutomatico(){
        modoAutomatico = !modoAutomatico;
        if(modoAutomatico) desiredRPM = motor.getRPM();
    }
    
    public void reiniciarAutomatico(){
        modoAutomatico = true;
    }
    
    public void pushRPM(float RPM){
        float gas = 0;
        if(modoAutomatico){
            if(RPM > desiredRPM){
                estadoM = EstadoMotor.FRENANDO;
                gas = RPM-desiredRPM;
                if(gas< -10) gas = -10;
            }
            if(RPM < desiredRPM){
                estadoM = EstadoMotor.ACELERANDO;
                gas = desiredRPM - RPM;
                if(gas > 10) gas = 10;
            }
        }else{
            switch (estadoM) {
                case ACELERANDO -> gas = 10;
                case FRENANDO -> gas = -10;
            }
        }
        motor.controlarGas(gas);
        salpicadero.pushEstado(estadoM);
    }
}
