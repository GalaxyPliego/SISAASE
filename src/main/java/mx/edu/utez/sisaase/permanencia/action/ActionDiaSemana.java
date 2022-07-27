package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanDiaSemana;
import mx.edu.utez.sisaase.permanencia.dao.DaoDiaSemana;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionDiaSemana {
    private String mesaage;
    private List<BeanDiaSemana> listDiaSemana = new ArrayList<>();
    private String data;
    private BeanDiaSemana diaSemana;

    public String consultarDias() throws SQLException {
        setListDiaSemana(new DaoDiaSemana().consultarDias());
        return SUCCESS;
    }





    public String getMesaage() {
        return mesaage;
    }

    public void setMesaage(String mesaage) {
        this.mesaage = mesaage;
    }

    public List<BeanDiaSemana> getListDiaSemana() {
        return listDiaSemana;
    }

    public void setListDiaSemana(List<BeanDiaSemana> listDiaSemana) {
        this.listDiaSemana = listDiaSemana;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public BeanDiaSemana getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(BeanDiaSemana diaSemana) {
        this.diaSemana = diaSemana;
    }
}
