package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 5, 2012
 * Time: 11:49:33 PM
 */
@Entity
@Table(name = "t02_vh_pregunta")
public class T02VhPregunta {
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

        T02VhPregunta that = (T02VhPregunta) o;

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

    private T02VhSeccion t02VhSeccionByIdSeccion;

    @ManyToOne
    @JoinColumn(name = "id_seccion", referencedColumnName = "id", nullable = false)
    public T02VhSeccion getT02VhSeccionByIdSeccion() {
        return t02VhSeccionByIdSeccion;
    }

    public void setT02VhSeccionByIdSeccion(T02VhSeccion t02VhSeccionByIdSeccion) {
        this.t02VhSeccionByIdSeccion = t02VhSeccionByIdSeccion;
    }

    private T02VhCategoria t02VhCategoriaByIdCategoria;

    @ManyToOne
    @JoinColumn(name = "id_categoria", referencedColumnName = "id", nullable = false)
    public T02VhCategoria getT02VhCategoriaByIdCategoria() {
        return t02VhCategoriaByIdCategoria;
    }

    public void setT02VhCategoriaByIdCategoria(T02VhCategoria t02VhCategoriaByIdCategoria) {
        this.t02VhCategoriaByIdCategoria = t02VhCategoriaByIdCategoria;
    }
}
