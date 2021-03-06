/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Stevie
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seniority.findAll", query = "SELECT s FROM Seniority s"),
    @NamedQuery(name = "Seniority.findById", query = "SELECT s FROM Seniority s WHERE s.id = :id"),
    @NamedQuery(name = "Seniority.findByCode", query = "SELECT s FROM Seniority s WHERE s.code = :code"),
    @NamedQuery(name = "Seniority.findByName", query = "SELECT s FROM Seniority s WHERE s.name = :name"),
    @NamedQuery(name = "Seniority.findByDescription", query = "SELECT s FROM Seniority s WHERE s.description = :description")})
public class Seniority implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Size(max = 64)
    private String code;
    @Size(max = 128)
    private String name;
    @Size(max = 256)
    private String description;
    @OneToMany(mappedBy = "seniorityId")
    private Collection<SeekingJob> seekingJobCollection;

    public Seniority() {
    }

    public Seniority(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<SeekingJob> getSeekingJobCollection() {
        return seekingJobCollection;
    }

    public void setSeekingJobCollection(Collection<SeekingJob> seekingJobCollection) {
        this.seekingJobCollection = seekingJobCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seniority)) {
            return false;
        }
        Seniority other = (Seniority) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.Seniority[ id=" + id + " ]";
    }
    
}
