package mx.edu.utez.sisaase.permanencia.bean;

public class BeanGeneracion {
    private int idGeneracion;
    private int noGeneracion;
    private String ingresoMes;
    private String ingresoAxo;
    private String egresoMes;
    private String egresoAxo;
    private String estado;
    private BeanNivelAcademico nivelAcademico;

    public BeanGeneracion(int idGeneracion, int noGeneracion, String ingresoMes, String ingresoAxo, String egresoMes, String egresoAxo, String estado, BeanNivelAcademico nivelAcademico) {
        this.idGeneracion = idGeneracion;
        this.noGeneracion = noGeneracion;
        this.ingresoMes = ingresoMes;
        this.ingresoAxo = ingresoAxo;
        this.egresoMes = egresoMes;
        this.egresoAxo = egresoAxo;
        this.estado = estado;
        this.nivelAcademico = nivelAcademico;
    }

    public BeanGeneracion(int noGeneracion, String ingresoMes, String ingresoAxo, String egresoMes, String egresoAxo, String estado, BeanNivelAcademico nivelAcademico) {
        this.noGeneracion = noGeneracion;
        this.ingresoMes = ingresoMes;
        this.ingresoAxo = ingresoAxo;
        this.egresoMes = egresoMes;
        this.egresoAxo = egresoAxo;
        this.estado = estado;
        this.nivelAcademico = nivelAcademico;
    }

    public BeanGeneracion() {

    }

    public BeanGeneracion(int idGeneracion) {
        this.idGeneracion = idGeneracion;
    }

    public int getIdGeneracion() {
        return idGeneracion;
    }

    public void setIdGeneracion(int idGeneracion) {
        this.idGeneracion = idGeneracion;
    }

    public int getNoGeneracion() {
        return noGeneracion;
    }

    public void setNoGeneracion(int noGeneracion) {
        this.noGeneracion = noGeneracion;
    }

    public String getIngresoMes() {
        return ingresoMes;
    }

    public void setIngresoMes(String ingresoMes) {
        this.ingresoMes = ingresoMes;
    }

    public String getIngresoAxo() {
        return ingresoAxo;
    }

    public void setIngresoAxo(String ingresoAxo) {
        this.ingresoAxo = ingresoAxo;
    }

    public String getEgresoMes() {
        return egresoMes;
    }

    public void setEgresoMes(String egresoMes) {
        this.egresoMes = egresoMes;
    }

    public String getEgresoAxo() {
        return egresoAxo;
    }

    public void setEgresoAxo(String egresoAxo) {
        this.egresoAxo = egresoAxo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public BeanNivelAcademico getNivelAcademico() {
        return nivelAcademico;
    }

    public void setNivelAcademico(BeanNivelAcademico nivelAcademico) {
        this.nivelAcademico = nivelAcademico;
    }
}

