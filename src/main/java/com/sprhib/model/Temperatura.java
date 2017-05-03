/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;


import com.sprhib.dao.TemperaturaDAO;
import com.sprhib.dao.TemperaturaDAOImpl;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
public class Temperatura {
    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int codTemp;
    private GregorianCalendar codTemperatura;
   // private int codArea;
    private float hora6;
    private float hora15;
    private float hora21;
    @ManyToOne
    @JoinColumn(name="codArea")
    private Area area;

    


    public Temperatura(float hora6, float hora15, float hora21) {   
        this.hora6 = hora6;
        this.hora15 = hora15;
        this.hora21 = hora21;
    }

    public Temperatura(GregorianCalendar codTemperatura, float hora6, float hora15, float hora21, Area area) {
        this.codTemperatura = codTemperatura;
        this.hora6 = hora6;
        this.hora15 = hora15;
        this.hora21 = hora21;
        this.area = area;
    }
    
    

    // METODOS PARA CALCULAR INTERPOLAÇÃO DE TERMPERATURAS #################################################
    /**
     * Interpola temperaturas
     * @param tempAnt temperatura das 21h do dia anterior
     * @param tempMin temperatura minima
     * @param tempMax temperatura máxima
     * @param temp21 temperatura das 21h do dia atual
     * @param codArea
     * @param gc
     * @return ArrayList de ArrayList com um ArrayList das temperaturas do dia anterior das 21 as 24h e o outro ArrayList com as temperatuas da meia noite até as 21h do dia atual
     * @throws java.lang.Exception
     */
    public ArrayList<ArrayList> interpolaTempTres(float tempAnt, float tempMin,float  tempMax, float temp21, Area codArea, GregorianCalendar gc) throws Exception{
        float Ty, Tv, Tz;
        GregorianCalendar gcDiaAtual = gc;
        ArrayList<Float> Temp = new ArrayList<>();
        ArrayList<Float> Tempant = new ArrayList<>();
        float h21Ant=0; //vai armazenar a temperatura da hora 21 anterior
       // float T21a, Tm, Tx, T21d, Temp[24],Tempant[24], Ty, Tv, Tz;
       int cont=1, i;
       if(tempAnt == 999){
           // SÓ PARA PEGAR A HORA 21 DO DIA ANTERIOR
           System.out.println("caiu no IF 999/possui dia anterior");
           gc.add(Calendar.DAY_OF_MONTH, -1);
//           String diaAnterior = dataAntString(gc);
           
//           System.out.println("Dia Anterior Temperatura Interpola: "+diaAnterior);
//           conect.conecta();
           // pegando a temperatura das 21horas do dia anterior
           TemperaturaDAOImpl tempDAO = new TemperaturaDAOImpl();
           List<Temperatura> verifica = tempDAO.getTemperaturas();
           for (Temperatura verifica1 : verifica) {
               if(verifica1.getArea().getCodArea()==area.getCodArea() && verifica1.getCodTemperatura().equals(gc) ){
                    h21Ant= verifica1.getHora21();
               }
           }
           // Concluido temperatura 21h. ant.
           
           System.out.println("Hora21 Anterior: "+h21Ant);
           Tempant.add(h21Ant);
           tempAnt = h21Ant;
           // atualiza o gc pro dia normal de volta
           gc.add(Calendar.DAY_OF_MONTH, +1);
       }
       else{
           Tempant.add(tempAnt);
       }
       
        Ty = tempAnt-tempMin;
        Tv = tempMax-tempMin;
        Tz = tempMax-temp21;
        for(i=21;i<24;i++){
		Tempant.add(tempAnt -((cont*Ty)/9));
		cont++;
		}
        for(i=0;i<6;i++){
		Temp.add(tempAnt -((cont*Ty)/9));
		cont++;
        }
        cont=1;

        for(i=6;i<15;i++){
            if (i>5 && i<14){
                Temp.add(Temp.get(5) + ((cont*Tv)/9));
            }
            if(i == 14){
                Temp.add(Temp.get(5) + Tv);
            }
        cont++;
        }
        cont=1;      
        for(i=15;i<21;i++){
            if(i>14 && i<20){
                Temp.add(Temp.get(14) - ((cont*Tz)/6));
            }
            if(i==20){
                Temp.add(Temp.get(14) - Tz);
            }
        cont++;
        }
        ArrayList<ArrayList> temps = new ArrayList<>();
        temps.clear();
        temps.add(Tempant);
        temps.add(Temp);
       
        
        return temps;
    }

   
    
    // GETERS AND SETTERS ##################################################################################
    /**
     * @return the hora6
     */
    public float getHora6() {
        return hora6;
    }

    /**
     * @param hora6 the hora6 to set
     */
    public void setHora6(float hora6) {
        this.hora6 = hora6;
    }

    /**
     * @return the hora15
     */
    public float getHora15() {
        return hora15;
    }

    /**
     * @param hora15 the hora15 to set
     */
    public void setHora15(float hora15) {
        this.hora15 = hora15;
    }

    /**
     * @return the hora21
     */
    public float getHora21() {
        return hora21;
    }

    /**
     * @param hora21 the hora21 to set
     */
    public void setHora21(float hora21) {
        this.hora21 = hora21;
    }

    /**
     * @return the codTemperatura
     */
    public GregorianCalendar getCodTemperatura() {
        return codTemperatura;
    }

    /**
     * @param codTemperatura the codTemperatura to set
     */
    public void setCodTemperatura(GregorianCalendar codTemperatura) {
        this.codTemperatura = codTemperatura;
    }

    /**
     * @return the area
     */
    public Area getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    public void setArea(Area area) {
        this.area = area;
    }
    
    /**
     *
     * @param gc
     * @return a data do dia anterior ao enviado
     * VTemperatura no formato yyyy-mm-dd
     */
    public String dataAntString(GregorianCalendar gc) {
        System.out.println("Data do metodo dataAntString: " + gc.getTime().toString());
        // dando problemas com datas mais antigas
        String dia = gc.getTime().toString().substring(8, 10);
        String mes = gc.getTime().toString().substring(4, 7);
        String ano = "";
        if (gc.getTime().toString().length() == 28) {
            ano = gc.getTime().toString().substring(24, 28);
        } else {
            ano = gc.getTime().toString().substring(25, 29);
        }

        String numMes = "00"; //Nunca deve ocorrer

        //String dataAntString= "00";
        if (mes.equals("Jan")) {
            numMes = "01";
        }
        if (mes.equals("Feb")) {
            numMes = "02";
        }
        if (mes.equals("Mar")) {
            numMes = "03";
        }
        if (mes.equals("Apr")) {
            numMes = "04";
        }
        if (mes.equals("May")) {
            numMes = "05";
        }
        if (mes.equals("Jun")) {
            numMes = "06";
        }
        if (mes.equals("Jul")) {
            numMes = "07";
        }
        if (mes.equals("Aug")) {
            numMes = "08";
        }
        if (mes.equals("Sep")) {
            numMes = "09";
        }
        if (mes.equals("Oct")) {
            numMes = "10";
        }
        if (mes.equals("Nov")) {
            numMes = "11";
        }
        if (mes.equals("Dec")) {
            numMes = "12";
        }

        String novaData = ano + "-" + numMes + "-" + dia;
        System.out.println("Nova Data Metodos Conectando: " + novaData);
        return novaData;
    }

    /**
     * @return the codTemp
     */
    public int getCodTemp() {
        return codTemp;
    }

    /**
     * @param codTemp the codTemp to set
     */
    public void setCodTemp(int codTemp) {
        this.codTemp = codTemp;
    }

    
}
