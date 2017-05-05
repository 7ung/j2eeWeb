/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "seeking_job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SeekingJob.findAll", query = "SELECT s FROM SeekingJob s"),
    @NamedQuery(name = "SeekingJob.findById", query = "SELECT s FROM SeekingJob s WHERE s.id = :id"),
    @NamedQuery(name = "SeekingJob.findByLocation", query = "SELECT s FROM SeekingJob s WHERE s.location = :location"),
    @NamedQuery(name = "SeekingJob.findByMinSalary", query = "SELECT s FROM SeekingJob s WHERE s.minSalary = :minSalary"),
    @NamedQuery(name = "SeekingJob.findByMaxSalary", query = "SELECT s FROM SeekingJob s WHERE s.maxSalary = :maxSalary"),
    @NamedQuery(name = "SeekingJob.findByIsActive", query = "SELECT s FROM SeekingJob s WHERE s.isActive = :isActive"),
    @NamedQuery(name = "SeekingJob.findByView", query = "SELECT s FROM SeekingJob s WHERE s.view = :view"),
    @NamedQuery(name = "SeekingJob.findByCreateDate", query = "SELECT s FROM SeekingJob s WHERE s.createDate = :createDate")})

public class SeekingJob implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Size(max = 256)
    private String location;
    @Column(name = "min_salary")
    private Integer minSalary;
    @Column(name = "max_salary")
    private Integer maxSalary;
    @Column(name = "is_active")
    private Boolean isActive;
    private Integer view;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "create_date")
    private Double createDate;
    @JoinColumn(name = "development_type_id", referencedColumnName = "id")
    @ManyToOne
    private DevelopmentType developmentTypeId;
    @JoinColumn(name = "seniority_id", referencedColumnName = "id")
    @ManyToOne
    private Seniority seniorityId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private User userId;

    public SeekingJob() {
    }

    public SeekingJob(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(Integer minSalary) {
        this.minSalary = minSalary;
    }

    public Integer getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(Integer maxSalary) {
        this.maxSalary = maxSalary;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public Double getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Double createDate) {
        this.createDate = createDate;
    }

    public DevelopmentType getDevelopmentTypeId() {
        return developmentTypeId;
    }

    public void setDevelopmentTypeId(DevelopmentType developmentTypeId) {
        this.developmentTypeId = developmentTypeId;
    }

    public Seniority getSeniorityId() {
        return seniorityId;
    }

    public void setSeniorityId(Seniority seniorityId) {
        this.seniorityId = seniorityId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof SeekingJob)) {
            return false;
        }
        SeekingJob other = (SeekingJob) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.SeekingJob[ id=" + id + " ]";
    }
    
}
