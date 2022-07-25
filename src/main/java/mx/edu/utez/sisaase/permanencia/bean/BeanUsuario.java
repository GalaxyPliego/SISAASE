package mx.edu.utez.sisaase.permanencia.bean;

public class BeanUsuario {
    private int idUsuario;
    private String Usuario;
    private String contrasena;
    private String tipoUsuario;
    private int noIntentosFallidos;
    private String ultimoAcceso;
    private String estado;
    private String codigoSeguridad;

    public BeanUsuario(int idUsuario, String usuario, String contrasena, String tipoUsuario, int noIntentosFallidos, String ultimoAcceso, String estado, String codigoSeguridad) {
        this.idUsuario = idUsuario;
        Usuario = usuario;
        this.contrasena = contrasena;
        this.tipoUsuario = tipoUsuario;
        this.noIntentosFallidos = noIntentosFallidos;
        this.ultimoAcceso = ultimoAcceso;
        this.estado = estado;
        this.codigoSeguridad = codigoSeguridad;
    }

    public BeanUsuario() {
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String usuario) {
        Usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public int getNoIntentosFallidos() {
        return noIntentosFallidos;
    }

    public void setNoIntentosFallidos(int noIntentosFallidos) {
        this.noIntentosFallidos = noIntentosFallidos;
    }

    public String getUltimoAcceso() {
        return ultimoAcceso;
    }

    public void setUltimoAcceso(String ultimoAcceso) {
        this.ultimoAcceso = ultimoAcceso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCodigoSeguridad() {
        return codigoSeguridad;
    }

    public void setCodigoSeguridad(String codigoSeguridad) {
        this.codigoSeguridad = codigoSeguridad;
    }

    @Override
    public String toString() {
        return "BeanUsuario{" +
                "idUsuario=" + idUsuario +
                ", Usuario='" + Usuario + '\'' +
                ", contrasena='" + contrasena + '\'' +
                ", tipoUsuario='" + tipoUsuario + '\'' +
                ", noIntentosFallidos=" + noIntentosFallidos +
                ", ultimoAcceso='" + ultimoAcceso + '\'' +
                ", estado='" + estado + '\'' +
                ", codigoSeguridad='" + codigoSeguridad + '\'' +
                '}';
    }
}
