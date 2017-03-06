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
public class PostImagePK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "post_id")
    private int postId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "image_id")
    private int imageId;

    public PostImagePK() {
    }

    public PostImagePK(int postId, int imageId) {
        this.postId = postId;
        this.imageId = imageId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) postId;
        hash += (int) imageId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PostImagePK)) {
            return false;
        }
        PostImagePK other = (PostImagePK) object;
        if (this.postId != other.postId) {
            return false;
        }
        if (this.imageId != other.imageId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.PostImagePK[ postId=" + postId + ", imageId=" + imageId + " ]";
    }
    
}
