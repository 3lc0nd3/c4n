<%@ page import="co.com.elramireza.pn.model.*" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />


<div class="register">
    <div class="row">
        <div class="span10">
            <div class="formy">
                <h5>Estudiantes</h5>
                <div class="form">
                    <!-- Login form (not working)-->
                    <form class="form-horizontal">
                        <!-- Persona -->
                        <div class="control-group">
                            <label class="control-label" for="idPersona">Persona</label>
                            <div class="controls">
                                <%--<input type="text" class="input-large" name="username" id="username">--%>
                                <select id="idPersona" name="idPersona" class="span6">
                                    <%
                                        for (Persona persona: pnManager.getPersonas()){
                                    %>
                                    <option value="<%=persona.getIdPersona()%>"><%=persona.getNombreCompleto()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!-- EMPRESA -->
                        <div class="control-group">
                            <label class="control-label" for="idEmpresa">Colegio (Clientes)</label>
                            <div class="controls">
                                <select id="idEmpresa" name="idEmpresa" class="span6">
                                    <%
                                        for (Empresa empresa: pnManager.getEmpresaActivas()){
                                    %>
                                    <option value="<%=empresa.getIdEmpresa()%>">
                                        <%=empresa.getNombreEmpresa()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!-- CONVOCATORIA -->
                        <div class="control-group">
                            <label class="control-label" for="idEmpresa">Convocatoria</label>
                            <div class="controls">
                                <select id="idPremio" name="idPremio" class="span6">
                                    <%
                                        for (PnPremio premio: pnManager.getPnPremiosActivos()){
                                    %>
                                    <option value="<%=premio.getIdPnPremio()%>">
                                        <%=premio.getNombrePremio()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!-- JORNADA -->
                        <div class="control-group">
                            <label class="control-label" for="jornada">Jornada</label>
                            <div class="controls">
                                <select id="jornada" name="jornada" class="span6">
                                    <option value="m">Ma&ntilde;ana</option>
                                    <option value="t">Tarde</option>
                                </select>
                            </div>
                        </div>
                        <!-- CURSO -->
                        <div class="control-group">
                            <label class="control-label" for="curso">Curso</label>
                            <div class="controls">
                                <input type="text" id="curso" name="curso" maxlength="30" class="span6">
                            </div>
                        </div>
                        <!-- especialidad -->
                        <div class="control-group">
                            <label class="control-label" for="especialidad">Especialidad</label>
                            <div class="controls">
                                <input type="text" id="especialidad" name="especialidad" class="span6">
                            </div>
                        </div>
                        <!-- Lista -->
                        <div class="control-group">
                            <label class="control-label" for="idEmpresa"># Lista</label>
                            <div class="controls">
                                <select id="lista" name="lista" class="span6">
                                    <%
                                        for (int lista=0; lista<60; lista++){
                                    %>
                                    <option value="<%=lista%>">
                                        <%=lista%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!-- Perfil -->
                        <div class="control-group">
                            <label class="control-label" for="idPerfil">Perfil en Sistema</label>
                            <div class="controls">
                                <select id="idPerfil" name="idPerfil">
                                    <%
                                        for (Perfil perfil: pnManager.getPerfilesPublico()){
                                    %>
                                    <option value="<%=perfil.getId()%>"><%=perfil.getPerfil()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!-- Buttons -->
                        <div class="form-actions">
                            <!-- Buttons -->
                            <button id="b1" type="button" class="btn">Consultar</button>
                            <button id="b2" onclick="vincule();" type="button" class="btn">Vincular</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="span2">
        </div>
    </div>
</div>

<div class="border"></div>

<h3 class="color">Estudiantes seg&uacute;n Colegio</h3>

<div class="row-fluid">
    <br>
    <table cellpadding="0" cellspacing="0" border="0" class="display" id="participantesT">
        <thead>
        <tr>
            <th>Convocatoria</th>
            <th>Colegio</th>
            <th>Perfil</th>
            <th>Persona</th>
            <th>Opciones</th>
        </tr>
        </thead>
        <%  // TODO HACER ESTO EN UNA SOLA CONSULTA
            String imageActive;
            String messaActive;
            for (Empleado empleado: pnManager.getEmpleados()){
                /*if(participante.getEstado()){
                        imageActive = "img/positive.png";
                        messaActive = "Desactivar?";
                    } else {
                        imageActive = "img/negative.png";
                        messaActive = "Activar?";
                    }*/
                Persona persona = empleado.getPersonaByIdPersona();
        %>
        <tr>
            <td> <%=empleado.getPremioByIdPremio().getNombrePremio()%></td>
            <td> <%=empleado.getEmpresaByIdEmpresa().getNombreEmpresa()%></td>
            <td> <%=empleado.getPerfilByIdPerfil().getPerfil()%></td>
            <td>
                <%=persona.getNombreCompleto()%>
                <%=persona.getEmailPersonal()!=null?"<br>"+persona.getEmailPersonal():""%>
                <br>
                <%=persona.getDocumentoIdentidad()%>
            </td>
            <%--<td><img id="imgActive<%=participante.getIdParticipante()%>" width="28" onclick="activaDesactiva(<%=participante.getIdParticipante()%>);" src="<%=imageActive%>" alt="<%=messaActive%>" title="<%=messaActive%>"></td>--%>
            <td>
                <img width="28" onclick="desvincule(<%=empleado.getIdEmpleado()%>);" src="images/broken_link.jpg" alt="desvincula" title="desvincula">
                <img width="28" onclick="resetEmpleadoT02(<%=empleado.getIdEmpleado()%>);" src="img/stop.png" alt="desvincula" title="reset">
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>


<jsp:include page="c_footer_r.jsp"/>

<script type="text/javascript">

    function desvincule(idEmpleado){
        if (confirm("Desea desvincular a este Estudiante?")) {
            pnRemoto.desvinculaEmpleado(idEmpleado, function(data){
                if(data == ''){
                    alert("Desvinculado Completo");
                    window.location = "empleados.htm";
                } else {
                    alert("Problemas ! " + data);
                }
            });
        }
    }

    function resetEmpleadoT02(idEmpleado){
        if(confirm("Desea borrar respuesas de este Estudiante?")){
            mottaRemoto.deleteRespuestaT02(idEmpleado, function(data){
                if(data == 1){
                    alert("Borrado Completo");
//                    window.location = "empleados.htm";
                } else {
                    alert("Problemas ! " + data);
                }
            });
        }
    }

    function vincule(){
        if (dwr.util.getValue("idParticipante") == 1 && dwr.util.getValue("idPerfil") != 1) {
            alert("No puede hacer eso");
        } else if(dwr.util.getValue("especialidad") == ''){
            alert("Especialidad Vacio")
        } else if(dwr.util.getValue("curso") == ''){
            alert("Curso vacio");
        } else {
            disableId('b2');
            pnRemoto.vinculaEmpleado(
                    dwr.util.getValue("idPersona"),
                    dwr.util.getValue("idEmpresa"),
                    dwr.util.getValue("idPremio"),
                    dwr.util.getValue("idPerfil"),
                    dwr.util.getValue("jornada"),
                    dwr.util.getValue("curso"),
                    dwr.util.getValue("especialidad"),
                    dwr.util.getValue("lista"),
                    function(data) {
                        if (data != null) {
                            alert("Registro Completo");
                            window.location = "empleados.htm";
                        } else {
                            alert("Problemas !");
                            enableId('b2');
                        }
                    });
        }
    }

    function activaDesactiva(id){
        $("#imgActive"+id).attr("src","images/loading.gif");
        pnRemoto.activeDesactiveParticipante(id, function(data){
            if(data!=null){
                if(data){
                    $("#imgActive"+id).attr("src","img/positive.png");
                    $("#imgActive"+id).attr("title", "Desactivar?");
                    $("#imgActive"+id).attr("alt",   "Desactivar?");
                } else {
                    $("#imgActive"+id).attr("src","img/negative.png");
                    $("#imgActive"+id).attr("title", "Activar?");
                    $("#imgActive"+id).attr("alt",   "Activar?");
                }
            } else {
                alert("Problemas !");
            }
        });
    }

    $(document).ready(function() {
        $('#participantesT').dataTable( {
            "aaSorting": [[ 0, "asc" ]],
            "sPaginationType": "full_numbers",
            "oLanguage": {
//                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "Sin resultados",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando 0 a 0 de 0 registros",
                "sInfoFiltered": "(Filtrado de _MAX_ registros en total)",
                "sSearch": "Buscar en la tabla:",
                "oPaginate": {
                    "sPrevious": "Anterior",
                    "sNext": "Siguiente",
                    "sFirst": "Primera",
                    "sLast": "&Uacute;ltima"
                },
                "sLength" : 5/*,
                "sLengthMenu": 'Mostrar <select>'+
                               '<option value="5">5</option>'+
                               '<option value="10">10</option>'+
                               '<option value="20">20</option>'+
                               '<option value="30">30</option>'+
                               '<option value="40">40</option>'+
                               '<option value="50">50</option>'+
                               '<option value="-1">All</option>'+
                               '</select> registros'*/
            }
        } );
    } );

</script>