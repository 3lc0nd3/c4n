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
@Table(name = "t02_vh_calificacion")
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

    private int idEmpleado;

    @Basic
    @Column(name = "id_empleado")
    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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

}
