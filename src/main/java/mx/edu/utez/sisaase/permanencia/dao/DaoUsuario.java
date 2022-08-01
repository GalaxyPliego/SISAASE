package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.*;
import mx.edu.utez.sisaase.utils.ConnectionMysql;
import mx.edu.utez.sisaase.utils.SendEmail;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.opensymphony.xwork2.Action.ERROR;

public class DaoUsuario {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public String iniciarSesion(BeanUsuario beanUsuario) throws SQLException {
        try {
            connection = ConnectionMysql.getConnection();
            String scriptLogin = "select Usuario, Contrasena, ClaveIdentidad from usuario where Usuario = ?;";
            pstm = connection.prepareStatement(scriptLogin);
            pstm.setString(1, beanUsuario.getUsuario());
            rs = pstm.executeQuery();
            if (rs.next()) {
                beanUsuario.setClaveIdentidad(rs.getString("ClaveIdentidad"));
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
                    if (roles.size() > 1) {
                        HttpSession session = ServletActionContext.getRequest().getSession();
                        session.setAttribute("usuario", beanUsuario);
                        return "multiRol";
                    } else {
                        if (roles.get(0).getNombreRol().equals("alumno")) {
                            HttpSession session = ServletActionContext.getRequest().getSession();
                            session.setAttribute("usuario", beanUsuario);
                            session.setAttribute("rol", roles.get(0).getIdRol());
                            session.setAttribute("rolView", roles.get(0).getNombreRol());
                            return "alumno";
                        } else if (roles.get(0).getNombreRol().equals("docente")) {
                            HttpSession session = ServletActionContext.getRequest().getSession();
                            session.setAttribute("usuario", beanUsuario);
                            session.setAttribute("rol", roles.get(0).getIdRol());
                            session.setAttribute("rolView", roles.get(0).getNombreRol());
                            return "docente";
                        }else if (roles.get(0).getNombreRol().equals("coordinador")) {
                            HttpSession session = ServletActionContext.getRequest().getSession();
                            session.setAttribute("usuario", beanUsuario);
                            session.setAttribute("rol", roles.get(0).getIdRol());
                            session.setAttribute("rolView", roles.get(0).getNombreRol());
                            return "coordinador";
                        }
                    }

                }
            } else {
                return ERROR;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return ERROR;
    }

    public boolean modificarPerfilAlumno(BeanAlumnoInscrito alumnoInscrito) throws SQLException {
        boolean status = false;
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

            connection = ConnectionMysql.getConnection();
            String query = "UPDATE alumnoinscrito \n" +
                    "SET aPaterno = ?, aMaterno=?,Nombres=?,EstadoCivil=?, sexo =?,\n" +
                    "DomActual = ?, Colonia=?, CP=?, Telefono=?,Cel=?, Email=?\n" +
                    "where matricula = ?;";
            pstm = connection.prepareStatement(query);
            pstm.setString(1, alumnoInscrito.getaPaterno());
            pstm.setString(2, alumnoInscrito.getaMaterno());
            pstm.setString(3, alumnoInscrito.getNombres());
            pstm.setString(4, alumnoInscrito.getEstadoCivil());
            pstm.setString(5, alumnoInscrito.getSexo());
            pstm.setString(6, alumnoInscrito.getDomActual());
            pstm.setString(7, alumnoInscrito.getColonia());
            pstm.setInt(8, alumnoInscrito.getCp());
            pstm.setString(9, alumnoInscrito.getTelefono());
            pstm.setString(10, alumnoInscrito.getCel());
            pstm.setString(11, alumnoInscrito.getEmail());
            pstm.setString(12, beanUsuario.getUsuario());

            status = pstm.executeUpdate()==1;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return status;
    }

    public boolean modificarPerfilProfesor(BeanProfesor profesor) throws SQLException {
        boolean status = false;
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

            connection = ConnectionMysql.getConnection();
            String query = "UPDATE profesor \n" +
                    "SET aPaterno = ?, aMaterno=?,Nombres=?,EmailInst=?, emailPart =?,\n" +
                    "telefono = ?, NivelMaxEstudios=?, Titulo=?, CURP=?,semblanza=?\n" +
                    "where idProfesor = ?;";
            pstm = connection.prepareStatement(query);
            pstm.setString(1, profesor.getaPaterno());
            pstm.setString(2, profesor.getaMaterno());
            pstm.setString(3, profesor.getNombres());
            pstm.setString(4, profesor.getEmailInst());
            pstm.setString(5, profesor.getEmailPart());
            pstm.setString(6, profesor.getTelefono());
            pstm.setString(7, profesor.getNivelMaxEstudios());
            pstm.setString(8, profesor.getTitulo());
            pstm.setString(9, profesor.getCurp());
            pstm.setString(10, profesor.getSemblanza());
            pstm.setString(11, beanUsuario.getClaveIdentidad());
            status = pstm.executeUpdate()==1;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return status;
    }
    public boolean modificarContrasexa(BeanUsuario usuario) throws SQLException {
        boolean status = false;
        try {
            connection=ConnectionMysql.getConnection();
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

            String comprobar="select Contrasena from usuario where Usuario=?;";
            pstm = connection.prepareStatement(comprobar);
            pstm.setString(1,beanUsuario.getUsuario());
            rs = pstm.executeQuery();
            if(rs.next()){
                if (usuario.getContrasena().equals(rs.getString("Contrasena"))){
                    String query = "UPDATE usuario SET Contrasena=? where Usuario = ?;";
                    pstm = connection.prepareStatement(query);
                    pstm.setString(1, usuario.getUsuario());
                    pstm.setString(2, beanUsuario.getUsuario());
                    status = pstm.executeUpdate()==1;
                }else{
                    return false;
                }
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return status;
    }
    public boolean recuperarContrasexa(BeanUsuario usuario) throws SQLException {

        try {
            connection=ConnectionMysql.getConnection();
            String comprobar="select Email,matricula from alumnoinscrito where Email=?;";
            pstm = connection.prepareStatement(comprobar);
            pstm.setString(1, usuario.getUsuario());
            rs = pstm.executeQuery();
            if(rs.next()){
                usuario.setClaveIdentidad(rs.getString("matricula"));
                if(new SendEmail().recoveryPassword(usuario)){
                    return true;
                }else{
                    return false;
                }
            }else{
                connection=ConnectionMysql.getConnection();
                String comprobarProfesor="select emailPart, idProfesor from profesor where emailPart=?;";
                pstm = connection.prepareStatement(comprobarProfesor);
                pstm.setString(1, usuario.getUsuario());
                rs = pstm.executeQuery();
                if(rs.next()){
                    usuario.setClaveIdentidad(rs.getString("idProfesor"));
                    if(new SendEmail().recoveryPassword(usuario)){
                        return true;
                    }else{
                        return false;
                    }
                }else {
                    return false;
                }
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }

    }
    public BeanAlumnoInscrito consultarPerfil() throws SQLException {
        try{
            connection = ConnectionMysql.getConnection();
            BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");
            String script = "select alumnoinscrito.matricula, alumnoinscrito.aPaterno, alumnoinscrito.aMaterno, alumnoinscrito.Nombres, alumnoinscrito.FechaNac, alumnoinscrito.Edad, alumnoinscrito.Sexo, alumnoinscrito.EstadoCivil, alumnoinscrito.DomActual, alumnoinscrito.Colonia, alumnoinscrito.CP, alumnoinscrito.Telefono, alumnoinscrito.Cel, alumnoinscrito.Email, alumnoinscrito.CURP, alumnoinscrito.Nacionalidad, alumnoinscrito.Trabaja, alumnoinscrito.IngresoMensual, alumnoinscrito.TipoSangre, alumnoinscrito.NomTutor, alumnoinscrito.NoIMSS, alumnoinscrito.Status, alumnoinscrito.LocalidadRadica, alumnoinscrito.unidad_imss,\n" +
                    "generacion.idGeneracion, generacion.NoGeneracion, generacion.IngresoMes, generacion.IngresoAxo, generacion.EgresoMes, generacion.EgresoAxo, generacion.Estado, \n" +
                    "nivelacademico.idNivelAcademico, nivelacademico.Nivel, nivelacademico.Descripcion,\n" +
                    "grupos.idGrupo, grupos.cuatrimestre, grupos.grupo,\n" +
                    "carrera.idCarrera, carrera.nombreCarrera,\n" +
                    "especialidad.Descripcion \n"+
                    "from alumnoinscrito \n" +
                    "inner join generacion on alumnoinscrito.idGeneracion = generacion.idGeneracion \n" +
                    "inner join nivelacademico on nivelacademico.idNivelAcademico = generacion.idNivelAcademico \n" +
                    "inner join grupos on grupos.idGrupo = alumnoinscrito.idGrupoActual \n" +
                    "inner join carrera on alumnoinscrito.idCarrera = carrera.idCarrera \n" +
                    "inner join especialidad on especialidad.idEspecialidad = grupos.idEspecialidad \n" +
                    "where alumnoinscrito.matricula = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setString(1, beanUsuario.getUsuario());
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanGrupos beanGrupos = new BeanGrupos();
                beanGrupos.setIdGrupo(rs.getInt("grupos.idGrupo"));
                beanGrupos.setCuatrimestre(rs.getInt("grupos.cuatrimestre"));
                beanGrupos.setGrupo(rs.getString("grupos.grupo"));

                BeanGeneracion beanGeneracion = new BeanGeneracion();
                beanGeneracion.setIdGeneracion(rs.getInt("generacion.idGeneracion"));
                beanGeneracion.setNoGeneracion(rs.getInt("generacion.NoGeneracion"));
                beanGeneracion.setIngresoMes(rs.getString("generacion.IngresoMes"));
                beanGeneracion.setIngresoAxo(rs.getString("generacion.IngresoAxo"));
                beanGeneracion.setEgresoMes(rs.getString("generacion.EgresoMes"));
                beanGeneracion.setEgresoAxo(rs.getString("generacion.EgresoAxo"));
                beanGeneracion.setEstado(rs.getString("generacion.Estado"));

                BeanEspecialidad beanEspecialidad = new BeanEspecialidad();
                beanEspecialidad.setDescripcion(rs.getString("especialidad.Descripcion"));

                BeanCarrera beanCarrera = new BeanCarrera();
                beanCarrera.setIdCarrera(rs.getInt("carrera.idCarrera"));
                beanCarrera.setNombreCarrera(rs.getString("carrera.nombreCarrera"));
                beanCarrera.setIdEspecialidad(beanEspecialidad);

                alumnoInscrito.setIdGrupoActual(beanGrupos);
                alumnoInscrito.setIdGeneracion(beanGeneracion);
                alumnoInscrito.setIdCarrera(beanCarrera);

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

            }
            session.removeAttribute("datosPersonales");
            session.setAttribute("datosPersonales", alumnoInscrito);
            return alumnoInscrito;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return null;
    }

    public BeanProfesor consultarPerfilProfesor() throws SQLException {
        try{
            connection = ConnectionMysql.getConnection();
            BeanProfesor profesor = new BeanProfesor();
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");
            String script = "SELECT profesor.idProfesor, profesor.Nombres, profesor.APaterno, profesor.aMaterno, profesor.EmailInst, profesor.cedulaProf, profesor.NivelMaxEstudios, profesor.Titulo, profesor.emailPart, profesor.TipoProfesor, profesor.Telefono, profesor.semblanza, profesor.CURP, profesor.estado, profesor.sexo FROM sisa_ase.profesor where profesor.idProfesor = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setString(1, beanUsuario.getClaveIdentidad());
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
                profesor.setTitulo(rs.getString("profesor.Titulo"));
            }
            session.removeAttribute("datosPersonales");
            session.setAttribute("datosPersonales", profesor);
            return profesor;
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return null;
    }


    public boolean nuevaContrasexa(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
    }

    public boolean contrasexaRecuperada(BeanUsuario beanUsuario) throws SQLException {
        try{
            System.out.println(beanUsuario.getCodigoSeguridad());
            connection = ConnectionMysql.getConnection();
            String script = "UPDATE usuario SET codigoSeguridad=?, contrasena=? where codigoSeguridad=?;";
            pstm = connection.prepareStatement(script);
            pstm.setString(1, "");
            pstm.setString(2, beanUsuario.getContrasena());
            pstm.setString(3, beanUsuario.getCodigoSeguridad());
            if(pstm.executeUpdate()==1){
                return true;
            }else{
                return false;
            }

        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
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
