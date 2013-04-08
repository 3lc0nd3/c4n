package co.com.elramireza.pn.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: 2/01/2013
 * Time: 05:40:41 PM
 */
@Entity
@Table(name = "empleado")
public class Empleado {
    private int idEmpleado;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    private Timestamp fechaIngreso;

    @Basic
    @Column(name = "fecha_ingreso")
    public Timestamp getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Timestamp fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

	private PnPremio premioByIdPremio;

	@ManyToOne
	@JoinColumn(name = "id_premio", referencedColumnName = "id", nullable = false)
	public PnPremio getPremioByIdPremio() {
		return premioByIdPremio;
	}

	public void setPremioByIdPremio(PnPremio premioByIdPremio) {
		this.premioByIdPremio = premioByIdPremio;
	}

	private Empresa empresaByIdEmpresa;

	@ManyToOne
	@JoinColumn(name = "id_empresa", referencedColumnName = "id", nullable = false)
	public Empresa getEmpresaByIdEmpresa() {
		return empresaByIdEmpresa;
	}

	public void setEmpresaByIdEmpresa(Empresa empresaByIdEmpresa) {
		this.empresaByIdEmpresa = empresaByIdEmpresa;
	}

    private Perfil perfilByIdPerfil;

    @ManyToOne
    @JoinColumn(name = "id_perfil", referencedColumnName = "id", nullable = false)
    public Perfil getPerfilByIdPerfil() {
        return perfilByIdPerfil;
    }

    public void setPerfilByIdPerfil(Perfil perfilByIdPerfil) {
        this.perfilByIdPerfil = perfilByIdPerfil;
    }

    private Persona personaByIdPersona;

    @ManyToOne
    @JoinColumn(name = "id_persona", referencedColumnName = "id", nullable = false)
    public Persona getPersonaByIdPersona() {
        return personaByIdPersona;
    }

    public void setPersonaByIdPersona(Persona personaByIdPersona) {
        this.personaByIdPersona = personaByIdPersona;
    }

    private String jornada;

    @javax.persistence.Column(name = "jornada")
    @Basic
    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    private String especialidad;

    @javax.persistence.Column(name = "especialidad")
    @Basic
    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    private String curso;

    @javax.persistence.Column(name = "curso")
    @Basic
    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    private int lista;

    @javax.persistence.Column(name = "lista")
    @Basic
    public int getLista() {
        return lista;
    }

    public void setLista(int lista) {
        this.lista = lista;
    }

}
