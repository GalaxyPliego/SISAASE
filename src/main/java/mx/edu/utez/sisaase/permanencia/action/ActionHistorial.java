package mx.edu.utez.sisaase.permanencia.action;

import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;
import mx.edu.utez.sisaase.permanencia.bean.BeanCarrera;
import mx.edu.utez.sisaase.permanencia.bean.BeanPeriodoCuatrimestral;
import mx.edu.utez.sisaase.permanencia.dao.DaoHistorial;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.SUCCESS;

public class ActionHistorial {

    private List<BeanPeriodoCuatrimestral> listPeriodoCuatrimestral = new ArrayList<>();
    private BeanPeriodoCuatrimestral periodoCuatrimestral;
    private String message;

    private List<BeanCarrera> listCarrera = new ArrayList<>();
    private BeanCarrera carrera;

    private List<BeanAsesorias> listHistorialDetallado = new ArrayList<>();
    private BeanAsesorias historialDetallado;

    private List<BeanAsesorias> listHistorialGeneral = new ArrayList<>();
    private BeanAsesorias historialGeneral;

    /* == > COORDINADOR < == */

    public String findPeriodoCuatrimestral() throws SQLException {
        setListPeriodoCuatrimestral(new DaoHistorial().findPeriodoCuatrimestral());
        return SUCCESS;
    }

    public String findCarreras() throws SQLException {
        setListCarrera(new DaoHistorial().findCarreras());
        return SUCCESS;
    }

    public String findHistorialDetallado() throws SQLException {
        setListHistorialDetallado(new DaoHistorial().findHistorialDetallado());
        return SUCCESS;
    }

    public String findHistorialGeneral() throws SQLException {
        setListHistorialGeneral(new DaoHistorial().findHistorialGeneral());
        return SUCCESS;
    }

    public String consultarResumenHistorial(){
        return SUCCESS;
    }

    public String consultarHisotrialDetallado(){
        return SUCCESS;
    }

    public String  consultarHisotrialGeneral(){
        return SUCCESS;
    }

    /* == > ALUMNO < == */
    public String consultarHistorialAlumno(){
        return SUCCESS;
    }

    /* == > PROFESOR < == */
    public String consultarHistorialProfesor(){
        return SUCCESS;
    }

    /* == > GETTERS AND SETTERS < == */

    public List<BeanPeriodoCuatrimestral> getListPeriodoCuatrimestral() {
        return listPeriodoCuatrimestral;
    }

    public void setListPeriodoCuatrimestral(List<BeanPeriodoCuatrimestral> listPeriodoCuatrimestral) {
        this.listPeriodoCuatrimestral = listPeriodoCuatrimestral;
    }

    public BeanPeriodoCuatrimestral getPeriodoCuatrimestral() {
        return periodoCuatrimestral;
    }

    public void setPeriodoCuatrimestral(BeanPeriodoCuatrimestral periodoCuatrimestral) {
        this.periodoCuatrimestral = periodoCuatrimestral;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanAsesorias> getListHistorialDetallado() {
        return listHistorialDetallado;
    }

    public void setListHistorialDetallado(List<BeanAsesorias> listHistorialDetallado) {
        this.listHistorialDetallado = listHistorialDetallado;
    }

    public BeanAsesorias getHistorialDetallado() {
        return historialDetallado;
    }

    public void setHistorialDetallado(BeanAsesorias historialDetallado) {
        this.historialDetallado = historialDetallado;
    }

    public List<BeanCarrera> getListCarrera() {
        return listCarrera;
    }

    public void setListCarrera(List<BeanCarrera> listCarrera) {
        this.listCarrera = listCarrera;
    }

    public BeanCarrera getCarrera() {
        return carrera;
    }

    public void setCarrera(BeanCarrera carrera) {
        this.carrera = carrera;
    }

    public List<BeanAsesorias> getListHistorialGeneral() {
        return listHistorialGeneral;
    }

    public void setListHistorialGeneral(List<BeanAsesorias> listHistorialGeneral) {
        this.listHistorialGeneral = listHistorialGeneral;
    }

    public BeanAsesorias getHistorialGeneral() {
        return historialGeneral;
    }

    public void setHistorialGeneral(BeanAsesorias historialGeneral) {
        this.historialGeneral = historialGeneral;
    }
}
