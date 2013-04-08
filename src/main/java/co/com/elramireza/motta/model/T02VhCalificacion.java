package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 11, 2012
 * Time: 11:35:34 AM
 */
@Entity
@Table(catalog = "motta", name = "t02_vh_calificacion")
public class T02VhCalificacion {
    private String id;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    private int idParticipante;

    @Basic
    @Column(name = "id_participante")
    public int getIdParticipante() {
        return idParticipante;
    }

    public void setIdParticipante(int idParticipante) {
        this.idParticipante = idParticipante;
    }

    private String seccion;

    @Basic
    @Column(name = "seccion")
    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    private String categoria;

    @Basic
    @Column(name = "categoria")
    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    private long resultado;

    @Basic
    @Column(name = "resultado")
    public long getResultado() {
        return resultado;
    }

    public void setResultado(long resultado) {
        this.resultado = resultado;
    }

    private int idSeccion;

    @Basic
    @Column(name = "id_seccion")
    public int getIdSeccion() {
        return idSeccion;
    }

    public void setIdSeccion(int idSeccion) {
        this.idSeccion = idSeccion;
    }

    private int idCategoria;

    @Basic
    @Column(name = "id_categoria")
    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T02VhCalificacion that = (T02VhCalificacion) o;

        if (idCategoria != that.idCategoria) return false;
        if (idParticipante != that.idParticipante) return false;
        if (idSeccion != that.idSeccion) return false;
        if (resultado != that.resultado) return false;
        if (categoria != null ? !categoria.equals(that.categoria) : that.categoria != null) return false;
        if (seccion != null ? !seccion.equals(that.seccion) : that.seccion != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idParticipante;
        result = 31 * result + (seccion != null ? seccion.hashCode() : 0);
        result = 31 * result + (categoria != null ? categoria.hashCode() : 0);
        result = 31 * result + (int) (resultado ^ (resultado >>> 32));
        result = 31 * result + idSeccion;
        result = 31 * result + idCategoria;
        return result;
    }
}
