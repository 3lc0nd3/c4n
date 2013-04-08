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
@Table(catalog = "motta", name = "t02_vh_nivel_educativo")
public class T02VhNivelEducativo {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String nivel;

    @Basic
    @Column(name = "nivel")
    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T02VhNivelEducativo that = (T02VhNivelEducativo) o;

        if (id != that.id) return false;
        if (nivel != null ? !nivel.equals(that.nivel) : that.nivel != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nivel != null ? nivel.hashCode() : 0);
        return result;
    }
}
