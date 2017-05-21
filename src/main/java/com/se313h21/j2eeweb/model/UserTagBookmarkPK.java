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
public class UserTagBookmarkPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_id")
    private int userId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tag_id")
    private int tagId;

    public UserTagBookmarkPK() {
    }

    public UserTagBookmarkPK(int userId, int tagId) {
        this.userId = userId;
        this.tagId = tagId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) userId;
        hash += (int) tagId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserTagBookmarkPK)) {
            return false;
        }
        UserTagBookmarkPK other = (UserTagBookmarkPK) object;
        if (this.userId != other.userId) {
            return false;
        }
        if (this.tagId != other.tagId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.UserTagBookmarkPK[ userId=" + userId + ", tagId=" + tagId + " ]";
    }
    
}
