/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "user_post_bookmark")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserPostBookmark.findAll", query = "SELECT u FROM UserPostBookmark u"),
    @NamedQuery(name = "UserPostBookmark.findByUserId", query = "SELECT u FROM UserPostBookmark u WHERE u.userPostBookmarkPK.userId = :userId"),
    @NamedQuery(name = "UserPostBookmark.findByPostId", query = "SELECT u FROM UserPostBookmark u WHERE u.userPostBookmarkPK.postId = :postId"),
    @NamedQuery(name = "UserPostBookmark.findByDate", query = "SELECT u FROM UserPostBookmark u WHERE u.date = :date"),
    @NamedQuery(name = "UserPostBookmark.findByNote", query = "SELECT u FROM UserPostBookmark u WHERE u.note = :note")})
public class UserPostBookmark implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserPostBookmarkPK userPostBookmarkPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1024)
    @Column(name = "note")
    private String note;
    @JoinColumn(name = "post_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Post post;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public UserPostBookmark() {
    }

    public UserPostBookmark(UserPostBookmarkPK userPostBookmarkPK) {
        this.userPostBookmarkPK = userPostBookmarkPK;
    }

    public UserPostBookmark(UserPostBookmarkPK userPostBookmarkPK, Date date, String note) {
        this.userPostBookmarkPK = userPostBookmarkPK;
        this.date = date;
        this.note = note;
    }

    public UserPostBookmark(int userId, int postId) {
        this.userPostBookmarkPK = new UserPostBookmarkPK(userId, postId);
    }

    public UserPostBookmarkPK getUserPostBookmarkPK() {
        return userPostBookmarkPK;
    }

    public void setUserPostBookmarkPK(UserPostBookmarkPK userPostBookmarkPK) {
        this.userPostBookmarkPK = userPostBookmarkPK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
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
        hash += (userPostBookmarkPK != null ? userPostBookmarkPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserPostBookmark)) {
            return false;
        }
        UserPostBookmark other = (UserPostBookmark) object;
        if ((this.userPostBookmarkPK == null && other.userPostBookmarkPK != null) || (this.userPostBookmarkPK != null && !this.userPostBookmarkPK.equals(other.userPostBookmarkPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserPostBookmark[ userPostBookmarkPK=" + userPostBookmarkPK + " ]";
    }
    
}
