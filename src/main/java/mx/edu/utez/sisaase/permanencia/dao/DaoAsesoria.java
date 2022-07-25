package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.BeanAsesorias;

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

    public List<BeanAsesorias> consultarAsesorias() throws SQLException {
        List<BeanAsesorias> listaAsesorias = new ArrayList<>();
        return listaAsesorias;
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
}
