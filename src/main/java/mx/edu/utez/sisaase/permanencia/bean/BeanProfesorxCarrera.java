package mx.edu.utez.sisaase.permanencia.bean;

public class BeanProfesorxCarrera {
    private BeanCarrera beanCarrera;
    private BeanProfesor beanProfesor;

    public BeanProfesorxCarrera() {
    }

    public BeanProfesorxCarrera(BeanCarrera beanCarrera, BeanProfesor beanProfesor) {
        this.beanCarrera = beanCarrera;
        this.beanProfesor = beanProfesor;
    }


    public BeanCarrera getBeanCarrera() {
        return beanCarrera;
    }

    public void setBeanCarrera(BeanCarrera beanCarrera) {
        this.beanCarrera = beanCarrera;
    }

    public BeanProfesor getBeanProfesor() {
        return beanProfesor;
    }

    public void setBeanProfesor(BeanProfesor beanProfesor) {
        this.beanProfesor = beanProfesor;
    }
}
