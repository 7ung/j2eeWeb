/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Stevie
 */
@Embeddable
public class UserPostBookmarkPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_id")
    private int userId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "post_id")
    private int postId;

    public UserPostBookmarkPK() {
    }

    public UserPostBookmarkPK(int userId, int postId) {
        this.userId = userId;
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userId;
        hash += (int) postId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserPostBookmarkPK)) {
            return false;
        }
        UserPostBookmarkPK other = (UserPostBookmarkPK) object;
        if (this.userId != other.userId) {
            return false;
        }
        if (this.postId != other.postId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserPostBookmarkPK[ userId=" + userId + ", postId=" + postId + " ]";
    }
    
}
