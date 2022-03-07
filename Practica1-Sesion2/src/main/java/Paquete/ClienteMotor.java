/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Paquete;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author luisg
 */
public class ClienteMotor extends Thread{
    
    public EstadoMotor estado;
    private double RPM;
    public GestorFiltros gestor;
    private boolean running = false;

    public ClienteMotor() {
        
        gestor = new GestorFiltros();
        
        
    }
    
    public void kill(){
        running = false;
    }
    
    
    @Override
    public void run () { 
        running = true;
        while(this.running){
            gestor.peticionFiltros(RPM, estado);
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
                Logger.getLogger(ClienteMotor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
