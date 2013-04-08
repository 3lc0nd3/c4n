package co.com.elramireza.motta.model;

import co.com.elramireza.pn.model.Empleado;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Nov 8, 2012
 * Time: 8:41:09 PM
 */
@Entity
@Table(name = "t01_im_resultado")
public class T01ImResultado {
    private int id;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    private int aVL;

    @Basic
    @Column(name = "a_v_l")
    public int getAVL() {
        return aVL;
    }

    public void setAVL(int aVL) {
        this.aVL = aVL;
    }

    private int bLM;

    @Basic
    @Column(name = "b_l_m")
    public int getBLM() {
        return bLM;
    }

    public void setBLM(int bLM) {
        this.bLM = bLM;
    }

    private int cVE;

    @Basic
    @Column(name = "c_v_e")
    public int getCVE() {
        return cVE;
    }

    public void setCVE(int cVE) {
        this.cVE = cVE;
    }

    private int dKC;

    @Basic
    @Column(name = "d_k_c")
    public int getDKC() {
        return dKC;
    }

    public void setDKC(int dKC) {
        this.dKC = dKC;
    }

    private int eMR;

    @Basic
    @Column(name = "e_m_r")
    public int getEMR() {
        return eMR;
    }

    public void setEMR(int eMR) {
        this.eMR = eMR;
    }

    private int fIntrapersonal;

    @Basic
    @Column(name = "f_intrapersonal")
    public int getFIntrapersonal() {
        return fIntrapersonal;
    }

    public void setFIntrapersonal(int fIntrapersonal) {
        this.fIntrapersonal = fIntrapersonal;
    }

    private int gInterpersonal;

    @Basic
    @Column(name = "g_interpersonal")
    public int getGInterpersonal() {
        return gInterpersonal;
    }

    public void setGInterpersonal(int gInterpersonal) {
        this.gInterpersonal = gInterpersonal;
    }

    private int hNaturista;

    @Basic
    @Column(name = "h_naturista")
    public int getHNaturista() {
        return hNaturista;
    }

    public void setHNaturista(int hNaturista) {
        this.hNaturista = hNaturista;
    }

    private Date fechaResultado;

    @Basic
    @Column(name = "fecha_resultado")
    public Date getFechaResultado() {
        return fechaResultado;
    }

    public void setFechaResultado(Date fechaResultado) {
        this.fechaResultado = fechaResultado;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        T01ImResultado that = (T01ImResultado) o;

        if (aVL != that.aVL) return false;
        if (bLM != that.bLM) return false;
        if (cVE != that.cVE) return false;
        if (dKC != that.dKC) return false;
        if (eMR != that.eMR) return false;
        if (fIntrapersonal != that.fIntrapersonal) return false;
        if (gInterpersonal != that.gInterpersonal) return false;
        if (hNaturista != that.hNaturista) return false;
        if (id != that.id) return false;
        if (fechaResultado != null ? !fechaResultado.equals(that.fechaResultado) : that.fechaResultado != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + aVL;
        result = 31 * result + bLM;
        result = 31 * result + cVE;
        result = 31 * result + dKC;
        result = 31 * result + eMR;
        result = 31 * result + fIntrapersonal;
        result = 31 * result + gInterpersonal;
        result = 31 * result + hNaturista;
        result = 31 * result + (fechaResultado != null ? fechaResultado.hashCode() : 0);
        return result;
    }
}
