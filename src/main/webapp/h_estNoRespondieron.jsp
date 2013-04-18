<%@ page import="co.com.elramireza.pn.model.Empleado" %>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.pn.model.PnPremio" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<%
    int idPremio = Integer.parseInt(request.getParameter("id"));
    PnPremio premio = pnManager.getPnPremio(idPremio);
    List<Empleado> estudiantes = pnManager.getHibernateTemplate().find(
            "from Empleado where premioByIdPremio.idPnPremio = ? and idEmpleado not in " +
                    "(select distinct empleadoByIdEmpleado.idEmpleado from T02VhRespuesta)",
            idPremio
    );
%>
<h1>Lista de Estudiantes que no han respondido</h1>
<h2>Convocatoria: <%=premio.getNombrePremio()%></h2>
<h3><%=estudiantes.size()>1?estudiantes.get(1).getEmpresaByIdEmpresa().getNombreEmpresa():""%></h3>

<table class="table table-striped table-bordered" >
    <tr>
        <th>_</th>
        <th># Lista</th>
        <th>Estudiante</th>
        <th>Doc</th>
        <th>Jornada</th>
        <th>Curso</th>
        <th>Especialidad</th>
        <%--<th></th>--%>
    </tr>
    <%
        int i = 0;
        for (Empleado estudiante: estudiantes){
    %>
    <tr>
        <td><b><%=++i%></b></td>
        <td>
            <%=estudiante.getLista()%>
        </td>
        <td> <%=estudiante.getPersonaByIdPersona().getNombreCompleto()%> </td>
        <td> <%=estudiante.getPersonaByIdPersona().getDocumentoIdentidad()%> </td>
        <td> <%=estudiante.getJornada()%> </td>
        <td> <%=estudiante.getCurso()%> </td>
        <td> <%=estudiante.getEspecialidad()%> </td>
    </tr>
    <%
        }
    %>
</table>
<jsp:include page="c_footer_r.jsp"/>