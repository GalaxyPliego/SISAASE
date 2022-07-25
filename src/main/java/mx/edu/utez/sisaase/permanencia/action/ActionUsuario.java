package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;

import java.sql.SQLException;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionUsuario {
    private String message;
    private String data;
    private BeanUsuario beanUsuario;

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

    public BeanUsuario getBeanUsuario() {
        return beanUsuario;
    }

    public void setBeanUsuario(BeanUsuario beanUsuario) {
        this.beanUsuario = beanUsuario;
    }
    public String iniciarSesion() throws SQLException {
        return SUCCESS;
    }
    public String recuperarContrasexa() throws SQLException {
        return SUCCESS;
    }
    public String nuevaContrasexa() throws SQLException {
        return SUCCESS;
    }
    public String cambiarContrasexa() throws SQLException {
        return SUCCESS;
    }
    public String cambiarDatos() throws SQLException {
        return SUCCESS;
    }
}
