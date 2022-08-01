package mx.edu.utez.sisaase.permanencia.bean;

public class BeanIdPeriodoIdCarrera {
    private int periodoCuatrimestral;
    private int carrera;

    public BeanIdPeriodoIdCarrera(int periodoCuatrimestral, int carrera) {
        this.periodoCuatrimestral = periodoCuatrimestral;
        this.carrera = carrera;
    }

    public int getPeriodoCuatrimestral() {
        return periodoCuatrimestral;
    }

    public void setPeriodoCuatrimestral(int periodoCuatrimestral) {
        this.periodoCuatrimestral = periodoCuatrimestral;
    }

    public int getCarrera() {
        return carrera;
    }

    public void setCarrera(int carrera) {
        this.carrera = carrera;
    }
}
