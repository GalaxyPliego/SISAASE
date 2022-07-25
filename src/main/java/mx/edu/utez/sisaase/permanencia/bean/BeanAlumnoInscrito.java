package mx.edu.utez.sisaase.permanencia.bean;

public class BeanAlumnoInscrito {
    private String matricula;
    private String aPaterno;
    private String aMaterno;
    private String nombres;
    private String fechaNac;
    private int edad;
    private String sexo;
    private String estadoCivil;
    private String domActual;
    private String colonia;
    private int cp;
    private String telefono;
    private String cel;
    private String email;
    private String curp;
    private String nacionalidad;
    private String trabaja;
    private int ingresoMensual;
    private String tipoSangre;
    private String nombreTutor;
    private String noIMSS;
    private String status;
    private BeanGeneracion idGeneracion;
    private BeanGrupos idGrupoActual;
    private BeanCarrera idCarrera;

    public BeanAlumnoInscrito(String matricula, String aPaterno, String aMaterno, String nombres, String fechaNac, int edad, String sexo, String estadoCivil, String domActual, String colonia, int cp, String telefono, String cel, String email, String curp, String nacionalidad, String trabaja, int ingresoMensual, String tipoSangre, String nombreTutor, String noIMSS, String status, BeanGeneracion idGeneracion, BeanGrupos idGrupoActual, BeanCarrera idCarrera) {
        this.matricula = matricula;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.nombres = nombres;
        this.fechaNac = fechaNac;
        this.edad = edad;
        this.sexo = sexo;
        this.estadoCivil = estadoCivil;
        this.domActual = domActual;
        this.colonia = colonia;
        this.cp = cp;
        this.telefono = telefono;
        this.cel = cel;
        this.email = email;
        this.curp = curp;
        this.nacionalidad = nacionalidad;
        this.trabaja = trabaja;
        this.ingresoMensual = ingresoMensual;
        this.tipoSangre = tipoSangre;
        this.nombreTutor = nombreTutor;
        this.noIMSS = noIMSS;
        this.status = status;
        this.idGeneracion = idGeneracion;
        this.idGrupoActual = idGrupoActual;
        this.idCarrera = idCarrera;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
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

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getDomActual() {
        return domActual;
    }

    public void setDomActual(String domActual) {
        this.domActual = domActual;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCel() {
        return cel;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getTrabaja() {
        return trabaja;
    }

    public void setTrabaja(String trabaja) {
        this.trabaja = trabaja;
    }

    public int getIngresoMensual() {
        return ingresoMensual;
    }

    public void setIngresoMensual(int ingresoMensual) {
        this.ingresoMensual = ingresoMensual;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public String getNombreTutor() {
        return nombreTutor;
    }

    public void setNombreTutor(String nombreTutor) {
        this.nombreTutor = nombreTutor;
    }

    public String getNoIMSS() {
        return noIMSS;
    }

    public void setNoIMSS(String noIMSS) {
        this.noIMSS = noIMSS;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BeanGeneracion getIdGeneracion() {
        return idGeneracion;
    }

    public void setIdGeneracion(BeanGeneracion idGeneracion) {
        this.idGeneracion = idGeneracion;
    }

    public BeanGrupos getIdGrupoActual() {
        return idGrupoActual;
    }

    public void setIdGrupoActual(BeanGrupos idGrupoActual) {
        this.idGrupoActual = idGrupoActual;
    }

    public BeanCarrera getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(BeanCarrera idCarrera) {
        this.idCarrera = idCarrera;
    }

    @Override
    public String toString() {
        return "BeanAlumnoInscrito{" +
                "matricula='" + matricula + '\'' +
                ", aPaterno='" + aPaterno + '\'' +
                ", aMaterno='" + aMaterno + '\'' +
                ", nombres='" + nombres + '\'' +
                ", fechaNac='" + fechaNac + '\'' +
                ", edad=" + edad +
                ", sexo='" + sexo + '\'' +
                ", estadoCivil='" + estadoCivil + '\'' +
                ", domActual='" + domActual + '\'' +
                ", colonia='" + colonia + '\'' +
                ", cp=" + cp +
                ", telefono='" + telefono + '\'' +
                ", cel='" + cel + '\'' +
                ", email='" + email + '\'' +
                ", curp='" + curp + '\'' +
                ", nacionalidad='" + nacionalidad + '\'' +
                ", trabaja='" + trabaja + '\'' +
                ", ingresoMensual=" + ingresoMensual +
                ", tipoSangre='" + tipoSangre + '\'' +
                ", nombreTutor='" + nombreTutor + '\'' +
                ", noIMSS='" + noIMSS + '\'' +
                ", status='" + status + '\'' +
                ", idGeneracion=" + idGeneracion +
                ", idGrupoActual=" + idGrupoActual +
                ", idCarrera=" + idCarrera +
                '}';
    }
}
