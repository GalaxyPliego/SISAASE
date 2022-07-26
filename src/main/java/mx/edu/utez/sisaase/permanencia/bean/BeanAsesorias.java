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

    public BeanAsesorias(int idAsesoria, BeanAlumnoInscrito matricula, BeanMaterias idMateria, BeanProfesor idProfesor, int duracion, BeanEstadoAsesoria idEstadoAsesoria, String tema, String dudasEspecificas, int aclaracionDudas, int asistenciaDocente, int asistenciaAlumno, String motivosCancelacion, String motivosRechazo, String horarioSolicitado, BeanDiaSemana idDiaSemana, BeanPeriodoCuatrimestral idPeriodoCuatrimestral) {
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
    }

    public BeanAsesorias(BeanAlumnoInscrito matricula, BeanMaterias idMateria, BeanProfesor idProfesor, int duracion, BeanEstadoAsesoria idEstadoAsesoria, String tema, String dudasEspecificas, int aclaracionDudas, int asistenciaDocente, int asistenciaAlumno, String motivosCancelacion, String motivosRechazo, String horarioSolicitado, BeanDiaSemana idDiaSemana, BeanPeriodoCuatrimestral idPeriodoCuatrimestral) {
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
    }

    public BeanAsesorias() {
    }

    public int getAsistenciaAlumno() {
        return asistenciaAlumno;
    }

    public void setAsistenciaAlumno(int asistenciaAlumno) {
        this.asistenciaAlumno = asistenciaAlumno;
    }

    public int getIdAsesoria() {
        return idAsesoria;
    }

    public void setIdAsesoria(int idAsesoria) {
        this.idAsesoria = idAsesoria;
    }

    public BeanAlumnoInscrito getMatricula() {
        return matricula;
    }

    public void setMatricula(BeanAlumnoInscrito matricula) {
        this.matricula = matricula;
    }

    public BeanMaterias getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(BeanMaterias idMateria) {
        this.idMateria = idMateria;
    }

    public BeanProfesor getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(BeanProfesor idProfesor) {
        this.idProfesor = idProfesor;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public BeanEstadoAsesoria getIdEstadoAsesoria() {
        return idEstadoAsesoria;
    }

    public void setIdEstadoAsesoria(BeanEstadoAsesoria idEstadoAsesoria) {
        this.idEstadoAsesoria = idEstadoAsesoria;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getDudasEspecificas() {
        return dudasEspecificas;
    }

    public void setDudasEspecificas(String dudasEspecificas) {
        this.dudasEspecificas = dudasEspecificas;
    }

    public int getAclaracionDudas() {
        return aclaracionDudas;
    }

    public void setAclaracionDudas(int aclaracionDudas) {
        this.aclaracionDudas = aclaracionDudas;
    }

    public int getAsistenciaDocente() {
        return asistenciaDocente;
    }

    public void setAsistenciaDocente(int asistenciaDocente) {
        this.asistenciaDocente = asistenciaDocente;
    }

    public String getMotivosCancelacion() {
        return motivosCancelacion;
    }

    public void setMotivosCancelacion(String motivosCancelacion) {
        this.motivosCancelacion = motivosCancelacion;
    }

    public String getMotivosRechazo() {
        return motivosRechazo;
    }

    public void setMotivosRechazo(String motivosRechazo) {
        this.motivosRechazo = motivosRechazo;
    }

    public String getHorarioSolicitado() {
        return horarioSolicitado;
    }

    public void setHorarioSolicitado(String horarioSolicitado) {
        this.horarioSolicitado = horarioSolicitado;
    }

    public BeanDiaSemana getIdDiaSemana() {
        return idDiaSemana;
    }

    public void setIdDiaSemana(BeanDiaSemana idDiaSemana) {
        this.idDiaSemana = idDiaSemana;
    }

    public BeanPeriodoCuatrimestral getIdPeriodoCuatrimestral() {
        return idPeriodoCuatrimestral;
    }

    public void setIdPeriodoCuatrimestral(BeanPeriodoCuatrimestral idPeriodoCuatrimestral) {
        this.idPeriodoCuatrimestral = idPeriodoCuatrimestral;
    }

    @Override
    public String toString() {
        return "BeanAsesorias{" +
                "idAsesoria=" + idAsesoria +
                ", matricula=" + matricula +
                ", idMateria=" + idMateria +
                ", idProfesor=" + idProfesor +
                ", duracion=" + duracion +
                ", idEstadoAsesoria=" + idEstadoAsesoria +
                ", tema='" + tema + '\'' +
                ", dudasEspecificas='" + dudasEspecificas + '\'' +
                ", aclaracionDudas=" + aclaracionDudas +
                ", asistenciaDocente=" + asistenciaDocente +
                ", motivosCancelacion='" + motivosCancelacion + '\'' +
                ", motivosRechazo='" + motivosRechazo + '\'' +
                ", horarioSolicitado='" + horarioSolicitado + '\'' +
                ", idDiaSemana=" + idDiaSemana +
                ", idPeriodoCuatrimestral=" + idPeriodoCuatrimestral +
                '}';
    }
}