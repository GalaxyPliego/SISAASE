package mx.edu.utez.sisaase.permanencia.bean;

public class BeanPeriodoCuatrimestral {
    private int idPeriodoCuatrimestral;
    private String fechaInicio;
    private String fechaFin;
    private String periodoMes;
    private String periodoAxo;
    private String nombreCuatrimestre;

    public BeanPeriodoCuatrimestral() {
    }

    public BeanPeriodoCuatrimestral(int idPeriodoCuatrimestral, String fechaInicio, String fechaFin, String periodoMes, String periodoAxo, String nombreCuatrimestre) {
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.periodoMes = periodoMes;
        this.periodoAxo = periodoAxo;
        this.nombreCuatrimestre = nombreCuatrimestre;
    }

    public BeanPeriodoCuatrimestral(String fechaInicio, String fechaFin, String periodoMes, String periodoAxo, String nombreCuatrimestre) {
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.periodoMes = periodoMes;
        this.periodoAxo = periodoAxo;
        this.nombreCuatrimestre = nombreCuatrimestre;
    }

    public BeanPeriodoCuatrimestral(int idPeriodoCuatrimestral) {
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
    }

    public int getIdPeriodoCuatrimestral() {
        return idPeriodoCuatrimestral;
    }

    public void setIdPeriodoCuatrimestral(int idPeriodoCuatrimestral) {
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getPeriodoMes() {
        return periodoMes;
    }

    public void setPeriodoMes(String periodoMes) {
        this.periodoMes = periodoMes;
    }

    public String getPeriodoAxo() {
        return periodoAxo;
    }

    public void setPeriodoAxo(String periodoAxo) {
        this.periodoAxo = periodoAxo;
    }

    public String getNombreCuatrimestre() {
        return nombreCuatrimestre;
    }

    public void setNombreCuatrimestre(String nombreCuatrimestre) {
        this.nombreCuatrimestre = nombreCuatrimestre;
    }
}
