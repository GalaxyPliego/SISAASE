package mx.edu.utez.sisaase.permanencia.action;

import com.google.gson.Gson;
import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;
import mx.edu.utez.sisaase.permanencia.dao.DaoUsuario;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionUsuario {
    private String message;
    private String data;
    private BeanUsuario beanUsuario;
    Map<String,Object> result = new HashMap<>();
    HttpSession session;

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

    public Map<String, Object> getResult() {
        return result;
    }

    public void setResult(Map<String, Object> result) {
        this.result = result;
    }

    public BeanUsuario getBeanUsuario() {
        return beanUsuario;
    }

    public void setBeanUsuario(BeanUsuario beanUsuario) {
        this.beanUsuario = beanUsuario;
    }
    public String iniciarSesion() throws SQLException {
        String result = new DaoUsuario().iniciarSesion(beanUsuario);
        session = ServletActionContext.getRequest().getSession();
        if(result.equals("multiRol")){
            return "multiRol";
        }else if(result.equals("alumno")){
            return "alumno";
        }else if(result.equals("docente")){
            return "docente";
        }else{
            return ERROR;
        }
    }
    public String cerrarSesion() throws SQLException {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.invalidate();
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
