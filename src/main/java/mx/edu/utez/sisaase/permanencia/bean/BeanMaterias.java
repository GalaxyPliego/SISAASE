package mx.edu.utez.sisaase.permanencia.bean;

public class BeanMaterias {
    private String idMateria;
    private String nombre;
    private int horas;
    private int cuatrimestre;
    private String clasificacion;
    private int noUnidades;
    private int orden;
    private BeanPlanesEstudio idPlan;


    public BeanMaterias() {
    }

    public BeanMaterias(String idMateria, String nombre, int horas, int cuatrimestre, String clasificacion, int noUnidades, int orden, BeanPlanesEstudio idPlan) {
        this.idMateria = idMateria;
        this.nombre = nombre;
        this.horas = horas;
        this.cuatrimestre = cuatrimestre;
        this.clasificacion = clasificacion;
        this.noUnidades = noUnidades;
        this.orden = orden;
        this.idPlan = idPlan;
    }

    public BeanMaterias(String nombre, int horas, int cuatrimestre, String clasificacion, int noUnidades, int orden, BeanPlanesEstudio idPlan) {
        this.nombre = nombre;
        this.horas = horas;
        this.cuatrimestre = cuatrimestre;
        this.clasificacion = clasificacion;
        this.noUnidades = noUnidades;
        this.orden = orden;
        this.idPlan = idPlan;
    }

    public String getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(String idMateria) {
        this.idMateria = idMateria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public int getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(int cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public int getNoUnidades() {
        return noUnidades;
    }

    public void setNoUnidades(int noUnidades) {
        this.noUnidades = noUnidades;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public BeanPlanesEstudio getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(BeanPlanesEstudio idPlan) {
        this.idPlan = idPlan;
    }
}
