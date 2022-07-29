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
    static Connection connection;
    static PreparedStatement pstm;
    static CallableStatement cstm;
    static ResultSet rs;

    public List<BeanAsesorias> consultarAsesorias() throws SQLException {
        List<BeanAsesorias> listaAsesorias = new ArrayList<>();
        connection = ConnectionMysql.getConnection();
        String script = "";
        pstm = connection.prepareStatement(script);
        rs = pstm.executeQuery();
        while (rs.next()){
            List<BeanAsesorias> asesorias = new ArrayList<>();
        }
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
    public static List<BeanAsesorias> consultarAsesoriasPendientesDocente(String clave) throws SQLException{
        List<BeanAsesorias> asesoriasList = new ArrayList<>();
        try {
            connection = ConnectionMysql.getConnection();
//            HttpSession session = ServletActionContext.getRequest().getSession();
//            BeanUsuario usuario = (BeanUsuario) session.getAttribute("usuario");
            cstm = connection.prepareCall("{CALL consultaAsesoriasPendientesDocente(?,?)}");
            cstm.setString(1, clave);
            cstm.registerOutParameter(2, Types.INTEGER);
            rs = cstm.executeQuery();
            while (rs.next()){
                BeanAsesorias asesoria = new BeanAsesorias
                        (
                                rs.getInt("idAsesoria"),
                                new BeanAlumnoInscrito(rs.getString("matricula"), rs.getString("apellido_paterno"),
                                        rs.getString("apellido_materno"), rs.getString("nombre")),
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
        }catch (SQLException e){
            Logger.getLogger(DaoAsesoria.class.getName()).log(Level.SEVERE,"Ha ocurrido un error en el método consultarAsesoriasDocente " + e);
        }finally {
            closeConnection();
        }
        return asesoriasList;
    }

    public static Map<String, String> isAceptada(BeanAsesorias asesoria) throws SQLException {
        int errorIdAsesoria, errorEstado, estadoErroneo;
        boolean aceptada = false;
        //Para los errores
        Map<String, String> map = new HashMap<>();

        try {
            connection = ConnectionMysql.getConnection();
            cstm = connection.prepareCall("{CALL actualizarEstadoRechazadaAceptada(?,?,?,?,?,?)}");
            cstm.setInt(1, asesoria.getIdAsesoria());
            cstm.setInt(2, asesoria.getIdEstadoAsesoria().getIdEstadoAsesoria());
            cstm.setString(3, asesoria.getMotivosRechazo());
            cstm.registerOutParameter(4, Types.INTEGER);
            cstm.registerOutParameter(5, Types.INTEGER);
            cstm.registerOutParameter(6, Types.INTEGER);
            cstm.executeUpdate();
            //rs solo para consultas
            errorIdAsesoria = cstm.getInt(4);
            errorEstado = cstm.getInt(5);
            estadoErroneo = cstm.getInt(6);

            if (errorIdAsesoria == 0 && errorEstado == 0){

                if (estadoErroneo == 0){
                    map.put("Exitoso","Asesoría aceptada exitosamente");
                }else {
                    map.put("Estado","El estado no es el correspondiente");
                }

            }else {

                if (errorIdAsesoria == 1){
                    map.put("Asesoria", "No existe la asesoría");
                }

                if (errorEstado == 1) {
                    map.put("Estado", "No existe el estado");
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

    private static void closeConnection() throws SQLException {
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


    public static void main(String[] args) throws SQLException {
        /*List<BeanAsesorias> datos = consultarAsesoriasPendientesDocente("1");
        for (BeanAsesorias asesoria : datos) {
            //System.out.println("Id: " + asesoria.getIdAsesoria());
            System.out.println("Nombres: " + asesoria.getMatricula().getNombres());
            System.out.println("Apellido Paterno: " + asesoria.getMatricula().getaPaterno());
            System.out.println("Apellido Materno: " + asesoria.getMatricula().getaMaterno());
            System.out.println("Matricula: " + asesoria.getMatricula().getMatricula());
            System.out.println("Fecha: " + asesoria.getFechaAsesoria());
            System.out.println("Hora: " + asesoria.getHorarioSolicitado());
            System.out.println("Tema: " + asesoria.getTema());
            System.out.println("Dudas específicas: " + asesoria.getDudasEspecificas());
            System.out.println("Riesgo: " + asesoria.getRiesgo());
            System.out.println("Carrera: " + asesoria.getCarrera().getNombreCarrera());
            System.out.println("Grupo: " + asesoria.getGrupo().getGrupo());
            System.out.println("Cuatrimestre: " + asesoria.getGrupo().getCuatrimestre());
            System.out.println("Materia: " + asesoria.getIdMateria().getNombre());
            System.out.println("Estado: " + asesoria.getIdEstadoAsesoria().getNombre());
        }*/
        BeanAsesorias aceptarAsesoria = new BeanAsesorias(2, new BeanEstadoAsesoria(2), null);
        Map<String, String> mensaje = isAceptada(aceptarAsesoria);
        System.out.println(mensaje);

    }
}
