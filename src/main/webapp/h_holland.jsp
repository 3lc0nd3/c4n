<%@ page import="java.util.List" %>
<%@ page import="co.com.elramireza.pn.model.Empleado" %>
<%@ page import="co.com.elramireza.pn.model.Persona" %>
<%@ page import="co.com.elramireza.motta.model.*" %>
<%@ page import="co.com.elramireza.pn.model.Texto" %>
<jsp:useBean id="mottaManager" class="co.com.elramireza.motta.dao.MottaDAO" scope="application"/>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<h1>
    <%=mottaManager.getTest(2).getNombre()%>
</h1>
<%
    Persona persona = (Persona) session.getAttribute("persona");
    Empleado empleo = (Empleado) session.getAttribute("empleo");

    List<T02VhResultado> resultados =       mottaManager.getT02VhResultados(empleo.getIdEmpleado());
    List<T02VhCalificacion> calificaciones = mottaManager.getT02VhCalificacion(empleo.getIdEmpleado());

    if (resultados.size()>0){
%>
<div class="row-fluid">
    <h3 style="text-align:center;">RESULTADO</h3>
</div>
<div class="row-fluid">
    <%--<div class="span6">
        <%
            int idSeccionOld=0;
            int idCatOld=0;
            for(T02VhCalificacion calificacion: calificaciones){
                if(idSeccionOld!=calificacion.getIdSeccion()){
                    idSeccionOld = calificacion.getIdSeccion();
        %>
        <%
            if(idSeccionOld!= 1){
        %>
        </tr>
        </table>
        <%
            }
        %>
        <h3 style="text-align:center;"><%=calificacion.getSeccion()%></h3>
        <table class="table table-bordered">
            <tr>
                <%
                    }
                %>
                <td style="width:16%; text-align:center;">
                    <span style="font-weight: bold;"><%=calificacion.getCategoria()%></span>
                    &lt;%&ndash;</td>&ndash;%&gt;
                    &lt;%&ndash;<td>&ndash;%&gt;
                    <br>
                    <%=calificacion.getResultado()%></td>
                <%
                    }
                %>

            </tr>
        </table>
    </div>--%>
    <div class="span6">
        <%
        %>

        <h4 style="text-align:center;">Clave</h4>
        <table class="table table-bordered" align="center" style="width:50%">
            <tr>
                <td style="width:50%; text-align:center;">
                    <b><%=resultados.get(0).getCategoria()%></b>
                </td>
                <td style="text-align:center;">
                    <b><%=resultados.get(1).getCategoria()%></b>
                </td>
            </tr>
        </table>
        <table class="table table-striped">
            <tr>
                <th>Carrera</th>
                <th>Ocupaci&oacute;n</th>
                <th>Nivel Educativo</th>
            </tr>
            <%
                List<T02VhCarrera> carreras = mottaManager.getT02VhCarreras(
                        resultados.get(0).getIdCategoria(),
                        resultados.get(1).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
            <tr>
                <td>
                    <span style="color: #003bb3; font-weight: bold;"><%=carrera.getId()>444?"ECCI":""%></span>
                    <%=carrera.getCarrera()%>
                </td>
                <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <table class="table table-bordered" align="center" style="width:50%">
            <tr>
                <td style="width:50%; text-align:center;">
                    <b><%=resultados.get(1).getCategoria()%></b>
                </td>
                <td style="text-align:center;">
                    <b><%=resultados.get(0).getCategoria()%></b>
                </td>
            </tr>
        </table>
        <table class="table table-striped">
            <tr>
                <th>Carrera</th>
                <th>Ocupaci&oacute;n</th>
                <th>Nivel Educativo</th>
            </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(1).getIdCategoria(),
                        resultados.get(0).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
            <tr>
                <td>
                    <span style="color: #003bb3; font-weight: bold;"><%=carrera.getId()>444?"ECCI":""%></span>
                    <%=carrera.getCarrera()%>
                </td>
                <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            /*COMPRUEBA SI EL RESULTADO 2 ES IGUAL A LA 3 PARA PRESENTAR UNA NUEVA CLAVE*/
            if(resultados.get(1).getResultado()==resultados.get(2).getResultado()){
        %>
        <table class="table table-bordered" align="center" style="width:50%;">
            <tr>
                <td style="width:50%; text-align:center;">
                    <b><%=resultados.get(0).getCategoria()%></b>
                </td>
                <td style="text-align:center;">
                    <b><%=resultados.get(2).getCategoria()%></b>
                </td>
            </tr>
        </table>
        <table class="table table-striped">
            <tr>
                <th>Carrera</th>
                <th>Ocupaci&oacute;n</th>
                <th>Nivel Educativo</th>
            </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(0).getIdCategoria(),
                        resultados.get(2).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
            <tr>
                <td><%=carrera.getCarrera()%></td>
                <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <table class="table table-bordered" align="center" style="width:50%;">
            <tr>
                <td style="width:50%; text-align:center;">
                    <b><%=resultados.get(2).getCategoria()%></b>
                </td>
                <td style="text-align:center;">
                    <b><%=resultados.get(0).getCategoria()%></b>
                </td>
            </tr>
        </table>
        <table class="table table-striped">
            <tr>
                <th>Carrera</th>
                <th>Ocupaci&oacute;n</th>
                <th>Nivel Educativo</th>
            </tr>
            <%
                carreras = mottaManager.getT02VhCarreras(
                        resultados.get(2).getIdCategoria(),
                        resultados.get(0).getIdCategoria()
                );
                for (T02VhCarrera carrera : carreras) {
            %>
            <tr>
                <td><%=carrera.getCarrera()%></td>
                <td><%=carrera.getT02VhOcupacionByIdOcupacion().getOcupacion()%></td>
                <td><%=carrera.getT02VhNivelEducativoByIdNivelEducativo().getNivel()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
    </div><%--  FIN SPAN 6  --%>
    <%
        Texto texto20 = pnManager.getTexto(20);
        if(texto20.getTexto2().equals("si")){
    %>
    <div class="span6">
        <h4 style="text-align:center;">Valores</h4>
        <table class="table table-striped">
            <tr>
                <th>Categoria</th>
                <th>Resultado</th>
            </tr>
            <%
                for (T02VhResultado resultado: resultados){
            %>
            <tr>
                <td> <%=resultado.getCategoria()%> </td>
                <td> <%=resultado.getResultado()%> </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <%
        }
    %>

</div>
<%
    } else {

%>

<div class="container">
    <br>

    <form class="validateForm" id="imForm" method="post">

        <h2>
            Cuestionario
        </h2>
        <%
            for(T02VhSeccion seccion: mottaManager.getVhSecciones()){
                List<T02VhPregunta> preguntas = mottaManager.getprT02VhPreguntasFromSeccion(seccion.getId());
        %>
        <h3><%=seccion.getSeccion()%></h3>
        <p><%=seccion.getTexto()%></p>
        <%
            if(seccion.getId()<4){
        %>
        <table class="table table-striped" border="0" style="width:70%;">
            <tr>
                <th>Id</th>
                <th>Pregunta</th>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
            </tr>
            <%
                for (T02VhPregunta pregunta: preguntas){
            %>
            <tr>
                <td>
                    <%=pregunta.getId()%>
                </td>
                <td>
                    <%=pregunta.getPregunta()%>
                    <label for="r02p<%=pregunta.getId()%>"  style="width:300px;" class="error">Seleccione Respuesta <%=pregunta.getId()%></label>
                </td>
                <td>
                    <label for="r02pSi<%=pregunta.getId()%>" style="width:50px;">
                        <input type="radio" value="1" id="r02pSi<%=pregunta.getId()%>"  name="r02p<%=pregunta.getId()%>" class="required" <%--validate="required:true"--%> >
                        Si
                    </label>
                </td>
                <td >
                    <label for="r02pNo<%=pregunta.getId()%>" style="width:50px;">
                        <input type="radio" value="0" id="r02pNo<%=pregunta.getId()%>" name="r02p<%=pregunta.getId()%>">
                        No
                    </label>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        } else {
        %>
        <table class="table table-striped" style="width:60%;">
            <tr>
                <th>
                    Id
                </th>
                <th>Pregunta</th>
                <th>&nbsp;</th>
            </tr>
            <%
                for (T02VhPregunta pregunta: preguntas){
            %>
            <tr>
                <td>
                    <%=pregunta.getId()%>
                </td>
                <td>
                    <%=pregunta.getPregunta()%>
                    <label for="r02p<%=pregunta.getId()%>"  style="width:300px;" class="error">Seleccione Respuesta <%=pregunta.getId()%></label>
                </td>
                <td>
                    <select id="r02p<%=pregunta.getId()%>" name="r02p<%=pregunta.getId()%>" style="width:60px">
                        <option value="" disabled="disabled">...</option>
                        <option value="1"> 1</option>
                        <option value="2"> 2</option>
                        <option value="3"> 3</option>
                        <option value="4"> 4</option>
                        <option value="5"> 5</option>
                        <option value="6"> 6</option>
                        <option value="7"> 7</option>
                    </select>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
        <br>
        <%
            }
        %>
        <input id="bholl" class="submit" type="submit" value="Enviar"/>
        <%--<input type="button" onclick="enviar();" class="btn" value="Enviar"/>--%>

    </form>
</div>

<%
    }
%>

<jsp:include page="c_footer_r.jsp"/>
<script type="text/javascript">
//    jQuery.metadata.setType("attr", "validate");
</script>

<script type="text/javascript">

    function enviar(){
        var msg = "";

        var lista = [];
        lista[0]=-1;
        for(var ci=1; ci<=203; ci++){
            lista[ci] = jQuery("input[name='r02p"+ci+"']:checked").val();
        }
//        alert("lista.length = " + lista.length);
        for(var ci2=204; ci2<=215; ci2++){
            lista[ci2] = dwr.util.getValue("r02p"+ci2);

        }

//        alert("lista[202] = " + lista[202]);
//        alert("lista[203] = " + lista[203]);
//        alert("lista[214] = " + lista[214]);
//        alert("lista.length = " + lista.length);
//        alert("dwr.util.getValue('r02p214') = " + dwr.util.getValue('r02p214'));

        disableId("bholl");
        mottaRemoto.guardarT02(lista, function(data){
            window.location = "holland.htm";
        });
    }

    jQuery(document).ready(function() {
        jQuery("#imForm").validate();
    });

    jQuery.validator.setDefaults({
        submitHandler: function() {
            enviar();
        }
    });

</script>