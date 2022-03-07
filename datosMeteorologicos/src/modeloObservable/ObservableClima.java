/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloObservable;
import java.util.Observable;

/**
 *
 * @author albertollamasgonzalez
 */
public class ObservableClima extends Observable {
    private float temperatura;
    
    public float getTemperatura(){
        return temperatura;
    }
    
    public void setTemperatura(float temp){
        this.temperatura = temp;
    }
    
}
