package mx.edu.utez.sisaase.permanencia.bean;

public class BeanEspecialidad {
    private int idEspecialidad;
    private String descripcion;
    private String estado;
    private String descripcionCedula;
    private int claveCarrera;
    private String oferta;
    private BeanCarrera idCarrera;

    public BeanEspecialidad(int idEspecialidad, String descripcion, String estado, String descripcionCedula, int claveCarrera, String oferta, BeanCarrera idCarrera) {
        this.idEspecialidad = idEspecialidad;
        this.descripcion = descripcion;
        this.estado = estado;
        this.descripcionCedula = descripcionCedula;
        this.claveCarrera = claveCarrera;
        this.oferta = oferta;
        this.idCarrera = idCarrera;
    }

    public BeanEspecialidad(String descripcion, String estado, String descripcionCedula, int claveCarrera, String oferta, BeanCarrera idCarrera) {
        this.descripcion = descripcion;
        this.estado = estado;
        this.descripcionCedula = descripcionCedula;
        this.claveCarrera = claveCarrera;
        this.oferta = oferta;
        this.idCarrera = idCarrera;
    }

    public BeanEspecialidad() {

    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcionCedula() {
        return descripcionCedula;
    }

    public void setDescripcionCedula(String descripcionCedula) {
        this.descripcionCedula = descripcionCedula;
    }

    public int getClaveCarrera() {
        return claveCarrera;
    }

    public void setClaveCarrera(int claveCarrera) {
        this.claveCarrera = claveCarrera;
    }

    public String getOferta() {
        return oferta;
    }

    public void setOferta(String oferta) {
        this.oferta = oferta;
    }

    public BeanCarrera getIdCarrera() {
        return idCarrera;
    }

    public void setIdCarrera(BeanCarrera idCarrera) {
        this.idCarrera = idCarrera;
    }
}
