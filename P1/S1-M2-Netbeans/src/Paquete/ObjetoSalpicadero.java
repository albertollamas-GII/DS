/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Paquete;

import static java.lang.Math.PI;

/**
 *
 * @author luisg
 */
public class ObjetoSalpicadero extends javax.swing.JFrame {

    private static ClienteMotor motor;
    /**
     * Creates new form FramePrincipal
     */
    public ObjetoSalpicadero() {
        initComponents();
        Freno.setEnabled(false);
        Acelerador.setEnabled(false);
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        EncendidoApagado = new javax.swing.JToggleButton();
        Acelerador = new javax.swing.JToggleButton();
        Freno = new javax.swing.JToggleButton();
        Informacion = new javax.swing.JLabel();
        VelocimetroCampo = new javax.swing.JLabel();
        VelocimetroLabel = new javax.swing.JLabel();
        CuentaKilometrosLabel = new javax.swing.JLabel();
        ContadorRecienteCampo = new javax.swing.JLabel();
        ContadorTotalCampo = new javax.swing.JLabel();
        CuentaRevolucionesLabel = new javax.swing.JLabel();
        RevolucionesCampo = new javax.swing.JLabel();
        ContadorTotalLabel = new javax.swing.JLabel();
        ContadorRecienteLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        EncendidoApagado.setText("Encendido");
        EncendidoApagado.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EncendidoApagadoActionPerformed(evt);
            }
        });

        Acelerador.setText("Acelerador");
        Acelerador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AceleradorActionPerformed(evt);
            }
        });

        Freno.setText("Freno");
        Freno.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                FrenoActionPerformed(evt);
            }
        });

        Informacion.setText("Informacion");

        VelocimetroCampo.setText("0 KM/H");

        VelocimetroLabel.setText("Velocimetro");

        CuentaKilometrosLabel.setText("CuentaKilometros");

        ContadorRecienteCampo.setText("0");

        ContadorTotalCampo.setText("0");

        CuentaRevolucionesLabel.setText("CuentaRevoluciones");

        RevolucionesCampo.setText("0 RPM");

        ContadorTotalLabel.setText("ContadorTotal");

        ContadorRecienteLabel.setText("Contador Reciente");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(ContadorRecienteLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(ContadorRecienteCampo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(12, 12, 12))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(VelocimetroLabel)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(EncendidoApagado, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(Acelerador, javax.swing.GroupLayout.PREFERRED_SIZE, 205, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(Informacion, javax.swing.GroupLayout.PREFERRED_SIZE, 314, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(Freno, javax.swing.GroupLayout.DEFAULT_SIZE, 98, Short.MAX_VALUE)
                        .addGap(24, 24, 24))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(VelocimetroCampo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(ContadorTotalLabel)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(ContadorTotalCampo, javax.swing.GroupLayout.PREFERRED_SIZE, 342, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(RevolucionesCampo)
                            .addComponent(CuentaRevolucionesLabel)
                            .addComponent(CuentaKilometrosLabel))
                        .addGap(0, 0, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(Informacion)
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(EncendidoApagado)
                    .addComponent(Freno)
                    .addComponent(Acelerador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(31, 31, 31)
                .addComponent(VelocimetroLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(VelocimetroCampo)
                .addGap(18, 18, 18)
                .addComponent(CuentaKilometrosLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ContadorRecienteLabel)
                    .addComponent(ContadorRecienteCampo))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ContadorTotalLabel)
                    .addComponent(ContadorTotalCampo))
                .addGap(18, 18, 18)
                .addComponent(CuentaRevolucionesLabel)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(RevolucionesCampo)
                .addGap(82, 82, 82))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void EncendidoApagadoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EncendidoApagadoActionPerformed
        if(EncendidoApagado.isSelected()){
            Acelerador.setEnabled(true);
            Freno.setEnabled(true);
            EncendidoApagado.setText("Apagar");
            Informacion.setText("Encendido");
            motor.setEstado(EstadoMotor.ENCENDIDO);
        } else{
            if(Acelerador.isSelected()) Acelerador.doClick();
            Acelerador.setEnabled(false);
            if(Freno.isSelected())Freno.doClick();
            Freno.setEnabled(false);
            EncendidoApagado.setText("Encender");
            Informacion.setText("Apagado");
            motor.setEstado(EstadoMotor.APAGADO);
        }
    }//GEN-LAST:event_EncendidoApagadoActionPerformed

    private void AceleradorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AceleradorActionPerformed
        // TODO add your handling code here:
        if(Acelerador.isSelected()){
            Acelerador.setText("Soltar acelerador");
            if(Freno.isSelected())Freno.doClick();
            Informacion.setText("Acelerando");
            motor.setEstado(EstadoMotor.ACELERANDO);
        }else{
            Acelerador.setText("Acelerar");
            Informacion.setText("Encendido");
            motor.setEstado(EstadoMotor.ENCENDIDO);
        }
    }//GEN-LAST:event_AceleradorActionPerformed

    private void FrenoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_FrenoActionPerformed
        if( Freno.isSelected() ){
            Freno.setText("Soltar freno");
            if(Acelerador.isSelected())Acelerador.doClick();
            Informacion.setText("Frenando");
            motor.setEstado(EstadoMotor.FRENANDO);
        }else{
            Freno.setText("Frenar");
            Informacion.setText("Encendido");
            motor.setEstado(EstadoMotor.ENCENDIDO);
            
        }
    }//GEN-LAST:event_FrenoActionPerformed

    public void ejecutar(double revoluciones, EstadoMotor estadoMotor){
        VelocimetroCampo.setText( (2 * PI * 0.15 * revoluciones * (60f/1000f)) + " KM/H");
        //Velocimetro.repaint();
    }
    
    public static void aplicarMotor(ClienteMotor mot){
        motor = mot;
    }
    


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton Acelerador;
    private javax.swing.JLabel ContadorRecienteCampo;
    private javax.swing.JLabel ContadorRecienteLabel;
    private javax.swing.JLabel ContadorTotalCampo;
    private javax.swing.JLabel ContadorTotalLabel;
    private javax.swing.JLabel CuentaKilometrosLabel;
    private javax.swing.JLabel CuentaRevolucionesLabel;
    private javax.swing.JToggleButton EncendidoApagado;
    private javax.swing.JToggleButton Freno;
    private javax.swing.JLabel Informacion;
    private javax.swing.JLabel RevolucionesCampo;
    private javax.swing.JLabel VelocimetroCampo;
    private javax.swing.JLabel VelocimetroLabel;
    // End of variables declaration//GEN-END:variables
}
