package mx.edu.utez.sisaase.permanencia.bean;

public class BeanAsignacionRolUsuario {
    private int idAsignacionRolUsuario;
    private int idDivision;
    private int idAcademia;
    private BeanRol idRol;
    private BeanUsuario idUsuario;

    public BeanAsignacionRolUsuario(int idAsignacionRolUsuario, int idDivision, int idAcademia, BeanRol idRol, BeanUsuario idUsuario) {
        this.idAsignacionRolUsuario = idAsignacionRolUsuario;
        this.idDivision = idDivision;
        this.idAcademia = idAcademia;
        this.idRol = idRol;
        this.idUsuario = idUsuario;
    }

    public BeanAsignacionRolUsuario(int idDivision, int idAcademia, BeanRol idRol, BeanUsuario idUsuario) {
        this.idDivision = idDivision;
        this.idAcademia = idAcademia;
        this.idRol = idRol;
        this.idUsuario = idUsuario;
    }

    public int getIdAsignacionRolUsuario() {
        return idAsignacionRolUsuario;
    }

    public void setIdAsignacionRolUsuario(int idAsignacionRolUsuario) {
        this.idAsignacionRolUsuario = idAsignacionRolUsuario;
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public int getIdAcademia() {
        return idAcademia;
    }

    public void setIdAcademia(int idAcademia) {
        this.idAcademia = idAcademia;
    }

    public BeanRol getIdRol() {
        return idRol;
    }

    public void setIdRol(BeanRol idRol) {
        this.idRol = idRol;
    }

    public BeanUsuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(BeanUsuario idUsuario) {
        this.idUsuario = idUsuario;
    }
}
