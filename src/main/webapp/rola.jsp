<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.pn.model.*" %>
<%@ page import="java.sql.Timestamp" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />

<%
    Empresa empresa = pnManager.getEmpresa(2);
    System.out.println("empresa = " + empresa);
    List<Empresa> empresas = pnManager.getHibernateTemplate().find("from Empresa ");
    for (int i = 0; i < empresas.size(); i++) {
        Empresa empresa1 = empresas.get(i);
        System.out.println("empresa1 = " + empresa1);
    }
    System.out.println("empresa = " + empresa);
    Perfil perfil = pnManager.getPerfil(2);
    System.out.println("perfil = " + perfil);
    PnPremio premio = pnManager.getPnPremio(1);
    LocCiudad locCiudad = pnManager.getCiudad(150);

    List<ImportPersona> importPersonas = pnManager.getHibernateTemplate().find("from ImportPersona where estado = 0");

    Persona persona;
    Empleado empleado;

    for (int i = 0; i < importPersonas.size(); i++) {
        ImportPersona importPersona = importPersonas.get(i);
        persona = new Persona();

        persona.setNombrePersona(importPersona.getNombres());
        persona.setDocumentoIdentidad(importPersona.getDoc());
        persona.setLocCiudadByIdCiudad(locCiudad);

        int idPersona = (Integer) pnManager.getHibernateTemplate().save(persona);
        System.out.println("idPersona = " + idPersona);
        persona.setIdPersona(idPersona);

        empleado = new Empleado();

        empleado.setEmpresaByIdEmpresa(empresa);
        empleado.setPremioByIdPremio(premio);
        empleado.setPersonaByIdPersona(persona);
        empleado.setPerfilByIdPerfil(perfil);
        empleado.setJornada(importPersona.getJornada());
        empleado.setEspecialidad(importPersona.getEspecialidad());
        empleado.setCurso(importPersona.getCurso());
        empleado.setLista(importPersona.getLista());
        empleado.setFechaIngreso(new Timestamp(System.currentTimeMillis()));

        pnManager.getHibernateTemplate().save(empleado);

        importPersona.setEstado(1);

        pnManager.getHibernateTemplate().update(importPersona);

    }


%>