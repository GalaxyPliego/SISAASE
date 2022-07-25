package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanProfesor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionProfesor {
    private String message;
    private String data;
    private BeanProfesor beanProfesor;
    private List<BeanProfesor> listaProfesores = new ArrayList<>();

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

    public BeanProfesor getBeanProfesor() {
        return beanProfesor;
    }

    public void setBeanProfesor(BeanProfesor beanProfesor) {
        this.beanProfesor = beanProfesor;
    }

    public List<BeanProfesor> getListaProfesores() {
        return listaProfesores;
    }

    public void setListaProfesores(List<BeanProfesor> listaProfesores) {
        this.listaProfesores = listaProfesores;
    }

    public String consultarProfesores() throws SQLException {
        return SUCCESS;
    }
}
