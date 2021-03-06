package mx.edu.utez.sisaase.permanencia.bean;

public class BeanCarrera {
    private int idCarrera;
    private String nombreCarrera;
    private String estado;
    private String mCarrera;
    private String oferta;
    private BeanDivisionAcademica idDivision;
    private BeanNivelAcademico idNivelAcademico;
    private BeanEspecialidad idEspecialidad;

    public BeanCarrera(int idCarrera, String nombreCarrera, String estado, String mCarrera, String oferta, BeanDivisionAcademica idDivision, BeanNivelAcademico idNivelAcademico, BeanEspecialidad idEspecialidad) {
        this.idCarrera = idCarrera;
        this.nombreCarrera = nombreCarrera;
        this.estado = estado;
        this.mCarrera = mCarrera;
        this.oferta = oferta;
        this.idDivision = idDivision;
        this.idNivelAcademico = idNivelAcademico;
        this.idEspecialidad = idEspecialidad;
    }

    public BeanCarrera() {

    }

    public BeanEspecialidad getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(BeanEspecialidad idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }



    public int getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
    }

    public String getNombreCarrera() {
        return nombreCarrera;
    }

    public void setNombreCarrera(String nombreCarrera) {
        this.nombreCarrera = nombreCarrera;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getmCarrera() {
        return mCarrera;
    }

    public void setmCarrera(String mCarrera) {
        this.mCarrera = mCarrera;
    }

    public String getOferta() {
        return oferta;
    }

    public void setOferta(String oferta) {
        this.oferta = oferta;
    }

    public BeanDivisionAcademica getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(BeanDivisionAcademica idDivision) {
        this.idDivision = idDivision;
    }

    public BeanNivelAcademico getIdNivelAcademico() {
        return idNivelAcademico;
    }

    public void setIdNivelAcademico(BeanNivelAcademico idNivelAcademico) {
        this.idNivelAcademico = idNivelAcademico;
    }
}
