package mx.edu.utez.sisaase.permanencia.bean;

public class BeanClase {
    private int idClase;
    private String status;
    private BeanProfesor idProfesor;
    private BeanMaterias idMateria;
    private BeanGrupos idGrupo;

    public BeanClase(int idClase, String status, BeanProfesor idProfesor, BeanMaterias idMateria, BeanGrupos idGrupo) {
        this.idClase = idClase;
        this.status = status;
        this.idProfesor = idProfesor;
        this.idMateria = idMateria;
        this.idGrupo = idGrupo;
    }

    public BeanClase(String status, BeanProfesor idProfesor, BeanMaterias idMateria, BeanGrupos idGrupo) {
        this.status = status;
        this.idProfesor = idProfesor;
        this.idMateria = idMateria;
        this.idGrupo = idGrupo;
    }

    public int getIdClase() {
        return idClase;
    }

    public void setIdClase(int idClase) {
        this.idClase = idClase;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BeanProfesor getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(BeanProfesor idProfesor) {
        this.idProfesor = idProfesor;
    }

    public BeanMaterias getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(BeanMaterias idMateria) {
        this.idMateria = idMateria;
    }

    public BeanGrupos getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(BeanGrupos idGrupo) {
        this.idGrupo = idGrupo;
    }
}
