package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanPlanesEstudio;
import mx.edu.utez.sisaase.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoMaterias {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public List<BeanPlanesEstudio> consultarPlanesEstudio () throws SQLException {
        List<BeanPlanesEstudio> listPlanesEstudio = new ArrayList<>();
        connection = ConnectionMysql.getConnection();
        String script = "";
        pstm = connection.prepareStatement(script);
        rs = pstm.executeQuery();
        while (rs.next()){

        }
        return listPlanesEstudio;

    }

}
