package mx.edu.utez.sisaase.permanencia.bean;

public class BeanGrupos {
    private int idGrupo;
    private int cuatrimestre;
    private String grupo;
    private String status;
    private int capacidad;
    private int periodoAxo;
    private String periodoMes;
    private String turno;
    private BeanEspecialidad idEspecialidad;
    private BeanGeneracion idGeneracion;
    private BeanCarrera idCarrera;

    public BeanGrupos(int idGrupo, int cuatrimestre, String grupo, String status, int capacidad, int periodoAxo, String periodoMes, String turno, BeanEspecialidad idEspecialidad, BeanGeneracion idGeneracion, BeanCarrera idCarrera) {
        this.idGrupo = idGrupo;
        this.cuatrimestre = cuatrimestre;
        this.grupo = grupo;
        this.status = status;
        this.capacidad = capacidad;
        this.periodoAxo = periodoAxo;
        this.periodoMes = periodoMes;
        this.turno = turno;
        this.idEspecialidad = idEspecialidad;
        this.idGeneracion = idGeneracion;
        this.idCarrera = idCarrera;
    }

    public BeanGrupos(int cuatrimestre, String grupo, String status, int capacidad, int periodoAxo, String periodoMes, String turno, BeanEspecialidad idEspecialidad, BeanGeneracion idGeneracion, BeanCarrera idCarrera) {
        this.cuatrimestre = cuatrimestre;
        this.grupo = grupo;
        this.status = status;
        this.capacidad = capacidad;
        this.periodoAxo = periodoAxo;
        this.periodoMes = periodoMes;
        this.turno = turno;
        this.idEspecialidad = idEspecialidad;
        this.idGeneracion = idGeneracion;
        this.idCarrera = idCarrera;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public int getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(int cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getPeriodoAxo() {
        return periodoAxo;
    }

    public void setPeriodoAxo(int periodoAxo) {
        this.periodoAxo = periodoAxo;
    }

    public String getPeriodoMes() {
        return periodoMes;
    }

    public void setPeriodoMes(String periodoMes) {
        this.periodoMes = periodoMes;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public BeanEspecialidad getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(BeanEspecialidad idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public BeanGeneracion getIdGeneracion() {
        return idGeneracion;
    }

    public void setIdGeneracion(BeanGeneracion idGeneracion) {
        this.idGeneracion = idGeneracion;
    }

    public BeanCarrera getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(BeanCarrera idCarrera) {
        this.idCarrera = idCarrera;
    }
}
