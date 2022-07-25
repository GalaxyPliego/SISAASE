package mx.edu.utez.sisaase.permanencia.bean;

public class BeanHorariosAsesoria {
    private int idHorario;
    private String horaInicio;
    private String horaFin;
    private BeanDiaSemana diaSemana;
    private BeanProfesor profesor;
    private BeanPeriodoCuatrimestral periodoCuatrimestral;

    public BeanHorariosAsesoria() {
    }

    public BeanHorariosAsesoria(int idHorario, String horaInicio, String horaFin, BeanDiaSemana diaSemana, BeanProfesor profesor, BeanPeriodoCuatrimestral periodoCuatrimestral) {
        this.idHorario = idHorario;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.diaSemana = diaSemana;
        this.profesor = profesor;
        this.periodoCuatrimestral = periodoCuatrimestral;
    }

    public BeanHorariosAsesoria(String horaInicio, String horaFin, BeanDiaSemana diaSemana, BeanProfesor profesor, BeanPeriodoCuatrimestral periodoCuatrimestral) {
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.diaSemana = diaSemana;
        this.profesor = profesor;
        this.periodoCuatrimestral = periodoCuatrimestral;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(String horaFin) {
        this.horaFin = horaFin;
    }

    public BeanDiaSemana getDiaSemana() {
        return diaSemana;
    }

    public void setDiaSemana(BeanDiaSemana diaSemana) {
        this.diaSemana = diaSemana;
    }

    public BeanProfesor getProfesor() {
        return profesor;
    }

    public void setProfesor(BeanProfesor profesor) {
        this.profesor = profesor;
    }

    public BeanPeriodoCuatrimestral getPeriodoCuatrimestral() {
        return periodoCuatrimestral;
    }

    public void setPeriodoCuatrimestral(BeanPeriodoCuatrimestral periodoCuatrimestral) {
        this.periodoCuatrimestral = periodoCuatrimestral;
    }
}
