<%@ page import="co.com.elramireza.pn.model.Texto" %>
<%@ page import="co.com.elramireza.pn.model.*" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="pnManager" class="co.com.elramireza.pn.dao.PnDAO" scope="application" />
<%

    Persona persona = (Persona) session.getAttribute("persona");
    Empleado empleo = (Empleado) session.getAttribute("empleo");

    Texto texto = pnManager.getTexto(1);
    Texto textoRegistro = pnManager.getTexto(10);
    PnPremio premioActivo = pnManager.getPnPremioActivo();

    String mensajeLogin = (String) request.getAttribute("mensajeLogin");
    if (mensajeLogin == null) {
        mensajeLogin = "";
    }

    System.out.println("empleo = " + empleo);
    System.out.println("persona = " + persona);
%>

<%
    if (persona == null) {
%>
<%--<jsp:include page="c_slider01.jsp"/>--%>
<%
    }
%>
<%--  LOGIN  --%>
<div class="register">
    <div class="row">
        <div class="span6">
            <%
                if(mensajeLogin.length()!=0){
            %>
            <div class="alert">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <%=mensajeLogin%>
            </div>
            <%
                }
                if(persona == null ){  //  NO HAY PERSONA
            %>
            <jsp:include page="c_login_doc.jsp"/>
            <%
                } else if(persona.getYa()==0){
            %>
            <jsp:include page="c_login_doc.jsp"/>
            <%
                } else { // SI HAY PERSONA
                    Texto selPerfil = pnManager.getTexto(14);
                    if(empleo==null){ // NO HAY EMPLEO, TOCA SELECCIONAR UNO



            %>
            <h3 class="color"><%=selPerfil.getTexto1()%>:</h3>
            <%
                        List<Empleado> empleos = pnManager.getEmpleosFromPersona(persona.getIdPersona());
                        if(empleos.size()>0){

                            for (Empleado empleado: empleos){
            %>
            <br>
            <span style="margin-top:20px; margin-bottom:10px;">
                <button id="b<%=empleado.getIdEmpleado()%>" type="button" onclick="selEmpleoB(<%=empleado.getIdEmpleado()%>);" class="btn btn-primary">
                    <%=empleado.getPerfilByIdPerfil().getPerfil()%>
                    en
                    <%=empleado.getPremioByIdPremio().getNombrePremio()%>
                    -
                    <%=empleado.getEmpresaByIdEmpresa().getNombreEmpresa()%>
                </button>
            </span>
            <%
                            }
                        } else { // NO TIENE UN EMPLEO
            %>
            <div class="warning">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                No tiene un perfil
            </div>
            <%
                        }
                    } else { // SI TIENE EMPLEO
            %>

            <H3 CLASS="color">
                <%=selPerfil.getTexto2()%>
            </H3>

            <span style="font-size:large;">
                <%=persona.getNombreCompleto()%>
                <br>
                <strong><%=empleo.getPerfilByIdPerfil().getPerfil()%></strong>
                <br>
                en: <%=empleo.getPremioByIdPremio().getNombrePremio()%>
                <br>
                <%=empleo.getEmpresaByIdEmpresa().getNombreEmpresa()%>
            </span>
            <br>

            <form id="cambiarPerfilF" action="index.htm" method="post">
                <input type="hidden" name="cambiarPerfil" value="1">
            </form>
            <button type="button" onclick="cambiarPerfil();" class="btn btn-primary">Cambiar el Perfil</button>
            <br>
            <br>
              <%--  ESPACIO PARA PONER INFO DE LA EMPRESA PARTICIPANTE  --%>
            <%--<jsp:include page="c_empresa_admon.jsp"    />--%>

            <%
                    } // FIN SELECCIONA EMPLEO
                } // FIN SI HAY PERSONA
            %>
        </div>

        <div class="span6">
            <h2><%=texto.getTexto1()%></h2>
            <p class="big grey">
                <%=texto.getTexto2()%>
            </p>
            <p style="text-align:justify;">
                <%=texto.getTexto3()%>
            </p>

        </div>
    </div>
</div>

<%--  END LOGIN  --%>

<%--<div class="border"></div>--%>

<%--  REGISTER  --%>
<%
    if(premioActivo !=null && persona== null){ // SI HAY UN PnPREMIO ACTIVO
%>


<div class="border"></div>
<%
    }  /* END IF HAY UN PREMIO PN ACTIVO */
%>
<%
    if(persona == null){ // SOLO SI NO HAY PERSONA
        Texto textoEvaluador = pnManager.getTexto(15);
%>
<registroEval>
    <div id="rowRegistro" style="display: none" class="row">
        <div class="span8">
            <div class="formy">
                <div class="form">
                    <!-- Register form (not working)-->
                    <form id="registroEvaluador" class="form-horizontal" autocomplete="off">
                        <A name="registro"></A>
                        <h5>Datos del Participante</h5>

                        <!-- Documento de Identidad Aspirante-->
                        <div class="control-group">
                            <label class="control-label" for="documentoIdentidad">Documento Identidad</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="documentoIdentidad" name="documentoIdentidad" readonly>
                            </div>
                        </div>

                        <!-- Nombre Aspirante-->
                        <div class="control-group">
                            <label class="control-label" for="nombrePersona">Nombre</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="nombrePersona" name="nombrePersona" readonly>
                            </div>
                        </div>

                        <!-- sexo -->
                        <div class="control-group">
                            <label class="control-label" for="sexo">Sexo</label>
                            <div class="controls">
                                <select id="sexo" onchange="">
                                    <option value="m">Masculino</option>
                                    <option value="f">Femenino</option>
                                </select>
                            </div>
                        </div>
                        <!-- fecha nacimiento -->
                        <div class="control-group">
                            <label class="control-label" for="tmpFechaNacimiento">Fecha Nacimiento</label>
                            <div class="controls">
                                <input type="text" readonly class="input-large required" name="tmpFechaNacimiento" id="tmpFechaNacimiento">
                            </div>
                        </div>

                        <%--<!-- departamento -->
                        <div class="control-group">
                            <label class="control-label" for="departamento">Departamento</label>
                            <div class="controls">
                                <select id="departamento" onchange="changeEstado();">
                                    <%
                                        for (LocEstado estado: pnManager.getLocEstados()){
                                    %>
                                    <option value="<%=estado.getIdEstado()%>"><%=estado.getNombreEstado()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>--%>
                        <!-- ciudad -->
                        <div class="control-group">
                            <label class="control-label" for="idCiudad">Ciudad</label>
                            <div class="controls">
                                <select id="idCiudad"  name="idCiudad" >
                                    <option value="150">Bogota D.C.</option>
                                </select>
                            </div>
                        </div>

                        <!-- direccion -->
                        <div class="control-group">
                            <label class="control-label" for="direccion">Direcci&oacute;n</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="direccion" name="direccion">
                            </div>
                        </div>

                        <!-- estrato -->
                        <div class="control-group">
                            <label class="control-label" for="estrato">Estrato</label>
                            <div class="controls">
                                <select id="estrato" onchange="">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                </select>
                            </div>
                        </div>

                        <!-- TElefono Aspirante-->
                        <div class="control-group">
                            <label class="control-label" for="telefonoFijo">Tel&eacute;fono Fijo</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="telefonoFijo" name="telefonoFijo">
                            </div>
                        </div>

                        <!-- telMovilAspirante-->
                        <div class="control-group">
                            <label class="control-label" for="celular">Celular</label>
                            <div class="controls">
                                <input type="text" class="input-large required digits" id="celular" name="celular" maxlength="10" min="3000000000">
                            </div>
                        </div>


                        <!-- Email Personal Aspirante-->
                        <div class="control-group">
                            <label class="control-label" for="emailPersonal">Email Personal</label>
                            <div class="controls">
                                <input type="text" class="input-large required email" id="emailPersonal" name="emailPersonal">
                            </div>
                        </div>

                        <!-- facebook-->
                        <div class="control-group">
                            <label class="control-label" for="facebook">Facebook</label>
                            <div class="controls">
                                <input type="text" class="input-large" id="facebook" name="facebook">
                            </div>
                        </div>

                        <!-- twitter-->
                        <div class="control-group">
                            <label class="control-label" for="twitter">Twitter</label>
                            <div class="controls">
                                <input type="text" class="input-large" id="twitter" name="twitter">
                            </div>
                        </div>

                        <!-- skype-->
                        <div class="control-group">
                            <label class="control-label" for="skype">Skype</label>
                            <div class="controls">
                                <input type="text" class="input-large" id="skype" name="skype">
                            </div>
                        </div>

                        <!-- asignatura1-->
                        <div class="control-group">
                            <label class="control-label" for="asignatura1">Asignatura Interesante</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="asignatura1" name="asignatura1">
                            </div>
                        </div>

                        <!-- asignatura2-->
                        <div class="control-group">
                            <label class="control-label" for="asignatura2">Asignatura Indiferente</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="asignatura2" name="asignatura2">
                            </div>
                        </div>

                        <!-- deseaEstudioTecnico -->
                        <div class="control-group">
                            <label class="control-label" for="deseaEstudioTecnico">Estudiar&aacute; T&eacute;cnico</label>
                            <div class="controls">
                                <select id="deseaEstudioTecnico" onchange="">
                                    <option value="si">si</option>
                                    <option value="no">no</option>
                                </select>
                            </div>
                        </div>

                        <!-- deseaEstudioTecnologico -->
                        <div class="control-group">
                            <label class="control-label" for="deseaEstudioTecnologico">Estudiar&aacute; Tecnol&oacute;gico</label>
                            <div class="controls">
                                <select id="deseaEstudioTecnologico" onchange="">
                                    <option value="si">si</option>
                                    <option value="no">no</option>
                                </select>
                            </div>
                        </div>

                        <!-- deseaEstudioUniversitario -->
                        <div class="control-group">
                            <label class="control-label" for="deseaEstudioUniversitario">Estudiar&aacute; Universitario</label>
                            <div class="controls">
                                <select id="deseaEstudioUniversitario" onchange="">
                                    <option value="si">si</option>
                                    <option value="no">no</option>
                                </select>
                            </div>
                        </div>

                        <!-- carrera1-->
                        <div class="control-group">
                            <label class="control-label" for="carrera1">Carrera 1</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="carrera1" name="carrera1">
                            </div>
                        </div>

                        <!-- carrera2-->
                        <div class="control-group">
                            <label class="control-label" for="carrera2">Carrera 2</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="carrera2" name="carrera2">
                            </div>
                        </div>

                        <!-- carrera3-->
                        <div class="control-group">
                            <label class="control-label" for="carrera3">Carrera 3</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="carrera3" name="carrera3">
                            </div>
                        </div>

                        <!-- institucion1-->
                        <div class="control-group">
                            <label class="control-label" for="institucion1">Instituci&oacute;n 1</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="institucion1" name="institucion1">
                            </div>
                        </div>

                        <!-- institucion2-->
                        <div class="control-group">
                            <label class="control-label" for="institucion2">Instituci&oacute;n 2</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="institucion2" name="institucion2">
                            </div>
                        </div>

                        <!-- institucion1-->
                        <div class="control-group">
                            <label class="control-label" for="institucion3">Instituci&oacute;n 3</label>
                            <div class="controls">
                                <input type="text" class="input-large required" id="institucion3" name="institucion3">
                            </div>
                        </div>

                        <!-- quienApoya -->
                        <div class="control-group">
                            <label class="control-label" for="quienApoya">Familiar que lo apoyar&aacute;</label>
                            <div class="controls">
                                <select id="quienApoya" onchange="">
                                    <option value="padres">Padres</option>
                                    <option value="madre">Madre</option>
                                    <option value="padre">Padre</option>
                                    <option value="hermanos">Hermanos</option>
                                    <option value="otros">Otros</option>
                                </select>
                            </div>
                        </div>

                        <!-- formaPago -->
                        <div class="control-group">
                            <label class="control-label" for="formaPago">Forma de Pago</label>
                            <div class="controls">
                                <select id="formaPago" onchange="">
                                    <option value="propios">Recursos Propios</option>
                                    <option value="credito">Cr&eacute;dito</option>
                                    <option value="mixto">Mixto</option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <label class="checkbox inline">
                                    <input type="checkbox" id="inlineCheckboxEval" name="inlineCheckboxEval" class="required" value="agree">
                                    Acepto T&eacute;rminos y Condiciones
                                </label>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-actions">
                            <!-- Buttons -->
                            <%--<button type="button" class="btn" onclick="registraP();">Registrar</button>--%>
                            <%--<input class="btn" type="submit" value=""/>--%>
                            <button id="b3" type="submit" class="btn">Registrar</button>
                            <%--<button type="reset" class="btn">Reset</button>--%>
                        </div>
                    </form>
                    <%--Already have an Account? <a href="login.html">Login</a>--%>
                </div> <%--  END DIV FORM  --%>
            </div><%--  END FORMY  --%>

        </div>
        <div class="span4">

            <h2>
                <%=textoEvaluador.getTexto1()%>
            </h2>
            <p class="big grey">
                <%=textoEvaluador.getTexto2()%>
            </p>
            <p style="text-align:justify;">
                <%=textoEvaluador.getTexto3()%>
            </p>
        </div>
    </div>
</registroEval>

<%
    } // FIN REGISTRA EVALUADOR
%>

<%--  END REGISTER  --%>

<jsp:include page="c_footer_r.jsp"/>

<script type="text/javascript">

    function changeEstado(){
        dwr.util.removeAllOptions("idCiudad");
        var idEstado = dwr.util.getValue("departamento");
        pnRemoto.getLocCiudadesFromEstado(idEstado, function(data){
            dwr.util.addOptions("idCiudad", data, "idCiudad", "nombreCiudad");
        });
    }

    function revisaNit(){
        var nit = dwr.util.getValue("nit");
        pnRemoto.getEmpresaFromNit(nit, function(data){
            if(data!= null){
                dwr.util.setValues(data);
                dwr.util.setValue("departamento", data.locCiudadByIdCiudad.locEstadoByIdEstado.idEstado);
                dwr.util.setValue("locCiudadEmpresa", data.locCiudadByIdCiudad.idCiudad);
                dwr.util.setValue("idEmpresaCategoria",         data.empresaCategoriaByIdCategoriaEmpresa.id);
                dwr.util.setValue("idEmpresaCategoriaTamano",   data.empresaCategoriaTamanoByIdCategoriaTamanoEmpresa.id);
            }
        });
    }

    function cambiarPerfil(){
        dwr.util.byId("cambiarPerfilF").submit();
    }

    function selEmpleoB(idEmpleo){
//        disableId('b'+idEmpleo);
//        var bTmp = dwr.util.byId('b'+idEmpleo);
//        alert("bTmp = " + bTmp);

        pnRemoto.selEmpleo(idEmpleo, function(data){
            if(data!=null){
//                alert("Vamos con: " + data.perfilByIdPerfil.perfil);
//                enableId("b2");
                window.location = "index.htm";
            } else {
                alert('Problemas !');
                enableId("b2");
            }
        });
    }

    jQuery.validator.addMethod("fieldDiff", function(value, element, arg){
        return arg != value;
    }, jQuery.validator.messages.required);

    jQuery.validator.addMethod("selectNoZero", function(value, element, arg){
        return "0" != value;
    }, jQuery.validator.messages.required);

    jQuery.validator.addMethod("money", function (value, element) {
        return this.optional(element) || /^((\d{1,5})+\.\d{2})?$|^\$?[\.]([\d][\d]?)$/.test(value);
    }, 'Moneda' );

    jQuery.validator.addMethod("pass_same", function(value, element) {
        return $('#username').val() == $('#email').val()
    }, "* Deben ser iguales");

    jQuery(document).ready(function() {
        jQuery("#registroP").validate({
            submitHandler: function() {
                registraP();
            },
            rules: {
                id_ciudad:   "selectNoZero"
            }
        });
    });

    jQuery(document).ready(function() {
        jQuery("#registroEvaluador").validate({
            submitHandler: function() {
                registraEvaluador();
            },
            rules: {
                idCiudad:   "selectNoZero"
            }
        });
    });

    function registraEvaluador(){
        disableId("b3");
        var aspirante = {
            documentoIdentidad : null,
            nombrePersona : null,
            apellido : null,
            sexo : null,
            tmpFechaNacimiento : null,
            idCiudad : null,
            direccion : null,
            estrato : null,
            telefonoFijo : null,
            celular : null,
            emailPersonal : null,
            facebook : null,
            twitter : null,
            skype : null,
            asignatura1 : null,
            asignatura2 : null,
            deseaEstudioTecnico : null,
            deseaEstudioTecnologico : null,
            deseaEstudioUniversitario : null,
            carrera1 : null,
            carrera2 : null,
            carrera3 : null,
            institucion1 : null,
            institucion2 : null,
            institucion3 : null,
            quienApoya : null,
            formaPago : null
        };
        dwr.util.getValues(aspirante);

//        alert("aspirante.nombre = " + aspirante.nombre);

        pnRemoto.registroAspirante(aspirante, function(data){
            if(data==1){
                var formCS = dwr.util.byId("registroEvaluador");
//                formCS.reset();
                alert("Gracias por su registro");
//                location.reload(true);
                window.location = "index.htm";
                enableId("b3");
            } else {
                alert("Problemas !");
                enableId("b3");
            }
        });

    }


    $('#tmpFechaNacimiento').datepicker({
        format: 'dd-mm-yyyy',
        autoclose: true
    });

    /*jQuery.validator.setDefaults({
        submitHandler: function() {
            registraP();
        }
    });*/

    jQuery("#bDoc").click(function(){
        var doc = dwr.util.getValue('doc');
        disableId("bDoc");
//        alert("doc = " + doc);
        pnRemoto.loginDoc(doc, function(data){
            if(data == null){
                alert("Este documento no esta registrado");
            } else {
//                alert("data.nombrePersona = " + data.nombrePersona);
//                alert("data.ya = " + data.ya);
                if(data.ya == 0){
                    alert(data.nombrePersona+" debes completar el registro");
                    jQuery("#rowRegistro").show('slow', function(){
                        scrollToAnchor("registro");
                    });
//                    jQuery("#rowRegistro").show();
                    dwr.util.setValue("nombrePersona", data.nombrePersona);
                    dwr.util.setValue("documentoIdentidad", data.documentoIdentidad);

                } else {
//                    location.reload(true);
                    window.location = "index.htm";
                }
            }
            enableId("bDoc");
        });
    });

    enableId("bDoc");

    $('#doc').focus();
</script>