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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "user_work")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserWork.findAll", query = "SELECT u FROM UserWork u"),
    @NamedQuery(name = "UserWork.findByUserId", query = "SELECT u FROM UserWork u WHERE u.userWorkPK.userId = :userId"),
    @NamedQuery(name = "UserWork.findByWorkId", query = "SELECT u FROM UserWork u WHERE u.userWorkPK.workId = :workId"),
    @NamedQuery(name = "UserWork.findByStartDate", query = "SELECT u FROM UserWork u WHERE u.startDate = :startDate"),
    @NamedQuery(name = "UserWork.findByEndDate", query = "SELECT u FROM UserWork u WHERE u.endDate = :endDate"),
    @NamedQuery(name = "UserWork.findByRole", query = "SELECT u FROM UserWork u WHERE u.role = :role")})
public class UserWork implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserWorkPK userWorkPK;
    @Column(name = "start_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    @Column(name = "end_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    @Size(max = 128)
    @Column(name = "role")
    private String role;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "work_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Work work;

    public UserWork() {
    }

    public UserWork(UserWorkPK userWorkPK) {
        this.userWorkPK = userWorkPK;
    }

    public UserWork(int userId, int workId) {
        this.userWorkPK = new UserWorkPK(userId, workId);
    }

    public UserWorkPK getUserWorkPK() {
        return userWorkPK;
    }

    public void setUserWorkPK(UserWorkPK userWorkPK) {
        this.userWorkPK = userWorkPK;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Work getWork() {
        return work;
    }

    public void setWork(Work work) {
        this.work = work;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userWorkPK != null ? userWorkPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserWork)) {
            return false;
        }
        UserWork other = (UserWork) object;
        if ((this.userWorkPK == null && other.userWorkPK != null) || (this.userWorkPK != null && !this.userWorkPK.equals(other.userWorkPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserWork[ userWorkPK=" + userWorkPK + " ]";
    }
    
}
