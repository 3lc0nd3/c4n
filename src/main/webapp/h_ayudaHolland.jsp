<%@ page import="co.com.elramireza.pn.model.Texto" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<%
    Texto texto19 = pnManager.getTexto(19);

%>
<%=texto19.getTexto3()%>

<jsp:include page="c_footer_r.jsp"/>
