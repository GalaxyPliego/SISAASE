package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionAsesoria {
    private String message;
    private String data;
    private BeanAsesorias beanAsesorias;
    private List<BeanAsesorias> listaAsesorias =  new ArrayList<>();

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public BeanAsesorias getBeanAsesorias() {
        return beanAsesorias;
    }

    public void setBeanAsesorias(BeanAsesorias beanAsesorias) {
        this.beanAsesorias = beanAsesorias;
    }

    public List<BeanAsesorias> getListaAsesorias() {
        return listaAsesorias;
    }

    public void setListaAsesorias(List<BeanAsesorias> listaAsesorias) {
        this.listaAsesorias = listaAsesorias;
    }

    public String consultarAsesorias() throws SQLException {
        return SUCCESS;
    }
    public String solicitarAsesoria() throws SQLException {
        return SUCCESS;
    }
    public String cancelarAsesoria() throws SQLException {
        return SUCCESS;
    }
    public String finalizarAsesoria() throws SQLException {
        return SUCCESS;
    }
}
