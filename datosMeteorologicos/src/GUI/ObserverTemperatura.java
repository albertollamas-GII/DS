/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.util.Observable;
import java.util.Observer;
import modeloObservable.ObservableClima;
import modeloObservable.ObservadorGraficaTemperatura;
/**
 *
 * @author albertollamasgonzalez
 */
public class ObserverTemperatura implements Observer {
    
    @Override
    public void update(Observable o, Object o1) {
        if (o1 instanceof ObservadorGraficaTemperatura){
            ObservadorGraficaTemperatura grafica = (ObservadorGraficaTemperatura) o1;
            grafica.getClima().hasChanged();
            grafica.getClima().notifyObservers();
            System.out.println("La nueva temperatura es " + grafica.getClima().getTemperatura());
        }
    }
}
