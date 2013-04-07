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

	private boolean evaluaGlobal;

	@Column(name = "evalua_global")
	@Basic
	@Type(type = "org.hibernate.type.NumericBooleanType")
	public boolean isEvaluaGlobal() {
		return evaluaGlobal;
	}

	public void setEvaluaGlobal(boolean evaluaGlobal) {
		this.evaluaGlobal = evaluaGlobal;
	}

	private boolean evaluaCapitulos;

	@Column(name = "evalua_capitulos")
	@Basic
	@Type(type = "org.hibernate.type.NumericBooleanType")
	public boolean isEvaluaCapitulos() {
		return evaluaCapitulos;
	}

	public void setEvaluaCapitulos(boolean evaluaCapitulos) {
		this.evaluaCapitulos = evaluaCapitulos;
	}

	private boolean evaluaItems;

	@Column(name = "evalua_items")
	@Basic
	@Type(type = "org.hibernate.type.NumericBooleanType")
	public boolean isEvaluaItems() {
		return evaluaItems;
	}

	public void setEvaluaItems(boolean evaluaItems) {
		this.evaluaItems = evaluaItems;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Empleado empleado = (Empleado) o;

		if (evaluaCapitulos != empleado.evaluaCapitulos) return false;
		if (evaluaGlobal != empleado.evaluaGlobal) return false;
		if (evaluaItems != empleado.evaluaItems) return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = (evaluaGlobal ? 1 : 0);
		result = 31 * result + (evaluaCapitulos ? 1 : 0);
		result = 31 * result + (evaluaItems ? 1 : 0);
		return result;
	}
}
