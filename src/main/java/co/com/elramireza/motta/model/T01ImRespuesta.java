package co.com.elramireza.motta.model;

import co.com.elramireza.pn.model.Empleado;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 4, 2012
 * Time: 10:54:08 AM
 */
@Entity
@Table(name = "t01_im_respuesta")
public class T01ImRespuesta {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    private T01ImPregunta t01ImPreguntaByIdPregunta;

    @ManyToOne
    @JoinColumn(name = "id_pregunta", referencedColumnName = "id", nullable = false)
    public T01ImPregunta getT01ImPreguntaByIdPregunta() {
        return t01ImPreguntaByIdPregunta;
    }

    public void setT01ImPreguntaByIdPregunta(T01ImPregunta t01ImPreguntaByIdPregunta) {
        this.t01ImPreguntaByIdPregunta = t01ImPreguntaByIdPregunta;
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

    public int valor;

    @Basic
    @Column(name = "valor")
    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
}
