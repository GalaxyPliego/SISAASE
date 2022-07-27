package mx.edu.utez.sisaase.permanencia.bean;

public class BeanAsesorias {
    private int idAsesoria;
    private BeanAlumnoInscrito matricula;
    private BeanMaterias idMateria;
    private BeanProfesor idProfesor;
    private int duracion;
    private BeanEstadoAsesoria idEstadoAsesoria;
    private String tema;
    private String dudasEspecificas;
    private int aclaracionDudas;
    private int asistenciaDocente;
    private int asistenciaAlumno;
    private String motivosCancelacion;
    private String motivosRechazo;
    private String horarioSolicitado;
    private BeanDiaSemana idDiaSemana;
    private BeanPeriodoCuatrimestral idPeriodoCuatrimestral;
    private int riesgo;
    private String fechaAsesoria;
    private String horaCancelacion;
    private String rolCancelacion;
    private int noAsesorias;


    public BeanAsesorias(int idAsesoria, BeanAlumnoInscrito matricula, BeanMaterias idMateria, BeanProfesor idProfesor, int duracion, BeanEstadoAsesoria idEstadoAsesoria, String tema, String dudasEspecificas, int aclaracionDudas, int asistenciaDocente, int asistenciaAlumno, String motivosCancelacion, String motivosRechazo, String horarioSolicitado, BeanDiaSemana idDiaSemana, BeanPeriodoCuatrimestral idPeriodoCuatrimestral, int riesgo, String fechaAsesoria, String horaCancelacion, String rolCancelacion) {
        this.idAsesoria = idAsesoria;
        this.matricula = matricula;
        this.idMateria = idMateria;
        this.idProfesor = idProfesor;
        this.duracion = duracion;
        this.idEstadoAsesoria = idEstadoAsesoria;
        this.tema = tema;
        this.dudasEspecificas = dudasEspecificas;
        this.aclaracionDudas = aclaracionDudas;
        this.asistenciaDocente = asistenciaDocente;
        this.asistenciaAlumno = asistenciaAlumno;
        this.motivosCancelacion = motivosCancelacion;
        this.motivosRechazo = motivosRechazo;
        this.horarioSolicitado = horarioSolicitado;
        this.idDiaSemana = idDiaSemana;
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
        this.riesgo = riesgo;
        this.fechaAsesoria = fechaAsesoria;
        this.horaCancelacion = horaCancelacion;
        this.rolCancelacion = rolCancelacion;
    }

    public BeanAsesorias(BeanAlumnoInscrito matricula, BeanMaterias idMateria, BeanProfesor idProfesor, int duracion, BeanEstadoAsesoria idEstadoAsesoria, String tema, String dudasEspecificas, int aclaracionDudas, int asistenciaDocente, int asistenciaAlumno, String motivosCancelacion, String motivosRechazo, String horarioSolicitado, BeanDiaSemana idDiaSemana, BeanPeriodoCuatrimestral idPeriodoCuatrimestral, int riesgo, String fechaAsesoria, String horaCancelacion, String rolCancelacion) {
        this.matricula = matricula;
        this.idMateria = idMateria;
        this.idProfesor = idProfesor;
        this.duracion = duracion;
        this.idEstadoAsesoria = idEstadoAsesoria;
        this.tema = tema;
        this.dudasEspecificas = dudasEspecificas;
        this.aclaracionDudas = aclaracionDudas;
        this.asistenciaDocente = asistenciaDocente;
        this.asistenciaAlumno = asistenciaAlumno;
        this.motivosCancelacion = motivosCancelacion;
        this.motivosRechazo = motivosRechazo;
        this.horarioSolicitado = horarioSolicitado;
        this.idDiaSemana = idDiaSemana;
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
        this.riesgo = riesgo;
        this.fechaAsesoria = fechaAsesoria;
        this.horaCancelacion = horaCancelacion;
        this.rolCancelacion = rolCancelacion;
    }

    public BeanAsesorias(BeanAlumnoInscrito matricula, int noAsesorias) {
        this.matricula = matricula;
        this.noAsesorias = noAsesorias;
    }

    public String getRolCancelacion() {
        return this.rolCancelacion;
    }

    public void setRolCancelacion(String rolCancelacion) {
        this.rolCancelacion = rolCancelacion;
    }

    public int getRiesgo() {
        return this.riesgo;
    }

    public void setRiesgo(int riesgo) {
        this.riesgo = riesgo;
    }

    public String getFechaAsesoria() {
        return this.fechaAsesoria;
    }

    public void setFechaAsesoria(String fechaAsesoria) {
        this.fechaAsesoria = fechaAsesoria;
    }

    public String getHoraCancelacion() {
        return this.horaCancelacion;
    }

    public void setHoraCancelacion(String horaCancelacion) {
        this.horaCancelacion = horaCancelacion;
    }

    public BeanAsesorias() {
    }

    public int getAsistenciaAlumno() {
        return this.asistenciaAlumno;
    }

    public void setAsistenciaAlumno(int asistenciaAlumno) {
        this.asistenciaAlumno = asistenciaAlumno;
    }

    public int getIdAsesoria() {
        return this.idAsesoria;
    }

    public void setIdAsesoria(int idAsesoria) {
        this.idAsesoria = idAsesoria;
    }

    public BeanAlumnoInscrito getMatricula() {
        return this.matricula;
    }

    public void setMatricula(BeanAlumnoInscrito matricula) {
        this.matricula = matricula;
    }

    public BeanMaterias getIdMateria() {
        return this.idMateria;
    }

    public void setIdMateria(BeanMaterias idMateria) {
        this.idMateria = idMateria;
    }

    public BeanProfesor getIdProfesor() {
        return this.idProfesor;
    }

    public void setIdProfesor(BeanProfesor idProfesor) {
        this.idProfesor = idProfesor;
    }

    public int getDuracion() {
        return this.duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public BeanEstadoAsesoria getIdEstadoAsesoria() {
        return this.idEstadoAsesoria;
    }

    public void setIdEstadoAsesoria(BeanEstadoAsesoria idEstadoAsesoria) {
        this.idEstadoAsesoria = idEstadoAsesoria;
    }

    public String getTema() {
        return this.tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getDudasEspecificas() {
        return this.dudasEspecificas;
    }

    public void setDudasEspecificas(String dudasEspecificas) {
        this.dudasEspecificas = dudasEspecificas;
    }

    public int getAclaracionDudas() {
        return this.aclaracionDudas;
    }

    public void setAclaracionDudas(int aclaracionDudas) {
        this.aclaracionDudas = aclaracionDudas;
    }

    public int getAsistenciaDocente() {
        return this.asistenciaDocente;
    }

    public void setAsistenciaDocente(int asistenciaDocente) {
        this.asistenciaDocente = asistenciaDocente;
    }

    public String getMotivosCancelacion() {
        return this.motivosCancelacion;
    }

    public void setMotivosCancelacion(String motivosCancelacion) {
        this.motivosCancelacion = motivosCancelacion;
    }

    public String getMotivosRechazo() {
        return this.motivosRechazo;
    }

    public void setMotivosRechazo(String motivosRechazo) {
        this.motivosRechazo = motivosRechazo;
    }

    public String getHorarioSolicitado() {
        return this.horarioSolicitado;
    }

    public void setHorarioSolicitado(String horarioSolicitado) {
        this.horarioSolicitado = horarioSolicitado;
    }

    public BeanDiaSemana getIdDiaSemana() {
        return this.idDiaSemana;
    }

    public void setIdDiaSemana(BeanDiaSemana idDiaSemana) {
        this.idDiaSemana = idDiaSemana;
    }

    public BeanPeriodoCuatrimestral getIdPeriodoCuatrimestral() {
        return this.idPeriodoCuatrimestral;
    }

    public void setIdPeriodoCuatrimestral(BeanPeriodoCuatrimestral idPeriodoCuatrimestral) {
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
    }

    public int getNoAsesorias() {
        return this.noAsesorias;
    }

    public void setNoAsesorias(int noAsesorias) {
        this.noAsesorias = noAsesorias;
    }

    public String toString() {
        return "BeanAsesorias{idAsesoria=" + this.idAsesoria + ", matricula=" + this.matricula + ", idMateria=" + this.idMateria + ", idProfesor=" + this.idProfesor + ", duracion=" + this.duracion + ", idEstadoAsesoria=" + this.idEstadoAsesoria + ", tema='" + this.tema + '\'' + ", dudasEspecificas='" + this.dudasEspecificas + '\'' + ", aclaracionDudas=" + this.aclaracionDudas + ", asistenciaDocente=" + this.asistenciaDocente + ", motivosCancelacion='" + this.motivosCancelacion + '\'' + ", motivosRechazo='" + this.motivosRechazo + '\'' + ", horarioSolicitado='" + this.horarioSolicitado + '\'' + ", idDiaSemana=" + this.idDiaSemana + ", idPeriodoCuatrimestral=" + this.idPeriodoCuatrimestral + '}';
    }
}
