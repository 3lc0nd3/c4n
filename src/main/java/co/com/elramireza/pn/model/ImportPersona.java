package co.com.elramireza.pn.model;

import javax.persistence.*;

/**
 * Created with Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: 4/7/13
 * Time: 2:58 AM
 * To change this template use File | Settings | File Templates.
 */
@Table(name = "import_persona")
@Entity
public class ImportPersona {
    private int id;

    @Column(name = "id")
    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private int lista;

    @Column(name = "lista")
    @Basic
    public int getLista() {
        return lista;
    }

    public void setLista(int lista) {
        this.lista = lista;
    }

    private String nombres;

    @Column(name = "nombres")
    @Basic
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    private String doc;

    @Column(name = "doc")
    @Basic
    public String getDoc() {
        return doc;
    }

    public void setDoc(String doc) {
        this.doc = doc;
    }

    private String jornada;

    @Column(name = "jornada")
    @Basic
    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    private String especialidad;

    @Column(name = "especialidad")
    @Basic
    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    private String curso;

    @Column(name = "curso")
    @Basic
    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    private int estado;

    @Basic
    @Column(name = "estado")
    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
