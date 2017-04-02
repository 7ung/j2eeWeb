/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "user_subject_bookmark")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserSubjectBookmark.findAll", query = "SELECT u FROM UserSubjectBookmark u"),
    @NamedQuery(name = "UserSubjectBookmark.findByUserId", query = "SELECT u FROM UserSubjectBookmark u WHERE u.userSubjectBookmarkPK.userId = :userId"),
    @NamedQuery(name = "UserSubjectBookmark.findBySubjectId", query = "SELECT u FROM UserSubjectBookmark u WHERE u.userSubjectBookmarkPK.subjectId = :subjectId"),
    @NamedQuery(name = "UserSubjectBookmark.findByDate", query = "SELECT u FROM UserSubjectBookmark u WHERE u.date = :date")})
public class UserSubjectBookmark implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserSubjectBookmarkPK userSubjectBookmarkPK;
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "subject_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Subject subject;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserSubjectBookmark() {
    }

    public UserSubjectBookmark(UserSubjectBookmarkPK userSubjectBookmarkPK) {
        this.userSubjectBookmarkPK = userSubjectBookmarkPK;
    }

    public UserSubjectBookmark(int userId, int subjectId) {
        this.userSubjectBookmarkPK = new UserSubjectBookmarkPK(userId, subjectId);
    }

    public UserSubjectBookmarkPK getUserSubjectBookmarkPK() {
        return userSubjectBookmarkPK;
    }

    public void setUserSubjectBookmarkPK(UserSubjectBookmarkPK userSubjectBookmarkPK) {
        this.userSubjectBookmarkPK = userSubjectBookmarkPK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
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
        hash += (userSubjectBookmarkPK != null ? userSubjectBookmarkPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserSubjectBookmark)) {
            return false;
        }
        UserSubjectBookmark other = (UserSubjectBookmark) object;
        if ((this.userSubjectBookmarkPK == null && other.userSubjectBookmarkPK != null) || (this.userSubjectBookmarkPK != null && !this.userSubjectBookmarkPK.equals(other.userSubjectBookmarkPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserSubjectBookmark[ userSubjectBookmarkPK=" + userSubjectBookmarkPK + " ]";
    }
    
}
