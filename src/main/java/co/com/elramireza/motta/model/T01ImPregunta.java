package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 4, 2012
 * Time: 10:54:07 AM
 */
@Entity
@Table(name = "t01_im_pregunta")
public class T01ImPregunta {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String pregunta;

    @Basic
    @Column(name = "pregunta")
    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T01ImPregunta that = (T01ImPregunta) o;

        if (id != that.id) return false;
        if (pregunta != null ? !pregunta.equals(that.pregunta) : that.pregunta != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (pregunta != null ? pregunta.hashCode() : 0);
        return result;
    }
}
