package co.com.elramireza.pn.dao;

import co.com.elramireza.pn.model.*;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.hibernate.exception.ConstraintViolationException;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;

import static java.lang.String.format;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: 2/01/2013
 * Time: 05:48:15 PM
 */
@SuppressWarnings({
		"deprecation", "unchecked"
})
public class PnDAO extends HibernateDaoSupport{

	public SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	public SimpleDateFormat dfDateTime = new SimpleDateFormat("dd/MM/yyyy KK:mm aaa");

	public String test(String s){
		Persona persona = getPersonaFromDoc(s);
		logger.info("s = " + s);
		return "Hola " + s;
	}


    /**
     * segun el nombre del servicio
     * @param servicio
     * @return
     */
    public Servicio getServicioFromName(String servicio){
        List<Servicio> list = getHibernateTemplate().find(
                "from Servicio where servicio = ?",
                servicio );
        if(list.size()>0){
            return list.get(0);
        } else {
            return null;
        }
    }

	public Servicio getServicio(int id){
		return (Servicio) getHibernateTemplate().get(Servicio.class, id);
	}

	public List<Servicio> getServiciosAjaxPublicos(){
		return getHibernateTemplate().find("from Servicio where tipo = 'a' and publico = 1");
	}

	public List<Servicio> getServiciosPublicosVisibles(){
		return getHibernateTemplate().find("from Servicio where visible = 1 and publico = 1 order by orden ");
	}

    public List<ServicioRol> getServiciosFromPerfil(int idPerfil){
        return getHibernateTemplate().find(
                "from ServicioRol where perfilByIdRol.id = ? and servicioByIdServicio.visible=1 order by servicioByIdServicio.orden",
                idPerfil);
    }

    public List<Empleado> getEmpleadosFromParticipante(int idParticipante){
        return getHibernateTemplate().find(
                "from Empleado where participanteByIdParticipante.idParticipante = ? ",
                idParticipante);
    }


    public List<Empleado> getEvaluadoresFromParticipante(int idParticipante){
        return getHibernateTemplate().find(
                "from Empleado where participanteByIdParticipante.idParticipante = ? and (perfilByIdPerfil.id = 2 or perfilByIdPerfil.id = 7) order by perfilByIdPerfil.id desc , personaByIdPersona.nombrePersona",
                idParticipante);
    }

    public List<Integer> getValoresValoracion(){
        List<Integer> valores = new ArrayList<Integer>();
        for (Integer i= 0; i<=100; i+=5){
            valores.add(i);
        }
        return valores;
    }

	public Texto getTexto(int id){
		Texto texto = (Texto) getHibernateTemplate().get(Texto.class, id);
		if(texto==null){
			texto =  new Texto();
			texto.setTexto1(format("No hay texto %d", id));
			texto.setTexto2("");
			texto.setTexto3("");
		}
		return texto;
	}

	public List<Texto> getTextosSlider(String idSlider){
		return getHibernateTemplate().find(
				"from Texto where tipo = ? order by id ",
				idSlider
		);
	}

	public List<LocEstado> getLocEstados(){
		return getHibernateTemplate().find("from LocEstado ");
	}

	public List<LocCiudad> getLocCiudadesFromEstado(int idEstado){
		return getHibernateTemplate().find("from LocCiudad where locEstadoByIdEstado.idEstado = ? ",
				idEstado);
	}

	public List<Empresa> getEmpresas(){
		return getHibernateTemplate().find("from Empresa ");
	}

	public List<Empresa> getEmpresaActivas(){
		return getHibernateTemplate().find("from Empresa where idEmpresa > 1 and estado = true");
	}

	public List<Empleado> getEmpleados(){
		return getHibernateTemplate().find("from Empleado where empresaByIdEmpresa.idEmpresa <> 1 order by empresaByIdEmpresa.nombreEmpresa , personaByIdPersona.nombrePersona , personaByIdPersona.apellido ");
	}


	public List<Empleado> getEmpleadosInterno(){
		return getHibernateTemplate().find("from Empleado where empresaByIdEmpresa.idEmpresa = 1 order by empresaByIdEmpresa.nombreEmpresa , personaByIdPersona.nombrePersona , personaByIdPersona.apellido ");
	}

	public Empleado getEmpleado(int idEmpleado){
		return (Empleado) getHibernateTemplate().get(Empleado.class, idEmpleado);
	}

	public String desvinculaEmpleado(int idEmpleado){
		try {
			Empleado empleado = getEmpleado(idEmpleado);
			getHibernateTemplate().delete(empleado);
			return "";
		} catch (ConstraintViolationException e) {
            logger.debug(e.getMessage());
			return (e.getMessage());
		} catch (DataAccessException e) {
			logger.debug(e.getMessage());
			return (e.getMessage());

		}
	}

	public List<Perfil> getPerfiles(){
		return getHibernateTemplate().find("from Perfil order by perfil ");
	}

	public Empleado vinculaEmpleado(int idPersona,
									int idEmpresa,
									int idCargo,
									int idPerfil){
		logger.info("idEmpresa = " + idEmpresa);
		try {
			Empleado empleado = new Empleado();
			empleado.setPerfilByIdPerfil(getPerfil(idPerfil));
			empleado.setPersonaByIdPersona(getPersona(idPersona));
			empleado.setEmpresaByIdEmpresa(getEmpresa(idEmpresa));
			empleado.setFechaIngreso(new Timestamp(System.currentTimeMillis()));


            Integer idEmpleado = (Integer) getHibernateTemplate().save(empleado);
//			System.out.println("idEmpleado 1 = " + idEmpleado);

			if(idEmpleado != null){
				try {
					notificaEmpleadoVinculo(empleado);
				} catch (Exception e) {
					e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
				}
			}

			empleado.setIdEmpleado(idEmpleado);
//			System.out.println("idEmpleado = " + idEmpleado);
			return empleado;
		} catch (ConstraintViolationException e) {
			logger.info(e.getMessage());
			return null;
		} catch (DataAccessException e) {
			logger.info(e.getMessage());
			return null;
		} catch (Exception e){
			logger.info(e.getMessage());
			return null;
		}
	}

	public void notificaEmpleadoVinculo(Empleado empleado){
		Persona personaByIdPersona = empleado.getPersonaByIdPersona();
		logger.info("personaByIdPersona = " + personaByIdPersona);
		String asunto = "Vinculado a c4n - " + empleado.getPremioByIdPremio().getNombrePremio()+
                ", " + empleado.getEmpresaByIdEmpresa().getNombreEmpresa();
		logger.info("asunto = " + asunto);
		String mensaje =
				"Cordial saludo" +
						"<br>" +
						"<br>" +
						"Le informamos que usted ha sido vinculado al siguiente proceso: " +
				        "<br>" +
						"Prueba: " + empleado.getPremioByIdPremio().getNombrePremio()+
						"<br>" +
						"Empresa: " + empleado.getEmpresaByIdEmpresa().getNombreEmpresa() +
						"<br>" +
						"Perfil en el Sistema: " + empleado.getPerfilByIdPerfil().getPerfil() +
						"<br>" +
						"Login: " + personaByIdPersona.getEmailPersonal() +
						"<br>" +
						""
				;
		logger.info("mensaje = " + mensaje);
		if (personaByIdPersona.getPassword() == null || personaByIdPersona.getPassword().equals("")) { //  SI NO TIENE PASSWORD
			logger.info("no tiene password");
			String password = getRandomPassword();
			logger.info("password = " + password);
			personaByIdPersona.setPassword(getMD5(password));
			getHibernateTemplate().update(personaByIdPersona);
			mensaje += "Password: " + password;
		}
		logger.info("mensaje = " + mensaje);
		String[] emails = {personaByIdPersona.getEmailPersonal()};
		enviaEmail(emails, asunto, mensaje, null, SUSCRIBE);
	}



	public List<EmpresaCategoria> getEmpresaCategorias(){
		return getHibernateTemplate().find("from EmpresaCategoria ");
	}

	public List<EmpresaCategoriaTamano> getEmpresaCategoriaTamanos(){
		return getHibernateTemplate().find("from EmpresaCategoriaTamano ");
	}

	public int saveEmpresa(Empresa empresa){
		return (Integer) getHibernateTemplate().save(empresa);
	}

	public int saveEmpresaR(Empresa empresa){
		Empresa empresaOld = getEmpresaFromNit(empresa.getNit());

		empresa.setLocCiudadByIdCiudad(getCiudad(empresa.getLocCiudadEmpresa()));
		empresa.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
		empresa.setTipoEmpresaByIdTipoEmpresa(getTipoEmpresa(2));

		empresa.setEmpresaCategoriaByIdCategoriaEmpresa(
				getEmpresaCategoria(empresa.getIdEmpresaCategoria()));
		empresa.setEmpresaCategoriaTamanoByIdCategoriaTamanoEmpresa(
				getEmpresaCategoriaTamano(empresa.getIdEmpresaCategoriaTamano())
		);
		if(empresaOld != null){ // EXISTE
			empresa.setIdEmpresa(empresaOld.getIdEmpresa());
			empresa.setEstado(empresaOld.getEstado());
			empresa.setFechaCreacion(empresaOld.getFechaCreacion());
			getHibernateTemplate().update(empresa);
		} else {
			empresa.setEstado(false);
			getHibernateTemplate().save(empresa);

		}
		return 1;
	}

	public int saveEmpleado(Empleado empleado){
		return (Integer) getHibernateTemplate().save(empleado);
	}

	public Empresa getEmpresa(int id){
		return (Empresa) getHibernateTemplate().get(Empresa.class, id);
	}

	public Empresa getEmpresaFromNit(String nit){
		List<Empresa> empresas =
				getHibernateTemplate().find("from Empresa where nit = ?",
						nit);
		if(empresas.size()>0){
			return empresas.get(0);
		} else {
			return null;
		}
	}

    public Persona loginDoc(String doc){
        Persona persona = getPersonaFromDoc(doc);
        if(persona==null){
            return null;
        } else {
            WebContext wctx = WebContextFactory.get();
            HttpSession session = wctx.getSession(true);
            HttpServletRequest request = wctx.getHttpServletRequest();
            String mensajeLogin = "Bienvenido: " + persona.getNombreCompleto();

            request.setAttribute("mensajeLogin", mensajeLogin);
            session.setAttribute("persona", persona);

            return persona;
        }
    }

	public Persona getPersona(int id){
		return (Persona) getHibernateTemplate().get(Persona.class, id);
	}

	public Persona getPersonaFromDoc(String doc){
		List<Persona> personas =
				getHibernateTemplate().find("from Persona where documentoIdentidad = ?",
						doc);
		if(personas.size()>0){
			return personas.get(0);
		} else {
			return null;
		}
	}

	public EmpresaCategoria getEmpresaCategoria(int id){
		return (EmpresaCategoria) getHibernateTemplate().get(EmpresaCategoria.class, id);
	}

	public EmpresaCategoriaTamano getEmpresaCategoriaTamano(int idEmpresaCategoriaTamano){
		return (EmpresaCategoriaTamano) getHibernateTemplate().get(EmpresaCategoriaTamano.class, idEmpresaCategoriaTamano);
	}

	public LocCiudad getCiudad(int id){
		return (LocCiudad) getHibernateTemplate().get(LocCiudad.class, id);
	}

	public TipoEmpresa getTipoEmpresa(int id){
		return (TipoEmpresa) getHibernateTemplate().get(TipoEmpresa.class, id);
	}

	public int savePersona(Persona persona){
		Persona personaOld = getPersonaFromDoc(persona.getDocumentoIdentidad());

		persona.setLocCiudadByIdCiudad(getCiudad(persona.getLocCiudadPersona()));
		persona.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
		if(personaOld != null){ // EXISTE
			persona.setIdPersona(personaOld.getIdPersona());
			persona.setEstado(personaOld.getEstado());
			persona.setFechaCreacion(personaOld.getFechaCreacion());
			getHibernateTemplate().update(persona);
		} else {
			persona.setEstado(false);
			/*int idPersona = (Integer) */
			getHibernateTemplate().saveOrUpdate(persona);
//            persona.setIdPersona(idPersona);
		}
		return 1;
	}

    public boolean isAdministrador(int idPersona){
        List<Empleado> empleados = getHibernateTemplate().find(
                "from Empleado where personaByIdPersona.idPersona = ? and perfilByIdPerfil.id = 1",
                idPersona
        );
        return empleados.size()>0;
    }

    public Empleado selEmpleo(int id){
        try {
            Empleado empleado = getEmpleado(id);
            WebContext wctx = WebContextFactory.get();
            HttpSession session = wctx.getSession(true);
            Empleado empleadoOld = (Empleado) session.getAttribute("empleo");
            if(empleadoOld != null){
                logger.info("empleadoOld.getPerfilByIdPerfil() = " + empleadoOld.getPerfilByIdPerfil());
            } else {
                logger.info("No habia empleo en session");
            }
            session.setAttribute("empleo", empleado);
            return empleado;
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return null;
        }
    }

    public void notificaEvaluadorAspiranteRegitro(Persona aspirante){
        String asunto = "Registro de Aspirante";
        String mensaje =
                "Cordial saludo" +
                        "<br>" +
                        "<br>" +
                        "Le informamos que hemos recibido su solicitud como Aspirante a Evaluador del PNEIG." +
                        "<br>" +
                        "Estamos evaluando su solicitud, en breve le comunicaremos que pasos seguir." +
                        "<br>" +
                        "";
        String[] emails = {aspirante.getEmailPersonal()};
        enviaEmail(emails, asunto, mensaje, null, SUSCRIBE);
    }

    public int registroAspirante(Persona aspirante){
        logger.info("aspirante.getDocumentoIdentidad() = " + aspirante.getDocumentoIdentidad());
        logger.info("aspirante.getNombre = " + aspirante.getNombrePersona());
//        logger.info("aspirante.getApellido() = " + aspirante.getApellido());
		logger.info("aspirante.getSexo() = " + aspirante.getSexo());
		logger.info("aspirante.getTmpFechaNacimiento() = " + aspirante.getTmpFechaNacimiento());
		logger.info("aspirante.getIdCiudad() = " + aspirante.getIdCiudad());

        try {
            WebContext wctx = WebContextFactory.get();
            HttpSession session = wctx.getSession(true);
            HttpServletRequest request = wctx.getHttpServletRequest();
            Persona aspiranteOld = getPersonaFromDoc(aspirante.getDocumentoIdentidad());
            if(aspiranteOld != null){
                aspirante.setIdPersona(aspiranteOld.getIdPersona());
                aspirante.setLocCiudadByIdCiudad(getCiudad(aspirante.getIdCiudad()));
                aspirante.setYa(1);

                getHibernateTemplate().update(aspirante);

                String mensajeLogin = "Bienvenido: " + aspirante.getNombrePersona();
                request.setAttribute("mensajeLogin", mensajeLogin);
                session.setAttribute("persona", aspirante);

                return 1;
            }
            else { // NO EXISTE
                return 0;
            }
//            notificaEvaluadorAspiranteRegitro(aspirante);

        } catch (DataAccessException e) {

            logger.debug(e.getMessage());
            return 0;
        }
    }

    public PnEtapaParticipante getPnEtapaParticipante(int id){
        return (PnEtapaParticipante) getHibernateTemplate().get(PnEtapaParticipante.class, id);
    }

	public Perfil getPerfil(int id){
		return (Perfil) getHibernateTemplate().get(Perfil.class, id);
	}

	public List<Persona> getPersonas(){
		return getHibernateTemplate().find(
				"from Persona order by nombrePersona , apellido "
		);
	}

	public List<PnPremio> getPnPremios(){
		return getHibernateTemplate().find("from PnPremio where idPnPremio > 1");
	}

	/**
	 * Solo los Activos para Inscripcion
	 * @return
	 */
	public List<PnPremio> getPnPremiosActivos(){
		return getHibernateTemplate().find("from PnPremio where estadoInscripcion = true");
	}

	public PnPremio getPnPremio(int id){
		PnPremio premio = (PnPremio) getHibernateTemplate().get(PnPremio.class, id);
		premio.setTmpFechaDesde(df.format(premio.getFechaDesde()));
		premio.setTmpFechaHasta(df.format(premio.getFechaHasta()));
		return premio;
	}



	public Boolean activeDesactiveEmpresa(final int idEmpresa){
		try {
			Empresa empresa = getEmpresa(idEmpresa);
			empresa.setEstado(!empresa.getEstado());
			getHibernateTemplate().update(empresa);
			return empresa.getEstado();
		} catch (DataAccessException e) {
			logger.debug(e.getMessage());
			return null;
		}
	}

	public int hayPnPremiosActivos(){
		List<PnPremio> premios = getHibernateTemplate().find(
				"from PnPremio where estadoInscripcion = true"
		);
		if (premios.size()>0){
			return premios.get(0).getIdPnPremio();
		} else {
			return 0;
		}
	}

	/**
	 * Retorna el Premio PN activo. Solo puede haber uno
	 * @return p
	 */
	public PnPremio getPnPremioActivo(){
		List<PnPremio> premios = getHibernateTemplate().find(
				"from PnPremio where estadoInscripcion = true"
		);
		if (premios.size()>0){
			return premios.get(0);
		} else {
			return null;
		}
	}

	public int activeDesactivePremioN(int idPremio){
		try {
			int hay = hayPnPremiosActivos();
			if(hay >0 && hay !=idPremio){ // No hay mas Premios Activos y no es el mismo
				return 2;
			} else {
				PnPremio premio = getPnPremio(idPremio);
				premio.setEstadoInscripcion(!premio.getEstadoInscripcion());
				getHibernateTemplate().update(premio);
				if(premio.getEstadoInscripcion()){
					return 1;
				} else {
					return 0;
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			return 3;
		}
	}

	public Boolean activeDesactivePersona(int idPersona){
		try {
			Persona persona = getPersona(idPersona);
			persona.setEstado(!persona.getEstado());
			getHibernateTemplate().update(persona);
			return persona.getEstado();
		} catch (DataAccessException e) {
			logger.debug(e.getMessage());
			return null;
		}
	}

	public int savePnPremio(PnPremio premio ){
		logger.debug("Entro");
		logger.debug("premio.getIdPnPremio() = " + premio.getIdPnPremio());
		try {
			premio.setFechaDesde(new Timestamp(df.parse(premio.getTmpFechaDesde()).getTime()));
			premio.setFechaHasta(new Timestamp(df.parse(premio.getTmpFechaHasta()).getTime()));
			premio.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
			getHibernateTemplate().saveOrUpdate(premio);
			return 1;
		} catch (DataAccessException e) {
			logger.debug(e.getMessage());
			return 0;
		} catch (ParseException e) {
			logger.debug(e.getMessage());
			return 0;
		}
	}

	public List<Empleado> getEmpleosFromPersona(int idPersona){
		List<Empleado> empleados = getHibernateTemplate().find(
				"from Empleado where personaByIdPersona.idPersona = ? order by perfilByIdPerfil.perfil, premioByIdPremio.nombrePremio desc ",
                idPersona
		);
		logger.info("empleados nro = " + empleados.size());
		return empleados;
	}

	public Persona getPersonaFromLoginPassword(String login,
											   String password){
		Object o[] = {
                login,
                getMD5(password)
        };
        List<Persona> personas =  getHibernateTemplate().find(
                "from Persona where emailPersonal = ? and password = ?",
                o);
        if(personas.size() == 0){
            return null;
        } else {
            return personas.get(0);
        }

	}

	public String getMD5(String yourString){
//        yourString = "123456789";
		byte[] bytesOfMessage = yourString.getBytes();

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] thedigest = md.digest(bytesOfMessage);

			StringBuffer hexString = new StringBuffer();
			for (byte aThedigest : thedigest) {
				String hex = Integer.toHexString(0xff & aThedigest);
				if (hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}
			logger.info("Digest(in hex format):: " + hexString.toString());
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}
	}


	/*****************************************************************************************/
	/*****************************************************************************************/
	/*********************    CORREO ELECTRONICO EMAIL  **************************************/
	/*****************************************************************************************/
	/*****************************************************************************************/

	public static final int SUSCRIBE = 1;
	public static final int INFO = 2;

	private String SMTP_HOST_NAME = "smtp.gmail.com";
	private String SMTP_PORT = "465";
	private String emailMsgTxt = "Test Message Contents";
	private String emailSubjectTxt = "A test from gmail";
	//    private String emailFromAddress = "fucdigital_1@clcgas.com.co";
	private String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private String[] sendTo = {"edward_ramirez_pc@yahoo.com.ar", "elramireza@gmail.com"};



	String email[][] = {
			{"", ""},
			{"premiogestion@gmail.com", "corca*123", "Mensajes PNEIG"},
			{  "", ""},
			{"5", "6"}
	};



	public void testEmail(int desde){
		enviaEmail(sendTo, emailSubjectTxt,
				emailMsgTxt, new File[0], desde);
	}


	/**
	 * envia email
	 * @param recipients para quien
	 * @param subject s
	 * @param message  msg
	 * @param attachments array de java.io.File
	 * @param emailDesde 1 SUSCRIBE  ... 2 INFO
	 * @return  1 si bien  0 si error
	 */
	public int enviaEmail(String recipients[],
						  String subject,
						  String message,
						  File[] attachments,
						  int emailDesde){

		int ret=1;

		String desde = 			email[emailDesde][0];
		String desdeNombre = 	email[emailDesde][2];
		logger.debug("desde = " + desde);
		logger.info("desdeNombre = " + desdeNombre);
		String passwd = email[emailDesde][1];
//        logger.debug("passwd = " + passwd);

		boolean debug = false;

//        Properties props = getPropertiesEmail();

		try {
			javax.mail.Session session = null;

			switch (emailDesde){
				case SUSCRIBE:
					session = getSessionSuscribe();
					break;
				case INFO:
					session = getSessionInfo();
			}
			if (session != null) {
				session.setDebug(debug);
			}

//            Message msg = new MimeMessage(session);

//            logger.debug("session.getPasswordAuthentication().getUserName() = " + session.getPasswordAuthentication().getUserName());

			MimeMessage msg = new MimeMessage(session);

// crear las partes del mensaje
			MimeBodyPart messageBodyPart = new MimeBodyPart();

			//Llenar la parte del mensaje
			messageBodyPart.setText(message, "UTF-8", "html");

			InternetAddress addressFrom = null;
			try {
				addressFrom = new InternetAddress(desde, desdeNombre);
			} catch (UnsupportedEncodingException e) {
				addressFrom = new InternetAddress(desde);
			}
			msg.setFrom(addressFrom);

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);


// Archivos

//            String urlArchivo = archivosDAO.getUrlFolder() + "/e/master.pdf";


/// adicion de archivos

			if (attachments != null) {
				for (File attachment : attachments) {
					logger.debug("attachment.getName() = " + attachment.getName());
					logger.debug("attachment.length() = " + attachment.length());
					messageBodyPart = new MimeBodyPart();
					FileDataSource fileDataSource = new FileDataSource(attachment);
					messageBodyPart.setDataHandler(new DataHandler(fileDataSource));
					messageBodyPart.setFileName(attachment.getName());
					multipart.addBodyPart(messageBodyPart);
				}
			}

			msg.setContent(multipart);


			InternetAddress[] addressTo = new InternetAddress[recipients.length];
			for (int i = 0; i < recipients.length; i++) {
				addressTo[i] = new InternetAddress(recipients[i]);
//                logger.debug("recipients[i] = " + recipients[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addressTo);

// Setting the Subject and Content Type
			msg.setSubject(subject + " " + dfDateTime.format(new Date()));
//            msg.setContent(date.toString(), "text/plain");
//            msg.setText(date.toString());

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
			ret = 0;
		} catch (Exception e){
			e.printStackTrace();
		}

		return ret;
	}


	static javax.mail.Session sessionSuscribe = null;
	static javax.mail.Session sessionInfo = null;

	public javax.mail.Session getSessionSuscribe(){
//        logger.debug("entro a: getSessionSuscribe");
		try {
			if (sessionSuscribe == null) {
				logger.debug("sessionSuscribe SI null");
				sessionSuscribe =      javax.mail.Session.getInstance(getPropertiesEmail(),
						new Authenticator() {

							protected PasswordAuthentication getPasswordAuthentication() {
								//                            return new PasswordAuthentication(emailFromAddress, "clcgas2010");

								return new PasswordAuthentication(email[SUSCRIBE][0], email[SUSCRIBE][1]);
							}
						});
			} else {
				logger.debug("sessionSuscribe NO null");
			}
		} catch (Exception e) {
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}
		return sessionSuscribe;
	}

	public javax.mail.Session getSessionInfo(){
//        logger.debug("entro a: getSessionInfo");
		if (sessionInfo == null) {
			logger.debug("sessionInfo SI null");
			sessionInfo =    javax.mail.Session.getInstance(getPropertiesEmail(),
					new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(email[INFO][0], email[INFO][1]);
						}
					});
		} else {
			logger.debug("sessionInfo NO null");
		}
		return sessionInfo;
	}


	public Properties getPropertiesEmail(){
		Properties props;
		props = new Properties();
		props.put("mail.smtp.host", SMTP_HOST_NAME);
		props.put("mail.smtp.socketFactory.port", SMTP_PORT);
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.port", SMTP_PORT);
		props.put("mail.smtp.socketFactory.fallback", "false");
		return props;
	}



	/*****************************************************************************************/
	/*****************************************************************************************/
	/*********************    PASSWORD GENERATRO EMAIL  **************************************/
	/*****************************************************************************************/
	/*****************************************************************************************/

	public static final char[] HEX_CHARS = { 'a','b','c','d','e','f','g','h','0','1','2','3','4','5','6','7','8','9' };
	public static final char[] SECURE_CHARS = { 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u',
			'v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
			'Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','=',
			'!','$','#','+','%','&','/','(',')','[',']' };
	public static final int largePass = 9;

	public String getRandomPassword(){
		String s = "";

		Random generator = new Random();
		int r;

		int i=0;
		while (i<largePass) {
			r = Math.abs(generator.nextInt());
			logger.debug("r = " + r);
			while (r > SECURE_CHARS.length-1) {
				r = r/2;
//                logger.info("r int = " + r);
			}
			s += SECURE_CHARS[r];
//            logger.info("s.le = " + s.length());
//            logger.info("i = " + i+"\tr = " + r + "\t s:"+s);
			i++;
		}

		return s;
	}


	public String getIncludeResultadoInd(int idEmpleado,
										 String page,
										 int nombre){
		logger.debug("idEmpleado = " + idEmpleado);
		logger.debug("page = " + page);
		logger.debug("nombre = " + nombre);
		WebContext wctx = WebContextFactory.get();
		String url = format("/r_%s.jsp", page);
		logger.debug("url = " + url);

		Texto texto = getTexto(nombre);

		wctx.getHttpServletRequest().setAttribute("nombre", texto.getTexto1());
		wctx.getHttpServletRequest().setAttribute("id", idEmpleado);
		String respuesta = "";
		try {
			respuesta = wctx.forwardToString(url);
		} catch (ServletException e) {
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		} catch (IOException e) {
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}
		return respuesta;
	}
}