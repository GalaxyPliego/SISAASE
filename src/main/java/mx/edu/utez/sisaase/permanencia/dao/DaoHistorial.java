package mx.edu.utez.sisaase.permanencia.dao;

import mx.edu.utez.sisaase.permanencia.bean.*;
import mx.edu.utez.sisaase.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoHistorial {

    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    /* == > COORDINADOR < == */
    public List<BeanAsesorias> consultarResumenHistorial(){
        List<BeanAsesorias> listAsesorias = new ArrayList<>();

        return listAsesorias;
    }

    public List<BeanAsesorias> consultarHisotrialDetallado(){
        List<BeanAsesorias> listAsesorias = new ArrayList<>();
        return listAsesorias;
    }

    public List<BeanAsesorias> consultarHisotrialGeneral(){
        List<BeanAsesorias> listAsesorias = new ArrayList<>();

        return listAsesorias;
    }

    /* == > ALUMNO < == */
    public List<BeanAsesorias> consultarHistorialAlumno(){
        List<BeanAsesorias> listAsesorias = new ArrayList<>();

        return listAsesorias;
    }

    /* == > PROFESOR < == */
    public List<BeanAsesorias> consultarHistorialProfesor(){
        List<BeanAsesorias> listAsesorias = new ArrayList<>();

        return listAsesorias;
    }

    public List<BeanPeriodoCuatrimestral> findPeriodoCuatrimestral() throws SQLException {
        List<BeanPeriodoCuatrimestral> listPeriodoCuatrimestral = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "SELECT * FROM periodo_cuatrimestral;";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanPeriodoCuatrimestral periodoCuatrimestral = new BeanPeriodoCuatrimestral();
                periodoCuatrimestral.setIdPeriodoCuatrimestral(rs.getInt("idPeriodoCuatrimestral"));
                periodoCuatrimestral.setFechaInicio(rs.getString("fechaInicio"));
                periodoCuatrimestral.setFechaFin(rs.getString("fechaFin"));
                periodoCuatrimestral.setPeriodoMes(rs.getString("periodoMes"));
                periodoCuatrimestral.setPeriodoAxo(rs.getString("periodoAxo"));
                periodoCuatrimestral.setNombreCuatrimestre(rs.getString("nombreCuatrimestre"));
                listPeriodoCuatrimestral.add(periodoCuatrimestral);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listPeriodoCuatrimestral);
        return listPeriodoCuatrimestral;
    }


    public List<BeanCarrera> findCarreras() throws SQLException {
        List<BeanCarrera> listCarreras = new ArrayList<>();
        BeanDivisionAcademica divisionAcademica = new BeanDivisionAcademica();
        BeanNivelAcademico nivelAcademico = new BeanNivelAcademico();

        try{
            connection = ConnectionMysql.getConnection();
            String script = "SELECT * FROM carrera;";
            pstm = connection.prepareStatement(script);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanCarrera carrera = new BeanCarrera();
                carrera.setIdCarrera(rs.getInt("idCarrera"));
                carrera.setNombreCarrera(rs.getString("nombreCarrera"));
                carrera.setEstado(rs.getString("estado"));
                carrera.setmCarrera(rs.getString("mCarrera"));
                carrera.setOferta(rs.getString("oferta"));
                divisionAcademica.setIdDivision(rs.getInt("idDivision"));
                carrera.setIdDivision(divisionAcademica);
                nivelAcademico.setIdNivelAcademico(rs.getInt("idNivelAcademico"));
                carrera.setIdNivelAcademico(nivelAcademico);
                listCarreras.add(carrera);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listCarreras);
        return listCarreras;
    }

    public List<BeanAsesorias> findHistorialGeneral() throws SQLException {
        List<BeanAsesorias> listHistorialGeneral = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "SELECT ai.matricula, ai.Nombres, ai.aPaterno, ai.Sexo, ca.nombrecarrera, g.cuatrimestre, \n" +
                    "g.grupo, ase.riesgo, ase.fechaAsesoria, p.Nombres as nombreProfesor, p.aPaterno as aPaternoProfesor, m.Nombre as asignatura, ase.tema, \n" +
                    "ase.aclaracionDudas as aclaracionDudas, ea.nombre as estado, ase.idPeriodoCuatrimestral as periodo, ase.motivosCancelacion, ase.motivosRechazo, ase.horaCancelacion, ase.rolCancelacion,\n" +
                    "ca.nombrecarrera\n" +
                    "FROM alumnoinscrito ai JOIN grupos g ON ai.idGrupoActual = g.idGrupo\n" +
                    "JOIN carrera ca ON ai.idCarrera = ca.idCarrera \n" +
                    "JOIN asesorias ase ON ai.matricula = ase.matricula\n" +
                    "JOIN profesor p ON ase.idProfesor = p.idProfesor\n" +
                    "JOIN materias m ON ase.idMateria = m.idMateria\n" +
                    "JOIN estadoasesoria ea ON ase.idEstadoAsesoria = ea.idEstadoAsesoria\n" +
                    "JOIN periodo_cuatrimestral pc ON ase.idPeriodoCuatrimestral = pc.idPeriodoCuatrimestral\n" +
                    "WHERE ase.idPeriodoCuatrimestral = ? AND ca.idCarrera = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setInt(1, 1);
            pstm.setInt(2, 1);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanAsesorias asesoria = new BeanAsesorias();
                BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
                BeanCarrera carrera = new BeanCarrera();
                BeanGrupos grupo = new BeanGrupos();
                BeanProfesor profesor = new BeanProfesor();
                BeanMaterias materia = new BeanMaterias();
                BeanEstadoAsesoria estadoAsesoria = new BeanEstadoAsesoria();

                System.out.println(rs.getString("matricula") + rs.getString("Nombres") + rs.getString("Sexo") + rs.getString("nombrecarrera") + rs.getString("cuatrimestre") + rs.getString("grupo") + rs.getString("periodo"));

                alumnoInscrito.setMatricula(rs.getString("matricula"));
                alumnoInscrito.setNombres(rs.getString("Nombres"));
                alumnoInscrito.setaPaterno(rs.getString("aPaterno"));
                alumnoInscrito.setSexo(rs.getString("Sexo"));
                carrera.setNombreCarrera(rs.getString("nombrecarrera"));
                alumnoInscrito.setIdCarrera(carrera);
                grupo.setCuatrimestre(Integer.parseInt(rs.getString("cuatrimestre")));
                grupo.setGrupo(rs.getString("grupo"));
                alumnoInscrito.setIdGrupoActual(grupo);
                asesoria.setMatricula(alumnoInscrito);
                profesor.setNombres(rs.getString("nombreProfesor"));
                profesor.setaPaterno(rs.getString("aPaternoProfesor"));
                asesoria.setIdProfesor(profesor);

                materia.setNombre(rs.getString("asignatura"));
                asesoria.setIdMateria(materia);

                asesoria.setTema(rs.getString("tema"));
                asesoria.setAclaracionDudas(rs.getInt("aclaracionDudas"));

                estadoAsesoria.setNombre(rs.getString("estado"));
                asesoria.setIdEstadoAsesoria(estadoAsesoria);

                asesoria.setMotivosCancelacion(rs.getString("motivosCancelacion"));
                asesoria.setMotivosRechazo(rs.getString("motivosRechazo"));
                asesoria.setHoraCancelacion(rs.getString("horaCancelacion"));
                asesoria.setRolCancelacion(rs.getString("rolCancelacion"));
                asesoria.setRiesgo(rs.getInt("riesgo"));
                asesoria.setFechaAsesoria(rs.getString("fechaAsesoria"));

                listHistorialGeneral.add(asesoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listHistorialGeneral);
        return listHistorialGeneral;
    }

    public List<BeanAsesorias> findHistorialDetallado() throws SQLException {
        List<BeanAsesorias> listHistorialDetallado = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "SELECT ai.matricula, ai.Nombres, ai.Sexo, ca.nombrecarrera, g.cuatrimestre, g.grupo, ase.idPeriodoCuatrimestral as periodo,\n" +
                    "count(ase.matricula) as NoAsesoria\n" +
                    "FROM alumnoinscrito ai JOIN grupos g ON ai.idGrupoActual = g.idGrupo\n" +
                    "JOIN carrera ca ON ai.idCarrera = ca.idCarrera \n" +
                    "JOIN asesorias ase ON ai.matricula = ase.matricula\n" +
                    "JOIN periodo_cuatrimestral pc ON ase.idPeriodoCuatrimestral = pc.idPeriodoCuatrimestral\n" +
                    "WHERE ase.idPeriodoCuatrimestral = ? group by ase.matricula;";
            pstm = connection.prepareStatement(script);
            pstm.setInt(1, 1);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanAsesorias asesoria = new BeanAsesorias();
                BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
                BeanCarrera carrera = new BeanCarrera();
                BeanGrupos grupo = new BeanGrupos();

                System.out.println(rs.getString("matricula") + rs.getString("Nombres") + rs.getString("Sexo") + rs.getString("nombrecarrera") + rs.getString("cuatrimestre") + rs.getString("grupo") + rs.getString("periodo") + rs.getString("NoAsesoria"));

                alumnoInscrito.setMatricula(rs.getString("matricula"));
                alumnoInscrito.setNombres(rs.getString("Nombres"));
                alumnoInscrito.setSexo(rs.getString("Sexo"));
                carrera.setNombreCarrera(rs.getString("nombrecarrera"));
                alumnoInscrito.setIdCarrera(carrera);
                grupo.setCuatrimestre(Integer.parseInt(rs.getString("cuatrimestre")));
                grupo.setGrupo(rs.getString("grupo"));
                alumnoInscrito.setIdGrupoActual(grupo);
                asesoria.setMatricula(alumnoInscrito);
                asesoria.setNoAsesorias(rs.getInt("NoAsesoria"));
                listHistorialDetallado.add(asesoria);

//                System.out.println(rs.getString("matricula") + rs.getString("Nombres") + rs.getString("Sexo") + rs.getString("nombrecarrera") + rs.getString("cuatrimestre") + rs.getString("grupo") + rs.getString("periodo") + rs.getString("NoAsesoria"));
//                listHistorialDetallado.add(new BeanAsesorias(
//                        new BeanAlumnoInscrito(rs.getString("matricula"), rs.getString("Nombres"), rs.getString("Sexo"), rs.getString("nombrecarrera"), rs.getString("cuatrimestre"), rs.getString("grupo")),
//                        rs.getInt("NoAsesoria")
//                ));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listHistorialDetallado);
        return listHistorialDetallado;
    }

    private void closeConnection() throws SQLException{
        if(rs != null){
            rs.close();
        }
        if(pstm != null ){
            pstm.close();
        }
        if(connection != null){
            connection.close();
        }
    }


}
