package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanDiaSemana;
import mx.edu.utez.sisaase.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoDiaSemana {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public List<BeanDiaSemana> consultarDias() throws SQLException {
        List<BeanDiaSemana> listBeanDiaSemana = new ArrayList<>();
        try {
            connection = ConnectionMysql.getConnection();
            String script = "SELECT d.idDia, d.nombre FROM diasemana d ORDER BY idDia ASC";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();
            while (rs.next()) {
                listBeanDiaSemana.add(
                        new BeanDiaSemana(
                                rs.getInt("idDia"),
                                rs.getString("nombre")
                        ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return listBeanDiaSemana;

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
        DaoDiaSemana dao = new DaoDiaSemana();
        for (BeanDiaSemana diaSemana : dao.consultarDias()) {
            System.out.println("Datos");
            System.out.println("-> " + diaSemana.getIdDia());
            System.out.println("-> " + diaSemana.getNombre());
        }

    }

}
