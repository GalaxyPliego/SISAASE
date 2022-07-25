package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;
import mx.edu.utez.sisaase.permanencia.bean.BeanProfesor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProfesor {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public List<BeanProfesor> consultarProfesores() throws SQLException {
        List<BeanProfesor> listaProfesores = new ArrayList<>();
        return listaProfesores;
    }
}
