/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "user_seeking_job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserSeekingJob.findAll", query = "SELECT u FROM UserSeekingJob u"),
    @NamedQuery(name = "UserSeekingJob.findByUserId", query = "SELECT u FROM UserSeekingJob u WHERE u.userSeekingJobPK.userId = :userId"),
    @NamedQuery(name = "UserSeekingJob.findBySeekingJobId", query = "SELECT u FROM UserSeekingJob u WHERE u.userSeekingJobPK.seekingJobId = :seekingJobId"),
    @NamedQuery(name = "UserSeekingJob.findByCreateDate", query = "SELECT u FROM UserSeekingJob u WHERE u.createDate = :createDate"),
    @NamedQuery(name = "UserSeekingJob.findByView", query = "SELECT u FROM UserSeekingJob u WHERE u.view = :view")})
public class UserSeekingJob implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserSeekingJobPK userSeekingJobPK;
    @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "view")
    private Integer view;
    @JoinColumn(name = "seeking_job_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private SeekingJob seekingJob;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserSeekingJob() {
    }

    public UserSeekingJob(UserSeekingJobPK userSeekingJobPK) {
        this.userSeekingJobPK = userSeekingJobPK;
    }

    public UserSeekingJob(int userId, int seekingJobId) {
        this.userSeekingJobPK = new UserSeekingJobPK(userId, seekingJobId);
    }

    public UserSeekingJobPK getUserSeekingJobPK() {
        return userSeekingJobPK;
    }

    public void setUserSeekingJobPK(UserSeekingJobPK userSeekingJobPK) {
        this.userSeekingJobPK = userSeekingJobPK;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public SeekingJob getSeekingJob() {
        return seekingJob;
    }

    public void setSeekingJob(SeekingJob seekingJob) {
        this.seekingJob = seekingJob;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userSeekingJobPK != null ? userSeekingJobPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserSeekingJob)) {
            return false;
        }
        UserSeekingJob other = (UserSeekingJob) object;
        if ((this.userSeekingJobPK == null && other.userSeekingJobPK != null) || (this.userSeekingJobPK != null && !this.userSeekingJobPK.equals(other.userSeekingJobPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserSeekingJob[ userSeekingJobPK=" + userSeekingJobPK + " ]";
    }
    
}
