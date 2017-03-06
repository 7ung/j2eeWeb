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
@Table(name = "user_tag_bookmark")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserTagBookmark.findAll", query = "SELECT u FROM UserTagBookmark u"),
    @NamedQuery(name = "UserTagBookmark.findByUserId", query = "SELECT u FROM UserTagBookmark u WHERE u.userTagBookmarkPK.userId = :userId"),
    @NamedQuery(name = "UserTagBookmark.findByTagId", query = "SELECT u FROM UserTagBookmark u WHERE u.userTagBookmarkPK.tagId = :tagId"),
    @NamedQuery(name = "UserTagBookmark.findByDate", query = "SELECT u FROM UserTagBookmark u WHERE u.date = :date")})
public class UserTagBookmark implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserTagBookmarkPK userTagBookmarkPK;
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @JoinColumn(name = "tag_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Tag tag;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserTagBookmark() {
    }

    public UserTagBookmark(UserTagBookmarkPK userTagBookmarkPK) {
        this.userTagBookmarkPK = userTagBookmarkPK;
    }

    public UserTagBookmark(int userId, int tagId) {
        this.userTagBookmarkPK = new UserTagBookmarkPK(userId, tagId);
    }

    public UserTagBookmarkPK getUserTagBookmarkPK() {
        return userTagBookmarkPK;
    }

    public void setUserTagBookmarkPK(UserTagBookmarkPK userTagBookmarkPK) {
        this.userTagBookmarkPK = userTagBookmarkPK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
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
        hash += (userTagBookmarkPK != null ? userTagBookmarkPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserTagBookmark)) {
            return false;
        }
        UserTagBookmark other = (UserTagBookmark) object;
        if ((this.userTagBookmarkPK == null && other.userTagBookmarkPK != null) || (this.userTagBookmarkPK != null && !this.userTagBookmarkPK.equals(other.userTagBookmarkPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserTagBookmark[ userTagBookmarkPK=" + userTagBookmarkPK + " ]";
    }
    
}
