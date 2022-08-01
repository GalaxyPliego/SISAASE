package mx.edu.utez.sisaase.permanencia.action;

import com.google.gson.Gson;
import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;
import mx.edu.utez.sisaase.permanencia.bean.BeanHorariosAsesoria;
import mx.edu.utez.sisaase.permanencia.bean.BeanMaterias;
import mx.edu.utez.sisaase.permanencia.bean.BeanProfesor;
import mx.edu.utez.sisaase.permanencia.dao.DaoAsesoria;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionAsesoria {
    private String message;
    private String data;
    private BeanAsesorias beanAsesorias;
    private List<BeanHorariosAsesoria> horariosAsesoria;
    private List<BeanAsesorias> listaAsesorias =  new ArrayList<>();
    List<BeanProfesor> profesors = new ArrayList<>();
    List<BeanMaterias> materias = new ArrayList<>();
    BeanMaterias materia = new BeanMaterias();
    private Gson gs = new Gson();

    private Map<String, Object> map = new HashMap<>();
    private boolean error;
     public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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
    public String consultarHorarios() throws SQLException {
        materia = new Gson().fromJson(data,BeanMaterias.class);
        profesors = new DaoAsesoria().consultarHorarios(materia);
        if(profesors.size()>0){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }
    public String consultarMaterias() throws SQLException {
        materias = new DaoAsesoria().consultarMaterias();
        if(materias.size()>0){
            return SUCCESS;
        }else{
            return ERROR;
        }
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

    //  DOCENTEEEEE
    public String consultarAsesoriasPendientesDocenteAction(){
        try {
            //Los datos que nos mandan lo pasamos a un modelo de la clase BeanAsesorias
            map = new DaoAsesoria().consultarAsesoriasPendientesDocente();
            listaAsesorias = (List<BeanAsesorias>) map.get("Data");
            message = (String) map.get("Message");
            error = (boolean) map.get("Error");
        }catch (Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<BeanHorariosAsesoria> getHorariosAsesoria() {
        return horariosAsesoria;
    }

    public void setHorariosAsesoria(List<BeanHorariosAsesoria> horariosAsesoria) {
        this.horariosAsesoria = horariosAsesoria;
    }

    public List<BeanProfesor> getProfesors() {
        return profesors;
    }

    public void setProfesors(List<BeanProfesor> profesors) {
        this.profesors = profesors;
    }

    public List<BeanMaterias> getMaterias() {
        return materias;
    }

    public void setMaterias(List<BeanMaterias> materias) {
        this.materias = materias;
    }

    public BeanMaterias getMateria() {
        return materia;
    }

    public void setMateria(BeanMaterias materia) {
        this.materia = materia;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
