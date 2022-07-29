package mx.edu.utez.sisaase.permanencia.bean;

public class BeanPlanesEstudio {
    private int idPlan;
    private int axoVigente;
    private int mesVigente;
    private String estado;
    private BeanEspecialidad especialidad;
    private BeanCarrera carrera;

    private BeanProfesorxCarrera profesorxCarrera;

    private BeanPlanesxCarrera planesxCarrera;

    private BeanProfesor profesor;

    private BeanMaterias materias;


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

    public BeanPlanesEstudio(int idPlan, int axoVigente, BeanEspecialidad especialidad, BeanCarrera carrera, BeanProfesorxCarrera profesorxCarrera, BeanPlanesxCarrera planesxCarrera, BeanProfesor profesor, BeanMaterias materias) {
        this.idPlan = idPlan;
        this.axoVigente = axoVigente;
        this.especialidad = especialidad;
        this.carrera = carrera;
        this.profesorxCarrera = profesorxCarrera;
        this.planesxCarrera = planesxCarrera;
        this.profesor = profesor;
        this.materias = materias;
    }

    public BeanPlanesEstudio(int idPlan) {
        this.idPlan = idPlan;
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

    public BeanProfesorxCarrera getProfesorxCarrera() {
        return profesorxCarrera;
    }

    public void setProfesorxCarrera(BeanProfesorxCarrera profesorxCarrera) {
        this.profesorxCarrera = profesorxCarrera;
    }

    public BeanPlanesxCarrera getPlanesxCarrera() {
        return planesxCarrera;
    }

    public void setPlanesxCarrera(BeanPlanesxCarrera planesxCarrera) {
        this.planesxCarrera = planesxCarrera;
    }

    public BeanProfesor getProfesor() {
        return profesor;
    }

    public void setProfesor(BeanProfesor profesor) {
        this.profesor = profesor;
    }

    public BeanMaterias getMaterias() {
        return materias;
    }

    public void setMaterias(BeanMaterias materias) {
        this.materias = materias;
    }
}
