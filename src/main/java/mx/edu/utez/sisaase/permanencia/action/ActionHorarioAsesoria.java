package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanHorariosAsesoria;
import mx.edu.utez.sisaase.permanencia.dao.DaoHorarioAsesoria;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionHorarioAsesoria {
    private String message;
    private List<BeanHorariosAsesoria> listHorarioAsesoria = new ArrayList<>();
    private String data;
    private BeanHorariosAsesoria horariosAsesoria;

    public String consultarHorarioAsesoria() throws SQLException {
        setListHorarioAsesoria(new DaoHorarioAsesoria().consultarHorario());
        return SUCCESS;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanHorariosAsesoria> getListHorarioAsesoria() {
        return listHorarioAsesoria;
    }

    public void setListHorarioAsesoria(List<BeanHorariosAsesoria> listHorarioAsesoria) {
        this.listHorarioAsesoria = listHorarioAsesoria;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public BeanHorariosAsesoria getHorariosAsesoria() {
        return horariosAsesoria;
    }

    public void setHorariosAsesoria(BeanHorariosAsesoria horariosAsesoria) {
        this.horariosAsesoria = horariosAsesoria;
    }
}
