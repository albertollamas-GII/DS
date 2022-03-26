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
    
    private float RPM;
    private float gas;
    
    private Controlador controlador;
    private Salpicadero salpicadero;
    
    public void controlarGas(float g){
        gas += g;
    }
    
    public float getRPM(){
        return RPM;
    }
    
    Motor(){
        RPM = 0;
    }
    
    public void setReferencias(){
        
    }
    
    @Override
    public void run(){
        RPM = RPM - RPM * 0.1f;
        RPM += gas;
        salpicadero.pushRPM(RPM);
        controlador.pushRPM(RPM);
        try {
            Thread.sleep(1000);
        } catch (InterruptedException ex) {
            Logger.getLogger(Motor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
