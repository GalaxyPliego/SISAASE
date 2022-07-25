package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanAlumnoInscrito;
import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;
import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;

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

    public BeanAlumnoInscrito iniciarSesionAlumno(BeanUsuario beanUsuario) throws SQLException {
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
        if(rs.next()){
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
        return alumnoInscrito;
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
}
