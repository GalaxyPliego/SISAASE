package mx.edu.utez.sisaase.permanencia.action;

import com.google.gson.Gson;
import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;
import mx.edu.utez.sisaase.permanencia.bean.BeanCarrera;
import mx.edu.utez.sisaase.permanencia.bean.BeanIdPeriodoIdCarrera;
import mx.edu.utez.sisaase.permanencia.bean.BeanPeriodoCuatrimestral;
import mx.edu.utez.sisaase.permanencia.dao.DaoHistorial;
import org.apache.struts2.components.Bean;

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

    private List<BeanAsesorias> listHistorialAlumno = new ArrayList<>();
    private BeanAsesorias historialAlumno;

    private List<BeanAsesorias> listHistorialDocente = new ArrayList<>();
    private BeanAsesorias historialDocente;

    private String data;

    /* == > FUNCIONES GENERALES < == */
    public String findPeriodoCuatrimestral() throws SQLException {
        setListPeriodoCuatrimestral(new DaoHistorial().findPeriodoCuatrimestral());
        return SUCCESS;
    }

    public String findCarreras() throws SQLException {
        setListCarrera(new DaoHistorial().findCarreras());
        return SUCCESS;
    }
    /* --------------- */

    /* == > COORDINADOR < == */

    public String findHistorialDetallado() throws SQLException {
        periodoCuatrimestral = new Gson().fromJson(data, BeanPeriodoCuatrimestral.class);
        System.out.println("DATA -> " + periodoCuatrimestral.toString());
        setListHistorialDetallado(new DaoHistorial().findHistorialDetallado(periodoCuatrimestral.getIdPeriodoCuatrimestral()));
        return SUCCESS;
    }

    public String findHistorialGeneral() throws SQLException {
        BeanIdPeriodoIdCarrera idPeriodoCarrera = new Gson().fromJson(data, BeanIdPeriodoIdCarrera.class);
        System.out.println("DATA -> " + idPeriodoCarrera.getPeriodoCuatrimestral() + " " + idPeriodoCarrera.getCarrera());
        setListHistorialGeneral(new DaoHistorial().cambioPeriodoHistorialGeneral(idPeriodoCarrera.getPeriodoCuatrimestral(), idPeriodoCarrera.getCarrera()));
        return SUCCESS;
    }

    /* --------------- */
    public String findHistorialAlumno() throws SQLException {
        setListHistorialAlumno(new DaoHistorial().findHistorialAlumno());
        return SUCCESS;
    }
    public String findHistorialDocente() throws SQLException {
        setListHistorialDocente(new DaoHistorial().findHistorialDocente());
        return SUCCESS;
    }
    public String cambioHistorialDocente() throws SQLException {
        periodoCuatrimestral = new Gson().fromJson(data, BeanPeriodoCuatrimestral.class);
        System.out.println("DATA -> " + periodoCuatrimestral.toString());
        setListHistorialDocente(new DaoHistorial().cambioHistorialDocente(periodoCuatrimestral.getIdPeriodoCuatrimestral()));
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

    public List<BeanAsesorias> getListHistorialAlumno() {
        return listHistorialAlumno;
    }

    public void setListHistorialAlumno(List<BeanAsesorias> listHistorialAlumno) {
        this.listHistorialAlumno = listHistorialAlumno;
    }

    public BeanAsesorias getHistorialAlumno() {
        return historialAlumno;
    }

    public void setHistorialAlumno(BeanAsesorias historialAlumno) {
        this.historialAlumno = historialAlumno;
    }

    public List<BeanAsesorias> getListHistorialDocente() {
        return listHistorialDocente;
    }

    public void setListHistorialDocente(List<BeanAsesorias> listHistorialDocente) {
        this.listHistorialDocente = listHistorialDocente;
    }

    public BeanAsesorias getHistorialDocente() {
        return historialDocente;
    }

    public void setHistorialDocente(BeanAsesorias historialDocente) {
        this.historialDocente = historialDocente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
