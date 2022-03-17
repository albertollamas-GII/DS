/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

import java.util.ArrayList;
/**
 *
 * @author albertollamasgonzalez
 */
public abstract class Carrera extends Thread implements Runnable {
    
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
   
}
