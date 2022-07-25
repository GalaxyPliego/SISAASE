package mx.edu.utez.sisaase.permanencia.dao;

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

    public boolean iniciarSesion(BeanUsuario beanUsuario) throws SQLException {
        boolean result = false;
        return result;
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
