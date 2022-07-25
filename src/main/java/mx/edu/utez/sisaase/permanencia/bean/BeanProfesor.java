package mx.edu.utez.sisaase.permanencia.bean;

public class BeanProfesor {    private int idProfesor;
    private String nombres;
    private String aPaterno;
    private String aMaterno;
    private String emailInst;
    private String cedulaProf;
    private String nivelMaxEstudios;
    private String titulo;
    private String emailPart;
    private String tipoProfesor;
    private String telefono;
    private String semblanza;
    private String curp;
    private String estado;
    private String sexo;

    public BeanProfesor(int idProfesor, String nombres, String aPaterno, String aMaterno, String emailInst, String cedulaProf, String nivelMaxEstudios, String titulo, String emailPart, String tipoProfesor, String telefono, String semblanza, String curp, String estado, String sexo) {
        this.idProfesor = idProfesor;
        this.nombres = nombres;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.emailInst = emailInst;
        this.cedulaProf = cedulaProf;
        this.nivelMaxEstudios = nivelMaxEstudios;
        this.titulo = titulo;
        this.emailPart = emailPart;
        this.tipoProfesor = tipoProfesor;
        this.telefono = telefono;
        this.semblanza = semblanza;
        this.curp = curp;
        this.estado = estado;
        this.sexo = sexo;
    }

    public BeanProfesor(String nombres, String aPaterno, String aMaterno, String emailInst, String cedulaProf, String nivelMaxEstudios, String titulo, String emailPart, String tipoProfesor, String telefono, String semblanza, String curp, String estado, String sexo) {
        this.nombres = nombres;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.emailInst = emailInst;
        this.cedulaProf = cedulaProf;
        this.nivelMaxEstudios = nivelMaxEstudios;
        this.titulo = titulo;
        this.emailPart = emailPart;
        this.tipoProfesor = tipoProfesor;
        this.telefono = telefono;
        this.semblanza = semblanza;
        this.curp = curp;
        this.estado = estado;
        this.sexo = sexo;
    }

    public BeanProfesor() {
    }

    public int getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(int idProfesor) {
        this.idProfesor = idProfesor;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getaPaterno() {
        return aPaterno;
    }

    public void setaPaterno(String aPaterno) {
        this.aPaterno = aPaterno;
    }

    public String getaMaterno() {
        return aMaterno;
    }

    public void setaMaterno(String aMaterno) {
        this.aMaterno = aMaterno;
    }

    public String getEmailInst() {
        return emailInst;
    }

    public void setEmailInst(String emailInst) {
        this.emailInst = emailInst;
    }

    public String getCedulaProf() {
        return cedulaProf;
    }

    public void setCedulaProf(String cedulaProf) {
        this.cedulaProf = cedulaProf;
    }

    public String getNivelMaxEstudios() {
        return nivelMaxEstudios;
    }

    public void setNivelMaxEstudios(String nivelMaxEstudios) {
        this.nivelMaxEstudios = nivelMaxEstudios;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEmailPart() {
        return emailPart;
    }

    public void setEmailPart(String emailPart) {
        this.emailPart = emailPart;
    }

    public String getTipoProfesor() {
        return tipoProfesor;
    }

    public void setTipoProfesor(String tipoProfesor) {
        this.tipoProfesor = tipoProfesor;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getSemblanza() {
        return semblanza;
    }

    public void setSemblanza(String semblanza) {
        this.semblanza = semblanza;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    @Override
    public String toString() {
        return "BeanProfesor{" +
                "idProfesor=" + idProfesor +
                ", nombres='" + nombres + '\'' +
                ", aPaterno='" + aPaterno + '\'' +
                ", aMaterno='" + aMaterno + '\'' +
                ", emailInst='" + emailInst + '\'' +
                ", cedulaProf='" + cedulaProf + '\'' +
                ", nivelMaxEstudios='" + nivelMaxEstudios + '\'' +
                ", titulo='" + titulo + '\'' +
                ", emailPart='" + emailPart + '\'' +
                ", tipoProfesor='" + tipoProfesor + '\'' +
                ", telefono='" + telefono + '\'' +
                ", semblanza='" + semblanza + '\'' +
                ", curp='" + curp + '\'' +
                ", estado='" + estado + '\'' +
                ", sexo='" + sexo + '\'' +
                '}';
    }
}
