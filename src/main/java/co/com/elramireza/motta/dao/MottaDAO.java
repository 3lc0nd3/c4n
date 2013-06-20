package co.com.elramireza.motta.dao;

import co.com.elramireza.pn.dao.PnDAO;
import co.com.elramireza.pn.model.Empleado;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.sql.Date;

import co.com.elramireza.motta.model.*;

import javax.servlet.http.HttpSession;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Abr 8 , 2012
 * Time: 3:43:06 PM
 */
@SuppressWarnings({
        "deprecation", "unchecked"
})
public class MottaDAO extends HibernateDaoSupport{

    private SimpleDateFormat dfDate = new SimpleDateFormat("dd/MM/yyyy");

    public String test(String tmp){
        logger.info("tmp = " + tmp);
        return "Hola: " + tmp;
    }

    public List<T01ImPregunta> getPreguntas(){
        return getHibernateTemplate().find("from T01ImPregunta order by id ");
    }

    public List<Test> getTests(){
        return getHibernateTemplate().find(
                "from Test "
        );
    }

    public Test getTest(int id){
        return (Test) getHibernateTemplate().get(Test.class,id);
    }

    public int guardarT01(int[] respuestas){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        WebContext wctx = WebContextFactory.get();
        HttpSession session = wctx.getSession(true);
        Empleado empleado = (Empleado) session.getAttribute("empleo");

        T01ImRespuesta t01ImRespuesta;
        T01ImPregunta preguntaByIdPregunta;
        for(int i=1; i<=35; i++){
            t01ImRespuesta = new T01ImRespuesta();
            t01ImRespuesta.setFechaRespuesta(timestamp);
            t01ImRespuesta.setEmpleadoByIdEmpleado(empleado);
            preguntaByIdPregunta = new T01ImPregunta();
            preguntaByIdPregunta.setId(i);
            t01ImRespuesta.setT01ImPreguntaByIdPregunta(preguntaByIdPregunta);
            t01ImRespuesta.setValor(respuestas[i]);
            getHibernateTemplate().save(t01ImRespuesta);
//            logger.info("respuestas["+i+"] = " + respuestas[i]);
        }
        return 1;
    }

    public int guardarT02(int[] respuestas){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        WebContext wctx = WebContextFactory.get();
        HttpSession session = wctx.getSession(true);
        Empleado empleo = (Empleado) session.getAttribute("empleo");

        T02VhRespuesta t02VhRespuesta;
        T02VhPregunta preguntaByIdPregunta;
        for(int i=1; i<=215; i++){
            t02VhRespuesta = new T02VhRespuesta();
            t02VhRespuesta.setFechaRespuesta(timestamp);
            t02VhRespuesta.setEmpleadoByIdEmpleado(empleo);
            preguntaByIdPregunta = new T02VhPregunta();
            preguntaByIdPregunta.setId(i);
            t02VhRespuesta.setT02VhPreguntaByIdPregunta(preguntaByIdPregunta);
            t02VhRespuesta.setValor(respuestas[i]);
            getHibernateTemplate().save(t02VhRespuesta);
//            logger.info("respuestas["+i+"] = " + respuestas[i]);
        }
        return 1;
    }

    public T01ImPregunta getT01ImPregunta(int id){
        return (T01ImPregunta) getHibernateTemplate().get(T01ImPregunta.class, id);
    }

    public List<T02VhSeccion> getVhSecciones(){
        return getHibernateTemplate().find(
                "from T02VhSeccion order by id ");
    }

    public List<T02VhPregunta> getprT02VhPreguntasFromSeccion(int idSeccion){
        return getHibernateTemplate().find(
                "from T02VhPregunta where t02VhSeccionByIdSeccion.id = ? order by id ",
                idSeccion
        );
    }

    /**
     * Participantes del test 01
     * @return
     */
    /*public List<Empleado> getParticipanteT01(){
        return getHibernateTemplate().find(
                "from Participante where idParticipante in \n" +
                        "(select distinct participanteByIdParticipante.idParticipante from T01ImRespuesta) \n" +
                        " order by fechaIngresoParticipante desc , apellidosParticipante , nombresParticipante"
        );
    }
*/
    public T01ImResultado getT01ImResultado(int idParticipante){
        List<T01ImResultado> resultados = getHibernateTemplate().find(
                "from T01ImResultado where participanteByIdParticipante.idParticipante = ? ", idParticipante
        );
        if(resultados.size()>0){
            return resultados.get(0);
        } else {
            return null;
        }
    }

    public List<Empleado> getParticipantesT02Vh(){
        return getHibernateTemplate().find(
                "from Participante where idParticipante in " +
                        "(select distinct participanteByIdParticipante.idParticipante from T02VhRespuesta ) " +
                        " order by fechaIngresoParticipante , apellidosParticipante,nombresParticipante "
        );
    }

//    TODO CAmbio
    public T01ImResultado getT01CalificacionParticipante(int idEmpleado){
        //VERIFICO SI TIENE CALIFICACION
        T01ImResultado resultado = getT01ImResultado(idEmpleado);
        if(resultado != null){
            return resultado;
        } else {
            // ES NECESARIO HACER LA CALIFICACION
            resultado = new T01ImResultado();
            List<T01ImRespuesta> respuestas = getHibernateTemplate().find(
                    "from T01ImRespuesta where empleadoByIdEmpleado.idEmpleado= ?",
                    idEmpleado);
            int aVL = 0;
            int bLM = 0;
            int cVE = 0;
            int dKC = 0;
            int eMR = 0;
            int fIntra = 0;
            int gInter = 0;
            for(T01ImRespuesta respuesta: respuestas){
                switch (respuesta.getT01ImPreguntaByIdPregunta().getId()){
                    case 9:
                    case 10:
                    case 17:
                    case 22:
                    case 30:
                        aVL += respuesta.getValor();
                        break;
                    case 5:
                    case 7:
                    case 15:
                    case 20:
                    case 25:
                        bLM += respuesta.getValor();
                        break;
                    case 1:
                    case 11:
                    case 14:
                    case 23:
                    case 27:
                        cVE += respuesta.getValor();
                        break;
                    case 8:
                    case 16:
                    case 19:
                    case 21:
                    case 29:
                        dKC += respuesta.getValor();
                        break;
                    case 3:
                    case 4:
                    case 13:
                    case 24:
                    case 28:
                        eMR += respuesta.getValor();
                        break;
                    case 2:
                    case 6:
                    case 26:
                    case 31:
                    case 33:
                        fIntra += respuesta.getValor();
                        break;
                    case 12:
                    case 18:
                    case 32:
                    case 34:
                    case 35:
                        gInter += respuesta.getValor();
                        break;
                }
            }

            resultado.setEmpleadoByIdEmpleado(pnDAO.getEmpleado(idEmpleado));
            resultado.setAVL(aVL);
            resultado.setBLM(bLM);
            resultado.setCVE(cVE);
            resultado.setDKC(dKC);
            resultado.setEMR(eMR);
            resultado.setFIntrapersonal(fIntra);
            resultado.setGInterpersonal(gInter);
            resultado.setFechaResultado(new Date(System.currentTimeMillis()));

            getHibernateTemplate().save(resultado);

            return getT01CalificacionParticipante(idEmpleado);
        }
    }

    public List<T02VhCalificacion> getT02VhCalificacion(int idEmpleado){
        return getHibernateTemplate().find(
                "from T02VhCalificacion where idEmpleado = ?", idEmpleado);
    }

    public List<T02VhResultado> getT02VhResultados(int idEmpleado){
        return getHibernateTemplate().find(
                "from T02VhResultado where idEmpleado = ? ", idEmpleado);
    }

    public List<T02VhCarrera> getT02VhCarreras(int idCategoria1,
                                               int idCategoria2){
        Object o[] = {idCategoria1, idCategoria2};
        return getHibernateTemplate().find(
                "from T02VhCarrera where t02VhCategoriaByIdCategoria1 .id = ? and " +
                        "t02VhCategoriaByIdCategoria2.id = ? order by id desc ",
                o
        );
    }

    public int deleteRespuestaT02(final int idEmpleado){
        try {
            getHibernateTemplate().execute(new HibernateCallback() {
                @Override
                public Object doInHibernate(Session session) throws HibernateException, SQLException {
                    Query query =  session.createQuery(
                            "delete from T02VhRespuesta where empleadoByIdEmpleado.idEmpleado = ?"
                    );
                    query.setInteger(0, idEmpleado);
                    query.executeUpdate();
                    return 1;
                }
            });
            return 1;
        } catch (DataAccessException e) {
//            e.printStackTrace();
            logger.debug(e.getMessage());
            return 0;
        }
    }


    private PnDAO pnDAO;

    public PnDAO getPnDAO() {
        return pnDAO;
    }

    public void setPnDAO(PnDAO pnDAO) {
        this.pnDAO = pnDAO;
    }
}
