/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author albertollamasgonzalez
 */
public abstract class Carrera extends Thread implements Runnable {
    
    private final int DURACION_CARRERA = 60; //Duración en segundos
    protected ArrayList<Bicicleta> bicicletas;
    protected TipoCarrera tipo;
    protected int numBicicletas;
    
    
    Carrera(int numBicicletas, TipoCarrera tipo){
        this.tipo = tipo;
        this.bicicletas = new ArrayList<>();
        this.numBicicletas = numBicicletas;
    }
    
    TipoCarrera getTipo(){
        return this.tipo;
    }
    
    public void addBicicleta(Bicicleta bici){
        this.bicicletas.add(bici);
    }
    
    @Override
    public abstract void run();
    
        
    public synchronized void comienzaCarrera(TipoCarrera tipo, double porcentajeRetirados){
        try {
            String indent = "";
            if (tipo == TipoCarrera.MONTANA)
                indent = "\t";
                    
            Random random = new Random();
                
            System.out.println(indent + "Comienza la carrera de " + tipo.toString() + " !");
            int retirados = (int) (this.numBicicletas * porcentajeRetirados);
            int ciclistaAleatorio;
            
            for (int i=0; i<DURACION_CARRERA; i++){
                if(i > 15 && retirados !=0){ //Supongo que se retira un ciclista cada segundo a partir de un cuarto de la carrera
                    ciclistaAleatorio = random.nextInt(this.bicicletas.size());
                    System.out.println(indent + "Se retira el ciclista " + ciclistaAleatorio + " porque le ha dado un tirón. Quedan " + bicicletas.size() + " ciclistas.");
                    this.bicicletas.remove(ciclistaAleatorio);
                    retirados--;
                }
                this.sleep(1000); //Dormimos la hebra durante un segundo;
            }
        } catch (InterruptedException ex) {
                    Logger.getLogger(CarreraMontana.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
