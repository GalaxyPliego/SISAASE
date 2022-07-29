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

    public List<BeanAsesorias> findHistorialDetallado( int idPeriodoCuatrimestral) throws SQLException {
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
            pstm.setInt(1, idPeriodoCuatrimestral);
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

    public List<BeanAsesorias> findHistorialAlumno() throws SQLException {
        List<BeanAsesorias> listHistorialAlumno = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "\tSELECT ase.fechaAsesoria, ase.horarioSolicitado, ase.duracion, p.Nombres as nombreProfesor, p.aPaterno as aPaternoProfesor,\n" +
                    "\tm.Nombre as asignatura, ase.tema, \n" +
                    "\tea.nombre as estado, ase.idPeriodoCuatrimestral as periodo,\n" +
                    "\tase.aclaracionDudas as aclaracionDudas\n" +
                    "\tFROM alumnoinscrito ai\n" +
                    "\tJOIN carrera ca ON ai.idCarrera = ca.idCarrera \n" +
                    "\tJOIN asesorias ase ON ai.matricula = ase.matricula\n" +
                    "\tJOIN profesor p ON ase.idProfesor = p.idProfesor\n" +
                    "\tJOIN materias m ON ase.idMateria = m.idMateria\n" +
                    "\tJOIN estadoasesoria ea ON ase.idEstadoAsesoria = ea.idEstadoAsesoria\n" +
                    "\tJOIN periodo_cuatrimestral pc ON ase.idPeriodoCuatrimestral = pc.idPeriodoCuatrimestral\n" +
                    "\tWHERE ase.idPeriodoCuatrimestral = ? AND ase.matricula = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setInt(1, 1);
            pstm.setString(2, "20203tn129");
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanAsesorias asesoria = new BeanAsesorias();
                BeanProfesor profesor = new BeanProfesor();
                BeanMaterias materia = new BeanMaterias();
                BeanEstadoAsesoria estadoAsesoria = new BeanEstadoAsesoria();

                asesoria.setFechaAsesoria(rs.getString("fechaAsesoria"));
                asesoria.setHorarioSolicitado(rs.getString("horarioSolicitado"));
                asesoria.setDuracion(rs.getInt("duracion"));
                asesoria.setTema(rs.getString("tema"));
                asesoria.setAclaracionDudas(rs.getInt("aclaracionDudas"));

                estadoAsesoria.setNombre(rs.getString("estado"));
                asesoria.setIdEstadoAsesoria(estadoAsesoria);

                profesor.setNombres(rs.getString("nombreProfesor"));
                profesor.setaPaterno(rs.getString("aPaternoProfesor"));
                asesoria.setIdProfesor(profesor);

                materia.setNombre(rs.getString("asignatura"));
                asesoria.setIdMateria(materia);
                listHistorialAlumno.add(asesoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listHistorialAlumno);
        return listHistorialAlumno;
    }

    public List<BeanAsesorias> findHistorialDocente() throws SQLException {
        List<BeanAsesorias> listHistorialDocente = new ArrayList<>();
        try{
            connection = ConnectionMysql.getConnection();
            String script = "\tSELECT ase.fechaAsesoria, ai.matricula, ai.Nombres, ai.aPaterno, m.Nombre as asignatura, ase.tema, ea.nombre as estado, \n" +
                    "    ai.nombres as nombresAlumno, ai.matricula, ca.nombrecarrera, g.cuatrimestre, g.grupo, ase.riesgo,\n" +
                    "    ase.horarioSolicitado, ase.duracion, ase.idPeriodoCuatrimestral as periodo,\n" +
                    "\tase.aclaracionDudas as aclaracionDudas, ea.nombre as estadoAsesoria, ase.dudasEspecificas, ase.motivosCancelacion, ase.motivosRechazo\n" +
                    "\tFROM alumnoinscrito ai\n" +
                    "\tJOIN carrera ca ON ai.idCarrera = ca.idCarrera \n" +
                    "  JOIN grupos g ON ai.idGrupoActual = g.idGrupo\n" +
                    "\tJOIN asesorias ase ON ai.matricula = ase.matricula\n" +
                    "\tJOIN profesor p ON ase.idProfesor = p.idProfesor\n" +
                    "\tJOIN materias m ON ase.idMateria = m.idMateria\n" +
                    "\tJOIN estadoasesoria ea ON ase.idEstadoAsesoria = ea.idEstadoAsesoria\n" +
                    "\tJOIN periodo_cuatrimestral pc ON ase.idPeriodoCuatrimestral = pc.idPeriodoCuatrimestral\n" +
                    "\tWHERE ase.idPeriodoCuatrimestral = ? AND ase.idProfesor = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setInt(1, 1);
            pstm.setInt(2, 1);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
                BeanAsesorias asesoria = new BeanAsesorias();
                BeanMaterias materia = new BeanMaterias();
                BeanGrupos grupo = new BeanGrupos();
                BeanEstadoAsesoria estadoAsesoria = new BeanEstadoAsesoria();
                BeanCarrera carrera = new BeanCarrera();

                alumnoInscrito.setMatricula(rs.getString("matricula"));
                alumnoInscrito.setNombres(rs.getString("nombresAlumno"));
                alumnoInscrito.setaPaterno(rs.getString("aPaterno"));
                carrera.setNombreCarrera(rs.getString("nombrecarrera"));
                grupo.setCuatrimestre(rs.getInt("cuatrimestre"));
                grupo.setGrupo(rs.getString("grupo"));
                alumnoInscrito.setIdGrupoActual(grupo);
                asesoria.setBeanCarrera(carrera);
                asesoria.setMatricula(alumnoInscrito);
                asesoria.setFechaAsesoria(rs.getString("fechaAsesoria"));
                asesoria.setHorarioSolicitado(rs.getString("horarioSolicitado"));
                asesoria.setDuracion(rs.getInt("duracion"));
                materia.setNombre(rs.getString("asignatura"));
                asesoria.setIdMateria(materia);
                asesoria.setTema(rs.getString("tema"));
                asesoria.setAclaracionDudas(rs.getInt("aclaracionDudas"));
                estadoAsesoria.setNombre(rs.getString("estado"));
                asesoria.setIdEstadoAsesoria(estadoAsesoria);
                asesoria.setDudasEspecificas(rs.getString("dudasEspecificas"));
                asesoria.setMotivosCancelacion(rs.getString("motivosCancelacion"));
                asesoria.setMotivosRechazo(rs.getString("motivosRechazo"));

                listHistorialDocente.add(asesoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listHistorialDocente);
        return listHistorialDocente;
    }

    public List<BeanAsesorias> cambioHistorialDocente(int idPeriodoCuatrimestral) throws SQLException {
        List<BeanAsesorias> listHistorialDocente = new ArrayList<>();
        System.out.println("idPeriodoCuatrimestral: " + idPeriodoCuatrimestral);
        try{
            connection = ConnectionMysql.getConnection();
            String script = "\tSELECT ase.fechaAsesoria, ai.matricula, ai.Nombres, ai.aPaterno, m.Nombre as asignatura, ase.tema, ea.nombre as estado, \n" +
                    "    ai.nombres as nombresAlumno, ai.matricula, ca.nombrecarrera, g.cuatrimestre, g.grupo, ase.riesgo,\n" +
                    "    ase.horarioSolicitado, ase.duracion, ase.idPeriodoCuatrimestral as periodo,\n" +
                    "\tase.aclaracionDudas as aclaracionDudas, ea.nombre as estadoAsesoria, ase.dudasEspecificas, ase.motivosCancelacion, ase.motivosRechazo\n" +
                    "\tFROM alumnoinscrito ai\n" +
                    "\tJOIN carrera ca ON ai.idCarrera = ca.idCarrera \n" +
                    "  JOIN grupos g ON ai.idGrupoActual = g.idGrupo\n" +
                    "\tJOIN asesorias ase ON ai.matricula = ase.matricula\n" +
                    "\tJOIN profesor p ON ase.idProfesor = p.idProfesor\n" +
                    "\tJOIN materias m ON ase.idMateria = m.idMateria\n" +
                    "\tJOIN estadoasesoria ea ON ase.idEstadoAsesoria = ea.idEstadoAsesoria\n" +
                    "\tJOIN periodo_cuatrimestral pc ON ase.idPeriodoCuatrimestral = pc.idPeriodoCuatrimestral\n" +
                    "\tWHERE ase.idPeriodoCuatrimestral = ? AND ase.idProfesor = ?;";
            pstm = connection.prepareStatement(script);
            pstm.setInt(1, idPeriodoCuatrimestral);
            pstm.setInt(2, 1);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanAlumnoInscrito alumnoInscrito = new BeanAlumnoInscrito();
                BeanAsesorias asesoria = new BeanAsesorias();
                BeanMaterias materia = new BeanMaterias();
                BeanGrupos grupo = new BeanGrupos();
                BeanEstadoAsesoria estadoAsesoria = new BeanEstadoAsesoria();
                BeanCarrera carrera = new BeanCarrera();

                alumnoInscrito.setMatricula(rs.getString("matricula"));
                alumnoInscrito.setNombres(rs.getString("nombresAlumno"));
                alumnoInscrito.setaPaterno(rs.getString("aPaterno"));
                carrera.setNombreCarrera(rs.getString("nombrecarrera"));
                grupo.setCuatrimestre(rs.getInt("cuatrimestre"));
                grupo.setGrupo(rs.getString("grupo"));
                alumnoInscrito.setIdGrupoActual(grupo);
                asesoria.setBeanCarrera(carrera);
                asesoria.setMatricula(alumnoInscrito);
                asesoria.setFechaAsesoria(rs.getString("fechaAsesoria"));
                asesoria.setHorarioSolicitado(rs.getString("horarioSolicitado"));
                asesoria.setDuracion(rs.getInt("duracion"));
                materia.setNombre(rs.getString("asignatura"));
                asesoria.setIdMateria(materia);
                asesoria.setTema(rs.getString("tema"));
                asesoria.setAclaracionDudas(rs.getInt("aclaracionDudas"));
                estadoAsesoria.setNombre(rs.getString("estado"));
                asesoria.setIdEstadoAsesoria(estadoAsesoria);
                asesoria.setDudasEspecificas(rs.getString("dudasEspecificas"));
                asesoria.setMotivosCancelacion(rs.getString("motivosCancelacion"));
                asesoria.setMotivosRechazo(rs.getString("motivosRechazo"));

                listHistorialDocente.add(asesoria);
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }finally {
            closeConnection();
        }
        System.out.println("==> " + listHistorialDocente);
        return listHistorialDocente;
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
