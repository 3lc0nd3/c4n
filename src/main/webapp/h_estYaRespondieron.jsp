<%@ page import="co.com.elramireza.pn.model.Empleado" %>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.pn.model.PnPremio" %>
<%@ page import="co.com.elramireza.motta.model.T02VhResultado" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    int idPremio = Integer.parseInt(request.getParameter("id"));
    PnPremio premio = pnManager.getPnPremio(idPremio);
    List<Empleado> estudiantes = pnManager.getHibernateTemplate().find(
            "from Empleado where premioByIdPremio.idPnPremio = ? and idEmpleado in " +
                    "(select distinct empleadoByIdEmpleado.idEmpleado from T02VhRespuesta)",
            idPremio
    );
%>
<h1>Lista de Estudiantes que ya respondieron</h1>
<h2>Convocatoria: <%=premio.getNombrePremio()%></h2>
<h3><%=estudiantes.size()>0?estudiantes.get(0).getEmpresaByIdEmpresa().getNombreEmpresa():""%></h3>

<table class="table table-striped table-bordered" >
    <tr>
        <th># Lista</th>
        <th>Estudiante</th>
        <th>Doc</th>
        <th>Jornada</th>
        <th>Curso</th>
        <th>Especialidad</th>
        <th>C1</th>
        <th>C2</th>
        <%--<th></th>--%>
    </tr>
    <%
        for (Empleado estudiante: estudiantes){
            List<T02VhResultado> resultados = mottaManager.getT02VhResultados(estudiante.getIdEmpleado());
    %>
    <tr>
        <td>
            <%=estudiante.getLista()%>
        </td>
        <td> <%=estudiante.getPersonaByIdPersona().getNombreCompleto()%> </td>
        <td> <%=estudiante.getPersonaByIdPersona().getDocumentoIdentidad()%> </td>
        <td> <%=estudiante.getJornada()%> </td>
        <td> <%=estudiante.getCurso()%> </td>
        <td> <%=estudiante.getEspecialidad()%> </td>
        <%--<td> <%=resultados.size()%></td>--%>
        <%--<td> <%=resultados.size()%></td>--%>
        <td><%=resultados.get(0).getCategoria()%> </td>
        <td><%=resultados.get(1).getCategoria()%> </td>
    </tr>
    <%
        }
    %>
</table>

<jsp:include page="c_footer_r.jsp"/>