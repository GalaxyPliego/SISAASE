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

public class DaoMaterias {
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public List<BeanPlanesEstudio> consultarPlanesEstudio () throws SQLException {
        List<BeanPlanesEstudio> listPlanesEstudio = new ArrayList<>();
        HttpSession session = ServletActionContext.getRequest().getSession();
        BeanUsuario beanUsuario = (BeanUsuario) session.getAttribute("usuario");
        try {
            connection = ConnectionMysql.getConnection();
            String script = "SELECT pe.idPlan, pe.AxoVigente, pe.idEspecialidad, pe.idCarrera, e.descripcion,\n" +
                    "c.idCarrera, c.nombrecarrera, pxc.idCarrera, pxc.idProfesor, \n" +
                    "plxca.idPlan, plxca.idCarrera, plxca.idGeneracion, \n" +
                    "p.Nombres,\n" +
                    " m.idMateria , m.Nombre, m.Cuatrimestre\n" +
                    "FROM planesestudio pe \n" +
                    "INNER JOIN especialidad e ON e.idEspecialidad = pe.idEspecialidad\n" +
                    "INNER JOIN carrera c ON c.idCarrera = pe.idCarrera \n" +
                    "INNER JOIN profesorxcarrera pxc ON pxc.idCarrera = c.idCarrera\n" +
                    "INNER JOIN planesxcarrera plxca ON plxca.idCarrera = c.idCarrera \n" +
                    "INNER JOIN profesor p ON pxc.idProfesor = p.idProfesor\n" +
                    "INNER JOIN materias m ON pe.idPlan= m.idPlan\n" +
                    "WHERE p.idProfesor=? ORDER BY Cuatrimestre ASC";
            pstm = connection.prepareStatement(script);
            pstm.setString(1,beanUsuario.getClaveIdentidad());
            rs = pstm.executeQuery();
            while (rs.next()){
                listPlanesEstudio.add(
                        new BeanPlanesEstudio(
                                rs.getInt("idPlan"),
                                rs.getInt("AxoVigente"),
                                new BeanEspecialidad(
                                        rs.getInt("idEspecialidad"),
                                        rs.getString("descripcion")
                                ),
                                new BeanCarrera(
                                        rs.getInt("idCarrera"),
                                        rs.getString("nombrecarrera")
                                ),
                                new BeanProfesorxCarrera(
                                        new BeanCarrera(
                                                rs.getInt("idCarrera")
                                        ),
                                        new BeanProfesor(
                                                rs.getInt("idProfesor")
                                        )
                                ),
                                new BeanPlanesxCarrera(
                                        new BeanPlanesEstudio(
                                                rs.getInt("idPlan")
                                        ),
                                        new BeanCarrera(
                                                rs.getInt("idCarrera")
                                        ),
                                        new BeanGeneracion(
                                                rs.getInt("idGeneracion")
                                        )
                                ),
                                new BeanProfesor(
                                        rs.getInt("idProfesor")
                                ),
                                new BeanMaterias(
                                        rs.getString("idMateria"),
                                        rs.getString("Nombre"),
                                        rs.getInt("Cuatrimestre")
                                )
                        ));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }finally {
            closeConnection();
        }

        return listPlanesEstudio;

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
            DaoMaterias daoMaterias = new DaoMaterias();
        for (BeanPlanesEstudio planesEstudio : daoMaterias.consultarPlanesEstudio())
        {
            System.out.println("DATOS");
            System.out.println(" idPlan:  " + planesEstudio.getIdPlan());
            System.out.println(" axoVigente:  " + planesEstudio.getAxoVigente());
            System.out.println(" idEspecialidad: " + planesEstudio.getEspecialidad().getIdEspecialidad());
            System.out.println(" idCarrera: " + planesEstudio.getCarrera().getIdCarrera());
            System.out.println(" idEspecialidad: " + planesEstudio.getEspecialidad().getIdEspecialidad());
            System.out.println(" descripcionEspecialidad: " + planesEstudio.getEspecialidad().getDescripcion());
            System.out.println(" idCarrera: " + planesEstudio.getCarrera().getIdCarrera());
            System.out.println(" nombreCarrera: " + planesEstudio.getCarrera().getNombreCarrera());
            System.out.println(" pxc idCarrera: " + planesEstudio.getProfesorxCarrera().getBeanCarrera().getIdCarrera());
            System.out.println(" pxc idProfesor: " + planesEstudio.getProfesorxCarrera().getBeanProfesor().getIdProfesor());
            System.out.println(" plxc idPlan: " + planesEstudio.getPlanesxCarrera().getBeanPlanesEstudio().getIdPlan());
            System.out.println(" plxc idCarrera: " + planesEstudio.getPlanesxCarrera().getBeanCarrera().getIdCarrera());
            System.out.println(" pxlc idGeneracion " + planesEstudio.getPlanesxCarrera().getBeanGeneracion().getIdGeneracion());
            System.out.println(" p nombre " + planesEstudio.getProfesor().getNombres());
            System.out.println(" m idMateria " + planesEstudio.getMaterias().getIdMateria());
            System.out.println(" m nombre " + planesEstudio.getMaterias().getNombre());
        }

    }

}
