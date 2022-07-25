package mx.edu.utez.sisaase.permanencia.bean;

public class BeanPlanesEstudio {
    private int idPlan;
    private int axoVigente;
    private int mesVigente;
    private String estado;
    private BeanEspecialidad especialidad;
    private BeanCarrera carrera;

    public BeanPlanesEstudio() {
    }

    public BeanPlanesEstudio(int idPlan, int axoVigente, int mesVigente, String estado, BeanEspecialidad especialidad, BeanCarrera carrera) {
        this.idPlan = idPlan;
        this.axoVigente = axoVigente;
        this.mesVigente = mesVigente;
        this.estado = estado;
        this.especialidad = especialidad;
        this.carrera = carrera;
    }

    public BeanPlanesEstudio(int axoVigente, int mesVigente, String estado, BeanEspecialidad especialidad, BeanCarrera carrera) {
        this.axoVigente = axoVigente;
        this.mesVigente = mesVigente;
        this.estado = estado;
        this.especialidad = especialidad;
        this.carrera = carrera;
    }

    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

    public int getAxoVigente() {
        return axoVigente;
    }

    public void setAxoVigente(int axoVigente) {
        this.axoVigente = axoVigente;
    }

    public int getMesVigente() {
        return mesVigente;
    }

    public void setMesVigente(int mesVigente) {
        this.mesVigente = mesVigente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public BeanEspecialidad getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(BeanEspecialidad especialidad) {
        this.especialidad = especialidad;
    }

    public BeanCarrera getCarrera() {
        return carrera;
    }

    public void setCarrera(BeanCarrera carrera) {
        this.carrera = carrera;
    }

}
