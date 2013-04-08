package co.com.elramireza.motta.model;

import javax.persistence.*;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 11, 2012
 * Time: 10:55:36 PM
 */
@Entity
@Table(catalog = "motta", name = "t02_vh_carrera")
public class T02VhCarrera {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String carrera;

    @Basic
    @Column(name = "carrera")
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    private T02VhNivelEducativo t02VhNivelEducativoByIdNivelEducativo;

    @ManyToOne
    @JoinColumn(name = "id_nivel_educativo", referencedColumnName = "id", nullable = false)
    public T02VhNivelEducativo getT02VhNivelEducativoByIdNivelEducativo() {
        return t02VhNivelEducativoByIdNivelEducativo;
    }

    public void setT02VhNivelEducativoByIdNivelEducativo(T02VhNivelEducativo t02VhNivelEducativoByIdNivelEducativo) {
        this.t02VhNivelEducativoByIdNivelEducativo = t02VhNivelEducativoByIdNivelEducativo;
    }

    private T02VhOcupacion t02VhOcupacionByIdOcupacion;

    @ManyToOne
    @JoinColumn(name = "id_ocupacion", referencedColumnName = "id", nullable = false)
    public T02VhOcupacion getT02VhOcupacionByIdOcupacion() {
        return t02VhOcupacionByIdOcupacion;
    }

    public void setT02VhOcupacionByIdOcupacion(T02VhOcupacion t02VhOcupacionByIdOcupacion) {
        this.t02VhOcupacionByIdOcupacion = t02VhOcupacionByIdOcupacion;
    }

    private T02VhCategoria t02VhCategoriaByIdCategoria2;

    @ManyToOne
    @JoinColumn(name = "id_categoria_2", referencedColumnName = "id", nullable = false)
    public T02VhCategoria getT02VhCategoriaByIdCategoria2() {
        return t02VhCategoriaByIdCategoria2;
    }

    public void setT02VhCategoriaByIdCategoria2(T02VhCategoria t02VhCategoriaByIdCategoria2) {
        this.t02VhCategoriaByIdCategoria2 = t02VhCategoriaByIdCategoria2;
    }

    private T02VhCategoria t02VhCategoriaByIdCategoria1;

    @ManyToOne
    @JoinColumn(name = "id_categoria_1", referencedColumnName = "id", nullable = false)
    public T02VhCategoria getT02VhCategoriaByIdCategoria1() {
        return t02VhCategoriaByIdCategoria1;
    }

    public void setT02VhCategoriaByIdCategoria1(T02VhCategoria t02VhCategoriaByIdCategoria1) {
        this.t02VhCategoriaByIdCategoria1 = t02VhCategoriaByIdCategoria1;
    }
}
