/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package S2M1;

/**
 *
 * @author Alberto Llamas
 * @author Óscar López
 */
public class FactoriaCarretera implements FactoriaCarreraYBicicleta{
        
        @Override
        public CarreraCarretera crearCarrera(int numCarrera){
            return new CarreraCarretera(numCarrera);
        }
        
        @Override
        public BicicletaCarretera crearBicicleta(int id){
            return new BicicletaCarretera(id);
        }

}
