package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 5, 2012
 * Time: 11:49:34 PM
 */
@Entity
@Table(name = "t02_vh_seccion")
public class T02VhSeccion {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    private String texto;

    @Basic
    @Column(name = "texto")
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T02VhSeccion that = (T02VhSeccion) o;

        if (id != that.id) return false;
        if (seccion != null ? !seccion.equals(that.seccion) : that.seccion != null) return false;
        if (texto != null ? !texto.equals(that.texto) : that.texto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (seccion != null ? seccion.hashCode() : 0);
        result = 31 * result + (texto != null ? texto.hashCode() : 0);
        return result;
    }
}
