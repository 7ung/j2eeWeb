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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "development_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DevelopmentType.findAll", query = "SELECT d FROM DevelopmentType d"),
    @NamedQuery(name = "DevelopmentType.findById", query = "SELECT d FROM DevelopmentType d WHERE d.id = :id"),
    @NamedQuery(name = "DevelopmentType.findByCode", query = "SELECT d FROM DevelopmentType d WHERE d.code = :code"),
    @NamedQuery(name = "DevelopmentType.findByName", query = "SELECT d FROM DevelopmentType d WHERE d.name = :name"),
    @NamedQuery(name = "DevelopmentType.findByDescription", query = "SELECT d FROM DevelopmentType d WHERE d.description = :description")})
public class DevelopmentType implements Serializable {
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
    @JoinTable(name = "user_dev_type", joinColumns = {
        @JoinColumn(name = "development_type_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "user_id", referencedColumnName = "id")})
    @ManyToMany
    private Collection<User> userCollection;
    @OneToMany(mappedBy = "developmentTypeId")
    private Collection<SeekingJob> seekingJobCollection;

    public DevelopmentType() {
    }

    public DevelopmentType(Integer id) {
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
    public Collection<User> getUserCollection() {
        return userCollection;
    }

    public void setUserCollection(Collection<User> userCollection) {
        this.userCollection = userCollection;
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
        if (!(object instanceof DevelopmentType)) {
            return false;
        }
        DevelopmentType other = (DevelopmentType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.DevelopmentType[ id=" + id + " ]";
    }
    
}
