package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.*;
import mx.edu.utez.sisaase.utils.ConnectionMysql;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoAsesoria {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

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
