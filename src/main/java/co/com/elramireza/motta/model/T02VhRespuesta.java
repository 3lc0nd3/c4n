package co.com.elramireza.motta.model;

import co.com.elramireza.pn.model.Empleado;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 5, 2012
 * Time: 11:49:34 PM
 */
@Entity
@Table(name = "t02_vh_respuesta")
public class T02VhRespuesta {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int valor;

    @Basic
    @Column(name = "valor")
    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    private Timestamp fechaRespuesta;

    @Basic
    @Column(name = "fecha_respuesta")
    public Timestamp getFechaRespuesta() {
        return fechaRespuesta;
    }

    public void setFechaRespuesta(Timestamp fechaRespuesta) {
        this.fechaRespuesta = fechaRespuesta;
    }

    private T02VhPregunta t02VhPreguntaByIdPregunta;

    @ManyToOne
    @JoinColumn(name = "id_pregunta", referencedColumnName = "id", nullable = false)
    public T02VhPregunta getT02VhPreguntaByIdPregunta() {
        return t02VhPreguntaByIdPregunta;
    }

    public void setT02VhPreguntaByIdPregunta(T02VhPregunta t02VhPreguntaByIdPregunta) {
        this.t02VhPreguntaByIdPregunta = t02VhPreguntaByIdPregunta;
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
