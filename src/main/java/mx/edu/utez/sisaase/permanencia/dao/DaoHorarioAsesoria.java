package mx.edu.utez.sisaase.permanencia.dao;


import mx.edu.utez.sisaase.permanencia.bean.BeanDiaSemana;
import mx.edu.utez.sisaase.permanencia.bean.BeanHorariosAsesoria;
import mx.edu.utez.sisaase.permanencia.bean.BeanPeriodoCuatrimestral;
import mx.edu.utez.sisaase.permanencia.bean.BeanProfesor;
import mx.edu.utez.sisaase.utils.ConnectionMysql;

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
        try {
            connection = ConnectionMysql.getConnection();
            String script = "SELECT d.idDia, d.nombre, ha.idHorario, ha.horaInicio, ha.horaFin, ha.idDia, ha.idProfesor, ha.idPeriodoCuatrimestral FROM diasemana d LEFT JOIN horariosasesoria ha ON ha.idDia = d.idDia AND ha.idProfesor=2 ORDER BY d.idDia ASC";
            pstm = connection.prepareStatement(script);
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
        for (BeanHorariosAsesoria horariosAsesoria : dao.consultarHorario()) {
            System.out.println("Datos");
            System.out.println("-> " + horariosAsesoria.getIdHorario());
            System.out.println("-> " + horariosAsesoria.getHoraInicio());
            System.out.println("-> " + horariosAsesoria.getHoraFin());
            System.out.println("-> " + horariosAsesoria.getDiaSemana().getNombre());
            System.out.println("-> " + horariosAsesoria.getProfesor());
            System.out.println("-> " + horariosAsesoria.getPeriodoCuatrimestral());

        }

    }




}
