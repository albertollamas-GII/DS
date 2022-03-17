/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

/**
 *
 * @author albertollamasgonzalez
 */
public abstract class Bicicleta {
    protected int numeroBicicleta;
    
    Bicicleta(int num){
        this.numeroBicicleta = num;
    }
    
    public abstract int getNumeroBicicleta();

}

