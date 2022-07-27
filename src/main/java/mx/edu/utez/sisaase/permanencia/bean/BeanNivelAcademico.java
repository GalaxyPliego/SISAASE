package mx.edu.utez.sisaase.permanencia.bean;

public class BeanNivelAcademico {
    private int idNivelAcademico;
    private String nivel;
    private String descripcion;

    public BeanNivelAcademico(int idNivelAcademico, String nivel, String descripcion) {
        this.idNivelAcademico = idNivelAcademico;
        this.nivel = nivel;
        this.descripcion = descripcion;
    }

    public BeanNivelAcademico(String nivel, String descripcion) {
        this.nivel = nivel;
        this.descripcion = descripcion;
    }

    public BeanNivelAcademico() {
    }

    public int getIdNivelAcademico() {
        return idNivelAcademico;
    }

    public void setIdNivelAcademico(int idNivelAcademico) {
        this.idNivelAcademico = idNivelAcademico;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
