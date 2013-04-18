package co.com.elramireza.pn.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created with Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: 4/18/13
 * Time: 12:47 AM
 * To change this template use File | Settings | File Templates.
 */
@javax.persistence.Table(name = "t02_vh_resultado2", schema = "", catalog = "c4n")
@Entity
public class T02VhResultado2 {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private long r;

    @javax.persistence.Column(name = "R")
    @Basic
    public long getR() {
        return r;
    }

    public void setR(long r) {
        this.r = r;
    }

    private long i;

    @javax.persistence.Column(name = "I")
    @Basic
    public long getI() {
        return i;
    }

    public void setI(long i) {
        this.i = i;
    }

    private long a;

    @javax.persistence.Column(name = "A")
    @Basic
    public long getA() {
        return a;
    }

    public void setA(long a) {
        this.a = a;
    }

    private long s;

    @javax.persistence.Column(name = "S")
    @Basic
    public long getS() {
        return s;
    }

    public void setS(long s) {
        this.s = s;
    }

    private long e;

    @javax.persistence.Column(name = "E")
    @Basic
    public long getE() {
        return e;
    }

    public void setE(long e) {
        this.e = e;
    }

    private long c;

    @javax.persistence.Column(name = "C")
    @Basic
    public long getC() {
        return c;
    }

    public void setC(long c) {
        this.c = c;
    }

    private Timestamp fechaRespuesta;

    @javax.persistence.Column(name = "fecha_respuesta")
    @Basic
    public Timestamp getFechaRespuesta() {
        return fechaRespuesta;
    }

    public void setFechaRespuesta(Timestamp fechaRespuesta) {
        this.fechaRespuesta = fechaRespuesta;
    }

    private Empleado empleadoByIdEmpleado;
    @ManyToOne
    @JoinColumn(name = "id_empleado", referencedColumnName = "id", nullable = false)
    public Empleado getEmpleadoByIdEmpleado() {
        return empleadoByIdEmpleado;
    }

    public void setEmpleadoByIdEmpleado(Empleado empleadoByIdEmpleado) {
        this.empleadoByIdEmpleado = empleadoByIdEmpleado;
    }
}
