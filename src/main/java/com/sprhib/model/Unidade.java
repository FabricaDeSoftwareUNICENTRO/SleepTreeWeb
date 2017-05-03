/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Fedacz
 */
@Entity
public class Unidade {
    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int codUnidade;
    private float totalUnidade;
    private float total = 0;
    @ManyToOne
    @JoinColumn(name="codTipo")
    private Tipo tipo;
   
    public Unidade(int totalUnidade) {
        
        this.totalUnidade = totalUnidade;
    }
    /**
     * @return the totalUnidade
     */
    public float getTotalUnidade() {
        return totalUnidade;
    }

    /**
     * @param totalUnidade the totalUnidade to set
     */
    public void setTotalUnidade(float totalUnidade) {
        this.totalUnidade = totalUnidade;
    }

    public int getCodUnidade() {
        return codUnidade;
    }

    public void setCodUnidade(int codUnidade) {
        this.codUnidade = codUnidade;
    }

    /**
     * @return the tipo
     */
    public Tipo getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
    
    /**
     * CALCULOS RELACIONADOS A UNIDADES ------------------------------------------------------------
     */
    
    /**
     *
     * @param temps
     * @return
     */
    public ArrayList<ArrayList> utah(ArrayList<ArrayList> temps) {
        ArrayList<ArrayList> lista = new ArrayList<>();
        ArrayList<String> unidadesAnt = new ArrayList<>();
        ArrayList<String> unidades = new ArrayList<>();
        ArrayList<String> totalUnidade = new ArrayList<>();
        total = 0;

        String x = null;
        int i = 0;

        // Verificando temperaturas horas do dia anterior.
        for (i = 0; i < 4; i++) {
            float uni = Float.parseFloat(temps.get(0).get(i).toString());
            x = calculaUtah(uni, x);
            unidadesAnt.add(x);
        }
        // Verificando temperaturas do dia atual.
        for (i = 0; i < 21; i++) {
            float uni = Float.parseFloat(temps.get(1).get(i).toString());
            x = calculaUtah(uni, x);

            total += Float.parseFloat(x);
            unidades.add(x);
        }
        // Total parcial de unidades do dia atual
        totalUnidade.add(String.valueOf(total));

        // Inserindo ArrayList na ArrayList de retorno.
        lista.add(unidadesAnt);
        lista.add(unidades);
        lista.add(totalUnidade);

        return lista;
    }

    private String calculaUtah(float uni, String x) {
        if (uni < (1.5)) {
            x = "0";
        }
        if (uni >= (1.5) && uni < (2.5)) {
            x = "0.5";
        }
        if (uni >= (2.5) && uni < (9.2)) {
            x = "1";
        }
        if (uni >= (9.2) && uni < (12.5)) {
            x = "0.5";
        }
        if (uni >= (12.5) && uni < (16)) {
            x = "0";
        }
        if (uni >= (16.0) && uni < (18.0)) {
            x = "-0.5";
        }
        if (uni >= 18.0) {
            x = "-1.0";
        }
        return x;
    }

    public ArrayList<ArrayList> carolinaDoNorte(ArrayList<ArrayList> temps){
        ArrayList<ArrayList> lista2 = new ArrayList<>();
        ArrayList<String> unidadesAnt = new ArrayList<>();
        ArrayList<String> unidades = new ArrayList<>();
        ArrayList<String> totalUnidade = new ArrayList<>();
        total = 0;

        String x = null;
        float teste = 0;
        float aux2 = 0;
        int h = 0, i;

        for (i = 0; i < 4; i++) {
            String s = calculaCarolina(temps.get(0).get(i).toString(), aux2, h);
            /////////
            java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
            nf.setMinimumFractionDigits(2);
            nf.setMaximumFractionDigits(2);
            
            float help = Float.parseFloat(s);
            String auxvirgula = nf.format(help);
            auxvirgula = auxvirgula.replaceAll(",", ".");
            s = String.valueOf(auxvirgula);
            ////////////
            unidadesAnt.add(s);
        }

        // Verificando temperaturas do dia atual.
        for (i = 0; i < 21; i++) {
            String s = calculaCarolina(temps.get(1).get(i).toString(), aux2, h);
            /////////
            java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
            nf.setMinimumFractionDigits(2);
            nf.setMaximumFractionDigits(2);
            
            float help = Float.parseFloat(s);
            String auxvirgula = nf.format(help);
            auxvirgula = auxvirgula.replaceAll(",", ".");
            s = String.valueOf(auxvirgula);
            ////////////
            total += Float.parseFloat(s);

            String auxvirgula1 = nf.format(total);
            auxvirgula1 = auxvirgula1.replaceAll(",", ".");
            total = Float.parseFloat(auxvirgula1);
            
            System.out.println("total ***********" + total + " s " + s + " hora "+i);
            unidades.add(s);
        }
        // Total parcial de unidades do dia atual
        totalUnidade.add(String.valueOf(total));

        // Inserindo ArrayList na ArrayList de retorno.
        lista2.add(unidadesAnt);
        lista2.add(unidades);
        lista2.add(totalUnidade);

        return lista2;
    }
    
    public void CarolinaDoNorte(List<String> array) {
       String x = null;
        float teste = 0;
        float aux2 = 0;
        int h = 0;
        for (String array1 : array) {
            calculaCarolina(array1, aux2, h);
        }
    }

    private String calculaCarolina(String array1, float aux2, int h) throws NumberFormatException {
         float teste;
        String x;
        float uni = Float.parseFloat(array1);
        teste = 0;
        if (uni <= 1.1) {
            teste = 0;
            aux2 = aux2 + teste;
        }
        if (uni >= 23.3) {
            teste = -2;
            aux2 = aux2 + teste;
        }
        // Interpolacao linear
        if(uni >= 1.1 && uni <= 1.6) {
            teste = (float) (0 + (((uni-1.1)/(1.6-1.1))*(0.5-0)));
            aux2 = aux2 + teste;
        }
        if(uni >= 1.6 && uni <= 7.2) {
            teste = (float) (0.5 + (((uni-1.6)/(7.2-1.6))*(1-0.5)));
            aux2 = aux2 + teste;
        }
        if(uni >= 7.2 && uni <= 13) {
            teste = (float) (1 + (((uni-7.2)/(13-7.2))*(0.5-1)));
            aux2 = aux2 + teste;
        }
        if(uni >= 13 && uni <= 16.5) {
            teste = (float) (0.5 + (((uni-13)/(16.5-13))*(0-0.5)));
            aux2 = aux2 + teste;
        }
        if(uni >= 16.5 && uni <= 19) {
            teste = (float) (0 + (((uni-16.5)/(19-16.5))*(-0.5-0)));
            aux2 = aux2 + teste;
        }
        if(uni >= 19 && uni <= 20.7) {
            teste = (float) (-0.5 + (((uni-19)/(20.7-19))*(-1-(-0.5))));
            aux2 = aux2 + teste;
        }
        if(uni >= 20.7 && uni <= 22.1) {
            teste = (float) (-1 + (((uni-20.7)/(22.1-20.7))*(-1.5-(-1))));
            aux2 = aux2 + teste;
        }
        if(uni >= 22.1 && uni <= 23.3) {
            teste = (float) (-1.5 + (((uni-22.1)/(23.3-22.1))*(-2-(-1.5))));
            aux2 = aux2 + teste;
        }

        java.text.NumberFormat nf = java.text.NumberFormat.getNumberInstance();
        nf.setMinimumFractionDigits(2);
        nf.setMaximumFractionDigits(2);
        
        String auxvirgula = nf.format(teste);
        auxvirgula = auxvirgula.replaceAll(",", ".");
        x = String.valueOf(auxvirgula);
//        unidades.add(x);
        ///////////// teste casas decimais
        String auxvirgula1 = nf.format(aux2);
        auxvirgula1 = auxvirgula1.replaceAll(",", ".");
        aux2 = Float.parseFloat(auxvirgula1);
        ////////////////////
        System.out.println("Temp  " + uni + "\tMedia  " + x + "\t Total " + aux2);
        return x;
    }

    public ArrayList<ArrayList> ponderada(ArrayList<ArrayList> temps){
       ArrayList<ArrayList> lista3 = new ArrayList<>();
        ArrayList<String> unidadesAnt = new ArrayList<>();
        ArrayList<String> unidades = new ArrayList<>();
        ArrayList<String> totalUnidade = new ArrayList<>();

        String x;
        float uni = 0;
        int i;
        total = 0;

        // Verificando temperaturas horas do dia anterior.
        for (i = 0; i < 4; i++) {
            uni = Float.parseFloat(temps.get(0).get(i).toString());
            if (uni >= 7.2) {
                x = "0";
            } else {
                x = "1";
            }
            unidadesAnt.add(x);
        }
        // Verificando temperaturas do dia atual.
        for (i = 0; i < 21; i++) {
            uni = Float.parseFloat(temps.get(1).get(i).toString());
            if (uni >= 7.2) {
                x = "0";
            } else {
                x = "1";
            }
            total += Float.parseFloat(x);
            unidades.add(x);
        }
        // Total parcial de unidades do dia atual
        totalUnidade.add(String.valueOf(total));

        // Inserindo ArrayList na ArrayList de retorno.
        lista3.add(unidadesAnt);
        lista3.add(unidades);
        lista3.add(totalUnidade);

        return lista3;
    }
   
    
}
