package mx.edu.utez.sisaase.permanencia.bean;

public class BeanDivisionAcademica {
    private int idDivision;
    private String nombreDivision;
    private String abreviatura;
    private BeanProfesor idDirectivo;

    public BeanDivisionAcademica(int idDivision, String nombreDivision, String abreviatura, BeanProfesor idDirectivo) {
        this.idDivision = idDivision;
        this.nombreDivision = nombreDivision;
        this.abreviatura = abreviatura;
        this.idDirectivo = idDirectivo;
    }

    public BeanDivisionAcademica() {
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public String getNombreDivision() {
        return nombreDivision;
    }

    public void setNombreDivision(String nombreDivision) {
        this.nombreDivision = nombreDivision;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }

    public BeanProfesor getIdDirectivo() {
        return idDirectivo;
    }

    public void setIdDirectivo(BeanProfesor idDirectivo) {
        this.idDirectivo = idDirectivo;
    }

    @Override
    public String toString() {
        return "BeanProfesor{" +
                "idDivision=" + idDivision +
                ", nombreDivision='" + nombreDivision + '\'' +
                ", abreviatura='" + abreviatura + '\'' +
                ", idDirectivo=" + idDirectivo +
                '}';
    }
}

