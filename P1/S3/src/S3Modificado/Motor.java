/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package S3Modificado;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author luisg
 */
public class Motor implements Runnable{
    
    private boolean running;
    
    private float RPM;
    private float gas;
    private EstadoMotor estado;
    
    private Controlador controlador;
    private Salpicadero salpicadero;
    
    public void controlar(float g, EstadoMotor estado){
        gas = g;
        this.estado = estado;
    }
    
    Motor(){
        RPM = 0;
    }
    
    public void setReferencias(Controlador controlador, Salpicadero salpicadero){
        this.controlador = controlador;
        this.salpicadero = salpicadero;
    }
    
    public void kill(){
        running = false;
    }
    
    @Override
    public void run(){
        running = true;
        while(running){
            float rozamiento = RPM*0.1f;
            if(rozamiento < 1f){
               rozamiento = 1f;
            }
            RPM = RPM - RPM * 0.1f;
            RPM += gas;
            if(RPM < 0.05){
                RPM =0;
            }
            System.out.println("Vuelta motor");
            salpicadero.pushRPM(RPM,estado);
            controlador.pushRPM(RPM);
            try {
                Thread.sleep(500);
            } catch (InterruptedException ex) {
                Logger.getLogger(Motor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
