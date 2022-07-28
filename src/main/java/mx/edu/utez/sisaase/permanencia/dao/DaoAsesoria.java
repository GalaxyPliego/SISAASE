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

    public List<BeanProfesor> consultarHorarios() throws SQLException {
        List<BeanProfesor> profesores = new ArrayList<>();
        List<BeanHorariosAsesoria> horarios = new ArrayList<>();
        BeanProfesor profesor = new BeanProfesor();
        try {
            HttpSession session = ServletActionContext.getRequest().getSession();
            BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

            connection = ConnectionMysql.getConnection();
            String query = "SELECT profesor.idProfesor, profesor.nombres, profesor.aMaterno, profesor.aPaterno, " +
                    "ha.idHorario, ha.horaInicio, ha.horaFin, ds.nombre as dia, ds.idDia \n" +
                    "from profesor\n" +
                    "inner join profesorxcarrera pc on pc.idProfesor = profesor.idProfesor\n" +
                    "inner join alumnoinscrito ai on ai.matricula = ?\n" +
                    "inner join carrera c on pc.idCarrera = c.idCarrera && c.idCarrera = ai.idCarrera\n" +
                    "inner join horariosasesoria ha on profesor.idProfesor = ha.idProfesor \n" +
                    "&& (select MAX(idPeriodoCuatrimestral) from periodo_cuatrimestral) = ha.idPeriodoCuatrimestral\n" +
                    "inner join diasemana ds on ds.idDia = ha.idDia;";
            pstm = connection.prepareStatement(query);
            pstm.setString(1, beanUsuario.getClaveIdentidad());
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
                    profesores.add(profesor);
                    horarios = new ArrayList<>();
                    profesor = new BeanProfesor();
                    profesor.setIdProfesor(rs.getInt("profesor.idProfesor"));
                    profesor.setNombres(rs.getString("profesor.nombres"));
                    profesor.setaMaterno(rs.getString("profesor.aMaterno"));
                    profesor.setaPaterno(rs.getString("profesor.aPaterno"));
                    idProfe = rs.getInt("profesor.idProfesor");

                }else if(profesores.size()==0){
                    profesor.setIdProfesor(rs.getInt("profesor.idProfesor"));
                    profesor.setNombres(rs.getString("profesor.nombres"));
                    profesor.setaMaterno(rs.getString("profesor.aMaterno"));
                    profesor.setaPaterno(rs.getString("profesor.aPaterno"));
                    idProfe = rs.getInt("profesor.idProfesor");
                    profesores.add(profesor);


                }







            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return horarios;
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
