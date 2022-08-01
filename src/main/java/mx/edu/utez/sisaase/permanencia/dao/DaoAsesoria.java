package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.*;
import mx.edu.utez.sisaase.utils.ConnectionMysql;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAsesoria {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;
    CallableStatement cstm;

    public List<BeanProfesor> consultarHorarios(BeanMaterias beanMaterias) throws SQLException {
        List<BeanProfesor> profesores = new ArrayList<>();
        List<BeanHorariosAsesoria> horarios = new ArrayList<>();
        BeanProfesor profesor = new BeanProfesor();
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

            connection = ConnectionMysql.getConnection();
            String query = "SELECT profesor.idProfesor, profesor.nombres, profesor.aMaterno, profesor.aPaterno, \n" +
                    "ha.idHorario, ha.horaInicio, ha.horaFin, ds.nombre as dia, ds.idDia,\n" +
                    "clase.idMateria as idMateria\n" +
                    "from profesor\n" +
                    "inner join profesorxcarrera pc on pc.idProfesor = profesor.idProfesor\n" +
                    "inner join alumnoinscrito ai on ai.matricula = ?\n" +
                    "inner join clase on clase.idMateria = ? && clase.idProfesor = profesor.idProfesor\n" +
                    "inner join carrera c on pc.idCarrera = c.idCarrera && c.idCarrera = ai.idCarrera\n" +
                    "inner join horariosasesoria ha on profesor.idProfesor = ha.idProfesor\n" +
                    "&& (select MAX(idPeriodoCuatrimestral) from periodo_cuatrimestral) = ha.idPeriodoCuatrimestral\n" +
                    "inner join diasemana ds on ds.idDia = ha.idDia;";
            pstm = connection.prepareStatement(query);
            pstm.setString(1, beanUsuario.getUsuario());
            pstm.setString(2, beanMaterias.getIdMateria());
            rs = pstm.executeQuery();
            int idProfe = 0;
            while(rs.next()){
                BeanHorariosAsesoria horario = new BeanHorariosAsesoria();
                int idProfesor = rs.getInt("profesor.idProfesor");
                if (idProfe==idProfesor){
                    BeanDiaSemana beanDiaSemana = new BeanDiaSemana();
                    beanDiaSemana.setIdDia(rs.getInt("ds.idDia"));
                    beanDiaSemana.setNombre(rs.getString("dia"));

                    horario.setIdHorario(rs.getInt("ha.idHorario"));
                    horario.setHoraInicio(rs.getString("ha.horaInicio"));
                    horario.setHoraFin(rs.getString("ha.horaFin"));
                    horario.setDiaSemana(beanDiaSemana);
                    horarios.add(horario);
                    profesor.setHorarios(horarios);
                }else if(profesores.size()>0){
                    idProfe = rs.getInt("profesor.idProfesor");
                    horarios = new ArrayList<>();
                    profesor = new BeanProfesor();

                    profesor.setIdProfesor(rs.getInt("profesor.idProfesor"));
                    profesor.setNombres(rs.getString("profesor.nombres"));
                    profesor.setaMaterno(rs.getString("profesor.aMaterno"));
                    profesor.setaPaterno(rs.getString("profesor.aPaterno"));
                    profesores.add(profesor);

                    BeanDiaSemana beanDiaSemana = new BeanDiaSemana();
                    beanDiaSemana.setIdDia(rs.getInt("ds.idDia"));
                    beanDiaSemana.setNombre(rs.getString("dia"));

                    horario.setIdHorario(rs.getInt("ha.idHorario"));
                    horario.setHoraInicio(rs.getString("ha.horaInicio"));
                    horario.setHoraFin(rs.getString("ha.horaFin"));
                    horario.setDiaSemana(beanDiaSemana);
                    horarios.add(horario);
                    profesor.setHorarios(horarios);
                }else if(profesores.size()==0){
                    profesor.setIdProfesor(rs.getInt("profesor.idProfesor"));
                    profesor.setNombres(rs.getString("profesor.nombres"));
                    profesor.setaMaterno(rs.getString("profesor.aMaterno"));
                    profesor.setaPaterno(rs.getString("profesor.aPaterno"));
                    idProfe = rs.getInt("profesor.idProfesor");
                    profesores.add(profesor);

                    BeanDiaSemana beanDiaSemana = new BeanDiaSemana();
                    beanDiaSemana.setIdDia(rs.getInt("ds.idDia"));
                    beanDiaSemana.setNombre(rs.getString("dia"));

                    horario.setIdHorario(rs.getInt("ha.idHorario"));
                    horario.setHoraInicio(rs.getString("ha.horaInicio"));
                    horario.setHoraFin(rs.getString("ha.horaFin"));
                    horario.setDiaSemana(beanDiaSemana);
                    horarios.add(horario);
                    profesor.setHorarios(horarios);
                }

            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return profesores;
    }

    public List<BeanMaterias> consultarMaterias() throws SQLException {
        List<BeanMaterias> materias = new ArrayList<>();
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");
            connection = ConnectionMysql.getConnection();
            String query = "select m.idMateria, m.Nombre from alumnoinscrito ai\n" +
                    "inner join clase c\n" +
                    "inner join materias m on m.idMateria=c.idMateria where ai.matricula = ? group by m.idMateria;";
            pstm = connection.prepareStatement(query);

            pstm.setString(1, beanUsuario.getUsuario());
            rs = pstm.executeQuery();
            while(rs.next()){
                BeanMaterias beanMaterias = new BeanMaterias();
                beanMaterias.setIdMateria(rs.getString("m.idMateria"));
                beanMaterias.setNombre(rs.getString("m.Nombre"));
                materias.add(beanMaterias);
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return materias;
    }
    public Map<String,Object> consultarAsesoriasPendientesDocente() throws SQLException{
        List<BeanAsesorias> asesoriasList = new ArrayList<>();
        int errorProfesor;
        Map<String, Object> map = new HashMap<>();
        try {
            connection = ConnectionMysql.getConnection();
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
            cstm = connection.prepareCall("{CALL consultaAsesoriasPendientesDocente(?,?)}");
            cstm.setString(1, usuario.getClaveIdentidad());
            cstm.registerOutParameter(2, Types.INTEGER);
            rs = cstm.executeQuery();
            errorProfesor = cstm.getInt(2);
            if (errorProfesor == 0){
                while (rs.next()){
                    BeanAsesorias asesoria = new BeanAsesorias
                            (
                                    rs.getInt("idAsesoria"),
                                    new BeanAlumnoInscrito(rs.getString("matricula"), rs.getString("nombre_completo")),
                                    new BeanMaterias(rs.getString("materia")),
                                    new BeanEstadoAsesoria(rs.getString("estado_asesoria")),
                                    rs.getString("tema"),
                                    rs.getString("dudas"),
                                    rs.getString("hora"),
                                    rs.getInt("riesgo"),
                                    new BeanCarrera(rs.getString("carrera")),
                                    rs.getString("fecha"),
                                    new BeanGrupos(rs.getInt("cuatrimestre"), rs.getString("grupo"))
                            );
                    asesoriasList.add(asesoria);
                }
                map.put("Data", asesoriasList);
                map.put("Message", "Consulta exitosa");
                map.put("Error", false);
            }else {
                map.put("Data", null);
                map.put("Message", "El profesor no existe");
                map.put("Error", false);
            }
        }catch (SQLException e){
            Logger.getLogger(DaoAsesoria.class.getName()).log(Level.SEVERE,"Ha ocurrido un error en el método consultarAsesoriasDocente " + e);
        }finally {
            closeConnection();
        }
        return map;
    }

    public Map<String, Object> isAceptadaORechazada(BeanAsesorias asesoria) throws SQLException {
        int errorIdAsesoria, errorEstado, estadoErroneo, actualizado;
        //Para los errores
        Map<String, Object> map = new HashMap<>();

        try {
            connection = ConnectionMysql.getConnection();
            cstm = connection.prepareCall("{CALL actualizarEstadoRechazadaAceptada(?,?,?,?,?,?,?)}");
            cstm.setInt(1, asesoria.getIdAsesoria());
            cstm.setInt(2, asesoria.getIdEstadoAsesoria().getIdEstadoAsesoria());
            cstm.setString(3, asesoria.getMotivosRechazo());
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, Types.INTEGER);
            cstm.registerOutParameter(6, Types.INTEGER);
            cstm.registerOutParameter(7, Types.INTEGER);
            cstm.executeUpdate();
            //rs solo para consultas
            errorIdAsesoria = cstm.getInt(4);
            errorEstado = cstm.getInt(5);
            estadoErroneo = cstm.getInt(6);
            actualizado = cstm.getInt(7);
            if (actualizado == 1){
                if (errorIdAsesoria == 0 && errorEstado == 0){

                    if (estadoErroneo == 0){
                        map.put("Message","Asesoría actualizada exitosamente");
                        map.put("Error", false);
                    }else {
                        map.put("Estado","El estado no es el correspondiente");
                        map.put("Error", true);
                    }

                }
            }else {
                map.put("Actualizado","No se actualizó");
                map.put("Error", true);
                if (errorIdAsesoria == 1){
                    map.put("Asesoria", "No existe la asesoría");
                    map.put("Error", true);
                }

                if (errorEstado == 1) {
                    map.put("Estado", "No existe el estado");
                    map.put("Error", true);
                }

            }
        }catch (SQLException e){
            map.put("Servidor","Ha ocurrido un error en el servidor");
            Logger.getLogger(DaoAsesoria.class.getName()).log(Level.SEVERE,"Ha ocurrido un error en el método isAceptada " + e);

        }finally {
            closeConnection();
        }
        return map;

    }

    public Map<String, Object> isImpartida(BeanAsesorias asesoria) throws SQLException {
        Map<String, Object> map = new HashMap<>();
        int errorIdAsesoria,errorEstado, estadoErroneo;
        try {
            connection = ConnectionMysql.getConnection();
            cstm = connection.prepareCall("{CALL actualizarEstadoImpartida(?,?,?,?,?,?,?}");
            cstm.setInt(1,asesoria.getIdAsesoria());
            cstm.setInt(2,asesoria.getIdEstadoAsesoria().getIdEstadoAsesoria());
            cstm.setInt(3, asesoria.getDuracion());
            cstm.setInt(4, asesoria.getAsistenciaAlumno());
            cstm.registerOutParameter(5,Types.INTEGER);
            cstm.registerOutParameter(6,Types.INTEGER);
            cstm.registerOutParameter(7,Types.INTEGER);
            cstm.executeUpdate();
            errorIdAsesoria = cstm.getInt(5);
            errorEstado = cstm.getInt(6);
            estadoErroneo = cstm.getInt(7);
            if (errorIdAsesoria == 0 && errorEstado == 0){
                if (estadoErroneo == 0){
                    map.put("Message","La asesoría ha sido actualizada correctamente");
                    map.put("Error", false);
                }else{
                    map.put("Estado", "El estado no es el correspondiente");
                    map.put("Error", true);
                }
            }else{
                if (errorIdAsesoria == 1){
                    map.put("Asesoria","La asesoría no existe");
                    map.put("Error", true);
                }
                if (errorEstado == 1){
                    map.put("Estado", "El estado no existe");
                    map.put("Error", true);
                }
            }
        }catch (SQLException e){
            map.put("Servidor","Ha ocurrido un error en el servidor");
            Logger.getLogger(DaoAsesoria.class.getName()).log(Level.SEVERE,"Ha ocurrido un error en el método isImpartida " + e);
        }finally{
            closeConnection();
        }
        return map;
    }

    public Map<String, Object> isCancelada(BeanAsesorias asesoria) throws SQLException {
        Map<String,Object> map = new HashMap<>();
        int errorIdAsesoria, errorEstado, estadoErroneo;

        try {
            connection = ConnectionMysql.getConnection();
            cstm = connection.prepareCall("{CALL actualizarEstadoCancelar(?,?,?,?,?,?)}");
            cstm.setInt(1, asesoria.getIdAsesoria());
            cstm.setInt(2, asesoria.getIdEstadoAsesoria().getIdEstadoAsesoria());
            cstm.setString(3, asesoria.getMotivosCancelacion());
            cstm.registerOutParameter(4,Types.INTEGER);
            cstm.registerOutParameter(5, Types.INTEGER);
            cstm.registerOutParameter(6,Types.INTEGER);
            cstm.executeUpdate();
            errorIdAsesoria = cstm.getInt(4);
            errorEstado = cstm.getInt(5);
            estadoErroneo = cstm.getInt(6);
            if (errorIdAsesoria == 0 && errorEstado == 0){
                if (estadoErroneo == 0){
                    map.put("Message","La asesoría ha sido actualizada correctamente");
                    map.put("Error", false);
                }else {
                    map.put("Estado","El estado no es el correspondiente");
                    map.put("Error", true);
                }
            }else {
                if (errorIdAsesoria == 1){
                    map.put("Asesoria","La asesoria no existe");
                    map.put("Error", true);
                }
                if (errorEstado == 1){
                    map.put("Estado","El estado no existe");
                    map.put("Error", true);
                }
            }
        }catch (SQLException e){
            map.put("Servidor","Ha ocurrido un error en el servidor");
            Logger.getLogger(DaoAsesoria.class.getName()).log(Level.SEVERE,"Ha ocurrido un error en el método isCancelada " + e);
        }finally {
            closeConnection();
        }
        return map;
    }

    public boolean solicitarAsesoria(BeanAsesorias beanAsesorias) throws SQLException {
        boolean result = false;
        return result;
    }
    public boolean cancelarAsesoria(BeanAsesorias beanAsesorias) throws SQLException {
        boolean result = false;
        return result;
    }
    public boolean finalizarAsesoria(BeanAsesorias beanAsesorias) throws SQLException {
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
