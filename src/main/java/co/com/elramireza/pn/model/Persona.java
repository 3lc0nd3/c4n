package co.com.elramireza.pn.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

import static java.lang.String.format;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: 2/01/2013
 * Time: 05:40:51 PM
 */
@Entity
@Table(name = "persona")
public class Persona {
    private int idPersona;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    @Transient
    public String getNombreCompleto(){
        return format("%s %s", getNombrePersona(), getApellido());
    }

    private String nombrePersona;

    @Basic
    @Column(name = "nombre")
    public String getNombrePersona() {
        return nombrePersona;
    }

    public void setNombrePersona(String nombrePersona) {
        this.nombrePersona = nombrePersona;
    }

    private String apellido;

    @Basic
    @Column(name = "apellido")
    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

	private String sexo;

	@Basic
	@Column(name = "sexo")
	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	private String tmpFechaNacimiento;

	@Transient
	public String getTmpFechaNacimiento() {
		return tmpFechaNacimiento;
	}

	public void setTmpFechaNacimiento(String tmpFechaNacimiento) {
		this.tmpFechaNacimiento = tmpFechaNacimiento;
	}

	private Date fechaNacimiento;

	@Basic
	@Column(name = "fecha_nacimiento")
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	private String direccion;

	@Basic
	@Column(name = "direccion")
	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	private int estrato;

	@Basic
	@Column(name = "estrato")
	public int getEstrato() {
		return estrato;
	}

	public void setEstrato(int estrato) {
		this.estrato = estrato;
	}

	private String documentoIdentidad;

    @Basic
    @Column(name = "documento_identidad")
    public String getDocumentoIdentidad() {
        return documentoIdentidad;
    }

    public void setDocumentoIdentidad(String documentoIdentidad) {
        this.documentoIdentidad = documentoIdentidad;
    }

    private String emailPersonal;

    @Basic
    @Column(name = "email_personal")
    public String getEmailPersonal() {
        return emailPersonal;
    }

    public void setEmailPersonal(String emailPersonal) {
        this.emailPersonal = emailPersonal;
    }

    private String emailCorporativo;

    @Basic
    @Column(name = "email_corporativo")
    public String getEmailCorporativo() {
        return emailCorporativo;
    }

    public void setEmailCorporativo(String emailCorporativo) {
        this.emailCorporativo = emailCorporativo;
    }

	private String facebook;

	@Basic
	@Column(name = "facebook")
	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	private String twitter;

    @Basic
    @Column(name = "twitter")
    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    private String skype;

    @Basic
    @Column(name = "skype")
    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    private String telefonoFijo;

    @Basic
    @Column(name = "telefono_fijo")
    public String getTelefonoFijo() {
        return telefonoFijo;
    }

    public void setTelefonoFijo(String telefonoFijo) {
        this.telefonoFijo = telefonoFijo;
    }

    private String celular;

    @Basic
    @Column(name = "celular")
    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    private String login;

    @Basic
    @Column(name = "login")
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    private String password;

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private boolean estado;

    @Basic
    @Column(name = "estado")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

	private int ya;

	@Basic
	@Column(name = "ya")
	public int getYa() {
		return ya;
	}

	public void setYa(int ya) {
		this.ya = ya;
	}

	private int locCiudadPersona;

    @Transient
    public int getLocCiudadPersona() {
        return locCiudadPersona;
    }

    public void setLocCiudadPersona(int locCiudadPersona) {
        this.locCiudadPersona = locCiudadPersona;
    }
	
	private int idCiudad;

	@Transient
	public int getIdCiudad() {
		return idCiudad;
	}

	public void setIdCiudad(int idCiudad) {
		this.idCiudad = idCiudad;
	}

	private LocCiudad locCiudadByIdCiudad;

    @ManyToOne
    @JoinColumn(name = "id_ciudad", referencedColumnName = "id_ciudad", nullable = false)
    public LocCiudad getLocCiudadByIdCiudad() {
        return locCiudadByIdCiudad;
    }

    public void setLocCiudadByIdCiudad(LocCiudad locCiudadByIdCiudad) {
        this.locCiudadByIdCiudad = locCiudadByIdCiudad;
    }

    private Timestamp fechaCreacion;

    @Basic
    @Column(name = "fecha_creacion")
    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

	private String asignatura2;

	@Basic
	@Column(name = "asignatura2")
	public String getAsignatura2() {
		return asignatura2;
	}

	public void setAsignatura2(String asignatura2) {
		this.asignatura2 = asignatura2;
	}

	private String asignatura1;

	@Column(name = "asignatura1")
	@Basic
	public String getAsignatura1() {
		return asignatura1;
	}

	public void setAsignatura1(String asignatura1) {
		this.asignatura1 = asignatura1;
	}

	private String deseaEstudioTecnico;

	@Column(name = "desea_estudio_tecnico")
	@Basic
	public String getDeseaEstudioTecnico() {
		return deseaEstudioTecnico;
	}

	public void setDeseaEstudioTecnico(String deseaEstudioTecnico) {
		this.deseaEstudioTecnico = deseaEstudioTecnico;
	}

	private String deseaEstudioTecnologico;

	@Basic
	@Column(name = "desea_estudio_tecnologico")
	public String getDeseaEstudioTecnologico() {
		return deseaEstudioTecnologico;
	}

	public void setDeseaEstudioTecnologico(String deseaEstudioTecnologico) {
		this.deseaEstudioTecnologico = deseaEstudioTecnologico;
	}

	private String deseaEstudioUniversitario;

	@Basic
	@Column(name = "desea_estudio_universitario")
	public String getDeseaEstudioUniversitario() {
		return deseaEstudioUniversitario;
	}

	public void setDeseaEstudioUniversitario(String deseaEstudioUniversitario) {
		this.deseaEstudioUniversitario = deseaEstudioUniversitario;
	}

	private String carrera1;

	@Column(name = "carrera1")
	@Basic
	public String getCarrera1() {
		return carrera1;
	}

	public void setCarrera1(String carrera1) {
		this.carrera1 = carrera1;
	}

	private String carrera2;

	@Column(name = "carrera2")
	@Basic
	public String getCarrera2() {
		return carrera2;
	}

	public void setCarrera2(String carrera2) {
		this.carrera2 = carrera2;
	}

	private String carrera3;

	@Column(name = "carrera3")
	@Basic
	public String getCarrera3() {
		return carrera3;
	}

	public void setCarrera3(String carrera3) {
		this.carrera3 = carrera3;
	}

	private String institucion1;

	@Column(name = "institucion1")
	@Basic
	public String getInstitucion1() {
		return institucion1;
	}

	public void setInstitucion1(String institucion1) {
		this.institucion1 = institucion1;
	}

	private String institucion2;

	@Column(name = "institucion2")
	@Basic
	public String getInstitucion2() {
		return institucion2;
	}

	public void setInstitucion2(String institucion2) {
		this.institucion2 = institucion2;
	}

	private String institucion3;

	@Column(name = "institucion3")
	@Basic
	public String getInstitucion3() {
		return institucion3;
	}

	public void setInstitucion3(String institucion3) {
		this.institucion3 = institucion3;
	}

	private String quienApoya;

	@Column(name = "quien_apoya")
	@Basic
	public String getQuienApoya() {
		return quienApoya;
	}

	public void setQuienApoya(String quienApoya) {
		this.quienApoya = quienApoya;
	}

	private String formaPago;

	@Column(name = "forma_pago")
	@Basic
	public String getFormaPago() {
		return formaPago;
	}

	public void setFormaPago(String formaPago) {
		this.formaPago = formaPago;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Persona persona = (Persona) o;

		if (asignatura1 != null ? !asignatura1.equals(persona.asignatura1) : persona.asignatura1 != null) return false;
		if (carrera1 != null ? !carrera1.equals(persona.carrera1) : persona.carrera1 != null) return false;
		if (carrera2 != null ? !carrera2.equals(persona.carrera2) : persona.carrera2 != null) return false;
		if (carrera3 != null ? !carrera3.equals(persona.carrera3) : persona.carrera3 != null) return false;
		if (deseaEstudioTecnico != null ? !deseaEstudioTecnico.equals(persona.deseaEstudioTecnico) : persona.deseaEstudioTecnico != null)
			return false;
		if (formaPago != null ? !formaPago.equals(persona.formaPago) : persona.formaPago != null) return false;
		if (institucion1 != null ? !institucion1.equals(persona.institucion1) : persona.institucion1 != null)
			return false;
		if (institucion2 != null ? !institucion2.equals(persona.institucion2) : persona.institucion2 != null)
			return false;
		if (institucion3 != null ? !institucion3.equals(persona.institucion3) : persona.institucion3 != null)
			return false;
		if (quienApoya != null ? !quienApoya.equals(persona.quienApoya) : persona.quienApoya != null) return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = asignatura1 != null ? asignatura1.hashCode() : 0;
		result = 31 * result + (deseaEstudioTecnico != null ? deseaEstudioTecnico.hashCode() : 0);
		result = 31 * result + (carrera1 != null ? carrera1.hashCode() : 0);
		result = 31 * result + (carrera2 != null ? carrera2.hashCode() : 0);
		result = 31 * result + (carrera3 != null ? carrera3.hashCode() : 0);
		result = 31 * result + (institucion1 != null ? institucion1.hashCode() : 0);
		result = 31 * result + (institucion2 != null ? institucion2.hashCode() : 0);
		result = 31 * result + (institucion3 != null ? institucion3.hashCode() : 0);
		result = 31 * result + (quienApoya != null ? quienApoya.hashCode() : 0);
		result = 31 * result + (formaPago != null ? formaPago.hashCode() : 0);
		return result;
	}
}
