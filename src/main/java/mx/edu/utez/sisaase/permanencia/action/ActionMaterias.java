package mx.edu.utez.sisaase.permanencia.action;

import com.google.gson.Gson;
import mx.edu.utez.sisaase.permanencia.bean.BeanPlanesEstudio;
import mx.edu.utez.sisaase.permanencia.dao.DaoMaterias;

import java.sql.SQLException;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionMaterias {
    private String message;
    private List<BeanPlanesEstudio> listPlanesEstudio;
    private String data;
    private BeanPlanesEstudio planesEstudio;

    public String consultarPlanesEstudio () throws SQLException {
        setListPlanesEstudio(new DaoMaterias().consultarPlanesEstudio());
        planesEstudio = new Gson().fromJson(data, BeanPlanesEstudio.class);
        return SUCCESS;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanPlanesEstudio> getListPlanesEstudio() {
        return listPlanesEstudio;
    }

    public void setListPlanesEstudio(List<BeanPlanesEstudio> listPlanesEstudio) {
        this.listPlanesEstudio = listPlanesEstudio;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public BeanPlanesEstudio getPlanesEstudio() {
        return planesEstudio;
    }

    public void setPlanesEstudio(BeanPlanesEstudio planesEstudio) {
        this.planesEstudio = planesEstudio;
    }
}
