package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanAlumnoInscrito;
import mx.edu.utez.sisaase.permanencia.bean.BeanProfesor;
import mx.edu.utez.sisaase.permanencia.bean.BeanRol;
import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;
import mx.edu.utez.sisaase.utils.ConnectionMysql;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsuario {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public boolean iniciarSesion(BeanUsuario beanUsuario) throws SQLException {
        try {
            connection = ConnectionMysql.getConnection();
            String scriptLogin = "select Usuario, Contrasena from usuario where Usuario = ?;";
            pstm = connection.prepareStatement(scriptLogin);
            pstm.setString(1, beanUsuario.getUsuario());
            rs = pstm.executeQuery();
            if (rs.next()) {
                String contrasena = rs.getString("Contrasena");
                if (contrasena.equals(beanUsuario.getContrasena())) {
                    String scriptRoles = "SELECT rol.idRol, rol.nombreRol, rol.descripcion \n" +
                            "FROM asignacion_rol_usuario inner join usuario on asignacion_rol_usuario.idUsuario = usuario.idUsuario \n" +
                            "inner join rol on rol.idRol = asignacion_rol_usuario.idRol where usuario.Usuario = ?;";
                    pstm = connection.prepareStatement(scriptRoles);
                    pstm.setString(1, beanUsuario.getUsuario());
                    rs = pstm.executeQuery();
                    List<BeanRol> roles = new ArrayList<>();
                    if (rs.next()) {

                        BeanRol beanRol = new BeanRol();
                        beanRol.setIdRol(rs.getInt("rol.idRol"));
                        beanRol.setNombreRol(rs.getString("rol.nombreRol"));
                        beanRol.setDescripcion(rs.getString("rol.descripcion"));
                        roles.add(beanRol);
                    }
                    for (BeanRol rol : roles) {
                        if (rol.getNombreRol().equals("alumno")) {
                            BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
                            String script = "select alumnoinscrito.matricula, alumnoinscrito.aPaterno, alumnoinscrito.aMaterno, alumnoinscrito.Nombres, alumnoinscrito.FechaNac, alumnoinscrito.Edad, alumnoinscrito.Sexo, alumnoinscrito.EstadoCivil, alumnoinscrito.DomActual, alumnoinscrito.Colonia, alumnoinscrito.CP, alumnoinscrito.Telefono, alumnoinscrito.Cel, alumnoinscrito.Email, alumnoinscrito.CURP, alumnoinscrito.Nacionalidad, alumnoinscrito.Trabaja, alumnoinscrito.IngresoMensual, alumnoinscrito.TipoSangre, alumnoinscrito.NomTutor, alumnoinscrito.NoIMSS, alumnoinscrito.Status, alumnoinscrito.LocalidadRadica, alumnoinscrito.unidad_imss,\n" +
                                    "generacion.idGeneracion, generacion.NoGeneracion, generacion.IngresoMes, generacion.IngresoAxo, generacion.EgresoMes, generacion.EgresoAxo, generacion.Estado, \n" +
                                    "nivelacademico.idNivelAcademico, nivelacademico.Nivel, nivelacademico.Descripcion,\n" +
                                    "grupos.idGrupo, grupos.cuatrimestre, grupos.grupo,\n" +
                                    "carrera.idCarrera, carrera.nombreCarrera\n" +
                                    "from alumnoinscrito \n" +
                                    "inner join generacion on alumnoinscrito.idGeneracion = generacion.idGeneracion \n" +
                                    "inner join nivelacademico on nivelacademico.idNivelAcademico = generacion.idNivelAcademico \n" +
                                    "inner join grupos on grupos.idGrupo = alumnoinscrito.idGrupoActual \n" +
                                    "inner join carrera on alumnoinscrito.idCarrera = carrera.idCarrera;";
                            pstm = connection.prepareStatement(script);
                            rs = pstm.executeQuery();
                            if (rs.next()) {
                                alumnoInscrito.setMatricula(rs.getString("alumnoInscrito.matricula"));
                                alumnoInscrito.setaPaterno(rs.getString("alumnoinscrito.aPaterno"));
                                alumnoInscrito.setaMaterno(rs.getString("alumnoinscrito.aMaterno"));
                                alumnoInscrito.setNombres(rs.getString("alumnoinscrito.Nombres"));
                                alumnoInscrito.setFechaNac(rs.getString("alumnoinscrito.FechaNac"));
                                alumnoInscrito.setEdad(rs.getInt("alumnoinscrito.Edad"));
                                alumnoInscrito.setSexo(rs.getString("alumnoinscrito.Sexo"));
                                alumnoInscrito.setEstadoCivil(rs.getString("alumnoinscrito.EstadoCivil"));
                                alumnoInscrito.setDomActual(rs.getString("alumnoinscrito.DomActual"));
                                alumnoInscrito.setColonia(rs.getString("alumnoinscrito.Colonia"));
                                alumnoInscrito.setCp(rs.getInt("alumnoinscrito.CP"));
                                alumnoInscrito.setTelefono(rs.getString("alumnoinscrito.Telefono"));
                                alumnoInscrito.setCel(rs.getString("alumnoinscrito.Cel"));
                                alumnoInscrito.setEmail(rs.getString("alumnoinscrito.Email"));
                                alumnoInscrito.setCurp(rs.getString("alumnoinscrito.CURP"));
                                alumnoInscrito.setNacionalidad(rs.getString("alumnoinscrito.Nacionalidad"));
                                alumnoInscrito.setTrabaja(rs.getString("alumnoinscrito.Trabaja"));
                                alumnoInscrito.setIngresoMensual(rs.getInt("alumnoinscrito.IngresoMensual"));
                                alumnoInscrito.setTipoSangre(rs.getString("alumnoinscrito.TipoSangre"));
                                alumnoInscrito.setNombreTutor(rs.getString("alumnoinscrito.NomTutor"));
                                alumnoInscrito.setNoIMSS(rs.getString("alumnoinscrito.NoIMSS"));
                                alumnoInscrito.setStatus(rs.getString("alumnoinscrito.Status"));
                                alumnoInscrito.setLocalidadRadica(rs.getString("alumnoinscrito.LocalidadRadica"));
                                alumnoInscrito.setUnidadImss(rs.getString("alumnoinscrito.unidad_imss"));
                            } else {
                                return false;
                            }
                            HttpSession session = ServletActionContext.getRequest().getSession();
                            session.setAttribute("Usuario", beanUsuario.getUsuario());
                            session.setAttribute("alumnoInscrito", alumnoInscrito);
                            return true;
                        }else if(rol.getNombreRol().equals("docente")){
                            BeanProfesor profesor = new BeanProfesor();
                            String script = "SELECT profesor.idProfesor, profesor.Nombres, profesor.APaterno, profesor.aMaterno, profesor.EmailInst, profesor.cedulaProf, profesor.NivelMaxEstudios, profesor.Titulo, profesor.emailPart, profesor.TipoProfesor, profesor.Telefono, profesor.semblanza, profesor.CURP, profesor.estado, profesor.sexo FROM sisa_ase.profesor;";
                            pstm = connection.prepareStatement(script);
                            rs = pstm.executeQuery();
                            if (rs.next()) {
                                profesor.setIdProfesor(rs.getInt("profesor.idProfesor"));
                                profesor.setNombres(rs.getString("profesor.Nombres"));
                                profesor.setaPaterno(rs.getString("profesor.APaterno"));
                                profesor.setaMaterno(rs.getString("profesor.aMaterno"));
                                profesor.setEmailInst(rs.getString("profesor.EmailInst"));
                                profesor.setCedulaProf(rs.getString("profesor.cedulaProf"));
                                profesor.setNivelMaxEstudios(rs.getString("profesor.NivelMaxEstudios"));
                                profesor.setEmailPart(rs.getString("profesor.emailPart"));
                                profesor.setTipoProfesor(rs.getString("profesor.TipoProfesor"));
                                profesor.setTelefono(rs.getString("profesor.Telefono"));
                                profesor.setSemblanza(rs.getString("profesor.semblanza"));
                                profesor.setCurp(rs.getString("profesor.CURP"));
                                profesor.setEstado(rs.getString("profesor.estado"));
                                profesor.setSexo(rs.getString("profesor.sexo"));
                            }
                            HttpSession session = ServletActionContext.getRequest().getSession();
                            session.setAttribute("Usuario", beanUsuario.getUsuario());
                            session.setAttribute("profesor", profesor);
                            return true;
                        }
                    }
                }
            } else {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }


    public boolean recuperarContrasexa(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
    }

    public boolean nuevaContrasexa(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
    }

    public boolean cambiarContrasexa(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
    }

    public boolean cambiarDatos(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
    }

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
}
