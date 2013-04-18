<%@ page import="co.com.elramireza.pn.model.Empleado" %>
<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.pn.model.PnPremio" %>
<%@ page import="co.com.elramireza.motta.model.T02VhResultado" %>
<%@ page import="co.com.elramireza.pn.model.T02VhResultado2" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<%
    SimpleDateFormat dfLarge = new SimpleDateFormat("dd MMMM yyyy hh:mm a", new Locale("es"));
    int idPremio = Integer.parseInt(request.getParameter("id"));
    PnPremio premio = pnManager.getPnPremio(idPremio);
    List<T02VhResultado2> resultados = pnManager.getHibernateTemplate().find(
            "from T02VhResultado2 where empleadoByIdEmpleado.premioByIdPremio.id = ?",
            idPremio
    );
%>
<h1>Lista de Estudiantes que ya respondieron</h1>
<h2>Convocatoria: <%=premio.getNombrePremio()%></h2>
<h3><%=resultados.size()>1?resultados.get(1).getEmpleadoByIdEmpleado().getEmpresaByIdEmpresa().getNombreEmpresa():""%></h3>

<table class="table table-striped table-bordered" >
    <tr>
        <th>_</th>
        <th># Lista</th>
        <th>Estudiante</th>
        <th>Doc</th>
        <th>Jornada</th>
        <th>Curso</th>
        <th>Especialidad</th>
        <th> R </th>
        <th> I </th>
        <th> A </th>
        <th> S </th>
        <th> E </th>
        <th> C </th>
        <th>Fecha</th>
        <%--<th></th>--%>
    </tr>
    <%
        int i = 0;
        for (T02VhResultado2 resultado: resultados){
    %>
    <tr>
        <td><b><%=++i%></b></td>
        <td>
            <%=resultado.getEmpleadoByIdEmpleado().getLista()%>
        </td>
        <td> <%=resultado.getEmpleadoByIdEmpleado().getPersonaByIdPersona().getNombreCompleto()%> </td>
        <td> <%=resultado.getEmpleadoByIdEmpleado().getPersonaByIdPersona().getDocumentoIdentidad()%> </td>
        <td> <%=resultado.getEmpleadoByIdEmpleado().getJornada()%> </td>
        <td> <%=resultado.getEmpleadoByIdEmpleado().getCurso()%> </td>
        <td> <%=resultado.getEmpleadoByIdEmpleado().getEspecialidad()%> </td>
        <td> <%=resultado.getR()%></td>
        <td> <%=resultado.getI()%></td>
        <td> <%=resultado.getA()%></td>
        <td> <%=resultado.getS()%></td>
        <td> <%=resultado.getE()%></td>
        <td> <%=resultado.getC()%></td>
        <td> <%=dfLarge.format(resultado.getFechaRespuesta())%></td>
        <%--<td> <%=resultados.size()%></td>--%>
    </tr>
    <%
        }
    %>
</table>

<jsp:include page="c_footer_r.jsp"/>