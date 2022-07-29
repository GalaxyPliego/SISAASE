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

public class DaoHorarioAsesoria {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;
    public List<BeanHorariosAsesoria> consultarHorario () throws SQLException {
        List<BeanHorariosAsesoria> listBeanHorarioAsesoria = new ArrayList<>();
        HttpSession session = ServletActionContext.getRequest().getSession();
        BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");

        try {
            connection = ConnectionMysql.getConnection();
            String script = "SELECT d.idDia, d.nombre, ha.idHorario, ha.horaInicio, ha.horaFin, ha.idDia, ha.idProfesor, ha.idPeriodoCuatrimestral FROM diasemana d LEFT JOIN horariosasesoria ha ON ha.idDia = d.idDia AND ha.idProfesor=? ORDER BY d.idDia ASC";
            pstm = connection.prepareStatement(script);
            pstm.setString(1,beanUsuario.getClaveIdentidad());
            rs = pstm.executeQuery();
            while (rs.next()){
                listBeanHorarioAsesoria.add(
                        new BeanHorariosAsesoria(
                                rs.getInt("idHorario"),
                                rs.getString("horaInicio"),
                                rs.getString("horaFin"),
                                new BeanDiaSemana(
                                        rs.getInt("idDia"),
                                        rs.getString("nombre")),
                                new BeanProfesor(rs.getInt("idProfesor")),
                                new BeanPeriodoCuatrimestral(rs.getInt("idPeriodoCuatrimestral"))
                        ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection();

        }
        return listBeanHorarioAsesoria;
    }
    public List<BeanPeriodoCuatrimestral> consultarPeriodoCuatrimestral (){
        List<BeanPeriodoCuatrimestral> listBeanPeriodoCuatrimestral = new ArrayList<>();
        try {
            connection = ConnectionMysql.getConnection();
            String script = "SELECT pc.idPeriodoCuatrimestral, pc.fechaInicio, pc.fechaFin, pc.periodoMes, pc.periodoAxo, pc.nombreCuatrimestre FROM periodo_cuatrimestral pc";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();
            while (rs.next()){
                listBeanPeriodoCuatrimestral.add(
                        new BeanPeriodoCuatrimestral(
                                rs.getInt("idPeriodoCuatrimestral"),
                                rs.getString("fechaInicio"),
                                rs.getString("fechaFin"),
                                rs.getString("periodoMes"),
                                rs.getString("periodoAxo"),
                                rs.getString("nombreCuatrimestre")
                        ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listBeanPeriodoCuatrimestral;
    }



    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            connection.close();
        }
        if (connection != null) {
            connection.close();
        }
    }

    public static void main(String[] args) throws SQLException {
        DaoHorarioAsesoria dao = new DaoHorarioAsesoria();
//        for (BeanHorariosAsesoria horariosAsesoria : dao.consultarHorario()) {
//            System.out.println("Datos");
//            System.out.println("-> " + horariosAsesoria.getIdHorario());
//            System.out.println("-> " + horariosAsesoria.getHoraInicio());
//            System.out.println("-> " + horariosAsesoria.getHoraFin());
//            System.out.println("-> " + horariosAsesoria.getDiaSemana().getNombre());
//            System.out.println("-> " + horariosAsesoria.getProfesor());
//            System.out.println("-> " + horariosAsesoria.getPeriodoCuatrimestral());
//
//        }
        for (BeanPeriodoCuatrimestral periodoCuatrimestral : dao.consultarPeriodoCuatrimestral())
        {
            System.out.println("DATOS");
            System.out.println("-> " + periodoCuatrimestral.getIdPeriodoCuatrimestral());
            System.out.println("-> " + periodoCuatrimestral.getFechaInicio());
            System.out.println("-> " + periodoCuatrimestral.getFechaFin());
            System.out.println("-> " + periodoCuatrimestral.getPeriodoMes());
            System.out.println("-> " + periodoCuatrimestral.getPeriodoAxo());
            System.out.println("-> " + periodoCuatrimestral.getNombreCuatrimestre());
        }
    }




}
