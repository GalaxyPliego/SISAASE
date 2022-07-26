package mx.edu.utez.sisaase.permanencia.bean;

public class BeanCarrera {
    private int idCarrera;
    private String nombreCarrera;
    private String estado;
    private String mCarrera;
    private String oferta;
    private BeanDivisionAcademica idDivision;
    private BeanNivelAcademico idNivelAcademico;

    public BeanCarrera(int idCarrera, String nombreCarrera, String estado, String mCarrera, String oferta, BeanDivisionAcademica idDivision, BeanNivelAcademico idNivelAcademico) {
        this.idCarrera = idCarrera;
        this.nombreCarrera = nombreCarrera;
        this.estado = estado;
        this.mCarrera = mCarrera;
        this.oferta = oferta;
        this.idDivision = idDivision;
        this.idNivelAcademico = idNivelAcademico;
    }

    public BeanCarrera(String nombreCarrera, String estado, String mCarrera, String oferta, BeanDivisionAcademica idDivision, BeanNivelAcademico idNivelAcademico) {
        this.nombreCarrera = nombreCarrera;
        this.estado = estado;
        this.mCarrera = mCarrera;
        this.oferta = oferta;
        this.idDivision = idDivision;
        this.idNivelAcademico = idNivelAcademico;
    }

    public BeanCarrera() {

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
