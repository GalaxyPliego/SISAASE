package mx.edu.utez.sisaase.permanencia.bean;

public class BeanEstadoAsesoria {
    private int idEstadoAsesoria;
    private String nombre;

    public BeanEstadoAsesoria(int idEstadoAsesoria, String nombre) {
        this.idEstadoAsesoria = idEstadoAsesoria;
        this.nombre = nombre;
    }

    public BeanEstadoAsesoria() {
    }

    public BeanEstadoAsesoria(String nombre) {
        this.nombre = nombre;
    }

    public int getIdEstadoAsesoria() {
        return idEstadoAsesoria;
    }

    public void setIdEstadoAsesoria(int idEstadoAsesoria) {
        this.idEstadoAsesoria = idEstadoAsesoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
