package mx.edu.utez.sisaase.permanencia.bean;

public class BeanDiaSemana {
    private int idDia;
    private String nombre;

    public BeanDiaSemana() {
    }

    public BeanDiaSemana(int idDia, String nombre) {
        this.idDia = idDia;
        this.nombre = nombre;
    }

    public BeanDiaSemana(int idDia) {
        this.idDia = idDia;
    }

    public BeanDiaSemana(String nombre) {
        this.nombre = nombre;
    }

    public int getIdDia() {
        return idDia;
    }

    public void setIdDia(int idDia) {
        this.idDia = idDia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
