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
public class BicicletaMontana extends Bicicleta{

    BicicletaMontana(int num) {
        super(num);
    }

    @Override
    public int getNumeroBicicleta() {
        return this.numeroBicicleta;
    }
    
}
