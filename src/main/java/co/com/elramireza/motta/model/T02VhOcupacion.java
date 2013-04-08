package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 11, 2012
 * Time: 10:55:38 PM
 */
@Entity
@Table(catalog = "motta", name = "t02_vh_ocupacion")
public class T02VhOcupacion {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String ocupacion;

    @Basic
    @Column(name = "ocupacion")
    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T02VhOcupacion that = (T02VhOcupacion) o;

        if (id != that.id) return false;
        if (ocupacion != null ? !ocupacion.equals(that.ocupacion) : that.ocupacion != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (ocupacion != null ? ocupacion.hashCode() : 0);
        return result;
    }
}
