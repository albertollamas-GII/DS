/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package s3;

import java.util.Observable;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author luisg
 */
public class ClienteMotor extends Observable implements Runnable{
    
    private EstadoMotor estado;
    private double RPM;
    private GestorFiltros gestor;
    private boolean running = false;

    public ClienteMotor() {
        estado = EstadoMotor.APAGADO;
    }
    
    public void OfrecerGestor(GestorFiltros gestorf){
        gestor = gestorf;
    }
    
    public void kill(){
        running = false;
    }
    
    public void setEstado(EstadoMotor estado){
        this.estado = estado;
    }
    
    public double getRevoluciones(){
        return RPM;
    }
    
    
    @Override
    public void run () { 
        running = true;
        while(this.running){
            RPM = gestor.peticionFiltros(RPM, estado);
            
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {
                Logger.getLogger(ClienteMotor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}