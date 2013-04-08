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
 * Time: 05:40:44 PM
 */
@Entity
@Table(name = "empresa")
public class Empresa {
    private int idEmpresa;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    private String nombreEmpresa;

    @Basic
    @Column(name = "nombre")
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    private int locCiudadEmpresa;

    @Transient
    public int getLocCiudadEmpresa() {
        return locCiudadEmpresa;
    }

    public void setLocCiudadEmpresa(int locCiudadEmpresa) {
        this.locCiudadEmpresa = locCiudadEmpresa;
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

    private int tipoEmpresa;

    @Transient
    public int getTipoEmpresa() {
        return tipoEmpresa;
    }

    public void setTipoEmpresa(int tipoEmpresa) {
        this.tipoEmpresa = tipoEmpresa;
    }

    private TipoEmpresa tipoEmpresaByIdTipoEmpresa;

    @ManyToOne
    @JoinColumn(name = "id_tipo_empresa", referencedColumnName = "id", nullable = false)
    public TipoEmpresa getTipoEmpresaByIdTipoEmpresa() {
        return tipoEmpresaByIdTipoEmpresa;
    }

    public void setTipoEmpresaByIdTipoEmpresa(TipoEmpresa tipoEmpresaByIdTipoEmpresa) {
        this.tipoEmpresaByIdTipoEmpresa = tipoEmpresaByIdTipoEmpresa;
    }

    private String nit;

    @Basic
    @Column(name = "nit")
    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    private String direccionEmpresa;

    @Basic
    @Column(name = "direccion")
    public String getDireccionEmpresa() {
        return direccionEmpresa;
    }

    public void setDireccionEmpresa(String direccionEmpresa) {
        this.direccionEmpresa = direccionEmpresa;
    }

    private String telFijoEmpresa;

    @Basic
    @Column(name = "tel_fijo")
    public String getTelFijoEmpresa() {
        return telFijoEmpresa;
    }

    public void setTelFijoEmpresa(String telFijoEmpresa) {
        this.telFijoEmpresa = telFijoEmpresa;
    }

    private String telMovilEmpresa;

    @Basic
    @Column(name = "tel_movil")
    public String getTelMovilEmpresa() {
        return telMovilEmpresa;
    }

    public void setTelMovilEmpresa(String telMovilEmpresa) {
        this.telMovilEmpresa = telMovilEmpresa;
    }

    private String webEmpresa;

    @Basic
    @Column(name = "web")
    public String getWebEmpresa() {
        return webEmpresa;
    }

    public void setWebEmpresa(String webEmpresa) {
        this.webEmpresa = webEmpresa;
    }

    private String emailEmpresa;

    @Basic
    @Column(name = "email")
    public String getEmailEmpresa() {
        return emailEmpresa;
    }

    public void setEmailEmpresa(String emailEmpresa) {
        this.emailEmpresa = emailEmpresa;
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

    private Timestamp fechaCreacion;

    @Basic
    @Column(name = "fecha_creacion")
    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    private int idEmpresaCategoriaTamano;

    @Transient
    public int getIdEmpresaCategoriaTamano() {
        return idEmpresaCategoriaTamano;
    }

    public void setIdEmpresaCategoriaTamano(int idEmpresaCategoriaTamano) {
        this.idEmpresaCategoriaTamano = idEmpresaCategoriaTamano;
    }

    private EmpresaCategoriaTamano empresaCategoriaTamanoByIdCategoriaTamanoEmpresa;

    @ManyToOne
    @JoinColumn(name = "id_categoria_tamano_empresa", referencedColumnName = "id", nullable = false)
    public EmpresaCategoriaTamano getEmpresaCategoriaTamanoByIdCategoriaTamanoEmpresa() {
        return empresaCategoriaTamanoByIdCategoriaTamanoEmpresa;
    }

    public void setEmpresaCategoriaTamanoByIdCategoriaTamanoEmpresa(EmpresaCategoriaTamano empresaCategoriaTamanoByIdCategoriaTamanoEmpresa) {
        this.empresaCategoriaTamanoByIdCategoriaTamanoEmpresa = empresaCategoriaTamanoByIdCategoriaTamanoEmpresa;
    }

    private int idEmpresaCategoria;

    @Transient
    public int getIdEmpresaCategoria() {
        return idEmpresaCategoria;
    }

    public void setIdEmpresaCategoria(int idEmpresaCategoria) {
        this.idEmpresaCategoria = idEmpresaCategoria;
    }

    private EmpresaCategoria empresaCategoriaByIdCategoriaEmpresa;

    @ManyToOne
    @JoinColumn(name = "id_categoria_empresa", referencedColumnName = "id", nullable = false)
    public EmpresaCategoria getEmpresaCategoriaByIdCategoriaEmpresa() {
        return empresaCategoriaByIdCategoriaEmpresa;
    }

    public void setEmpresaCategoriaByIdCategoriaEmpresa(EmpresaCategoria empresaCategoriaByIdCategoriaEmpresa) {
        this.empresaCategoriaByIdCategoriaEmpresa = empresaCategoriaByIdCategoriaEmpresa;
    }

}
