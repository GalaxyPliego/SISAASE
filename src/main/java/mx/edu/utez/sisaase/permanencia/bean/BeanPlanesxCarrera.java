package mx.edu.utez.sisaase.permanencia.bean;

public class BeanPlanesxCarrera {
    private BeanPlanesEstudio beanPlanesEstudio;
    private BeanCarrera beanCarrera;
    private BeanGeneracion beanGeneracion;

    public BeanPlanesxCarrera(BeanPlanesEstudio beanPlanesEstudio, BeanCarrera beanCarrera, BeanGeneracion beanGeneracion) {
        this.beanPlanesEstudio = beanPlanesEstudio;
        this.beanCarrera = beanCarrera;
        this.beanGeneracion = beanGeneracion;
    }

    public BeanPlanesEstudio getBeanPlanesEstudio() {
        return beanPlanesEstudio;
    }

    public void setBeanPlanesEstudio(BeanPlanesEstudio beanPlanesEstudio) {
        this.beanPlanesEstudio = beanPlanesEstudio;
    }

    public BeanCarrera getBeanCarrera() {
        return beanCarrera;
    }

    public void setBeanCarrera(BeanCarrera beanCarrera) {
        this.beanCarrera = beanCarrera;
    }

    public BeanGeneracion getBeanGeneracion() {
        return beanGeneracion;
    }

    public void setBeanGeneracion(BeanGeneracion beanGeneracion) {
        this.beanGeneracion = beanGeneracion;
    }
}
