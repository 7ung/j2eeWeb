/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Stevie
 */
@Entity
@Table(name = "post_image")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PostImage.findAll", query = "SELECT p FROM PostImage p"),
    @NamedQuery(name = "PostImage.findByPostId", query = "SELECT p FROM PostImage p WHERE p.postImagePK.postId = :postId"),
    @NamedQuery(name = "PostImage.findByImageId", query = "SELECT p FROM PostImage p WHERE p.postImagePK.imageId = :imageId"),
    @NamedQuery(name = "PostImage.findByReplaceCode", query = "SELECT p FROM PostImage p WHERE p.replaceCode = :replaceCode")})
public class PostImage implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected PostImagePK postImagePK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "replace_code")
    private String replaceCode;
    @JoinColumn(name = "image_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Image image;
    @JoinColumn(name = "post_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Post post;

    public PostImage() {
    }

    public PostImage(PostImagePK postImagePK) {
        this.postImagePK = postImagePK;
    }

    public PostImage(PostImagePK postImagePK, String replaceCode) {
        this.postImagePK = postImagePK;
        this.replaceCode = replaceCode;
    }

    public PostImage(int postId, int imageId) {
        this.postImagePK = new PostImagePK(postId, imageId);
    }

    public PostImagePK getPostImagePK() {
        return postImagePK;
    }

    public void setPostImagePK(PostImagePK postImagePK) {
        this.postImagePK = postImagePK;
    }

    public String getReplaceCode() {
        return replaceCode;
    }

    public void setReplaceCode(String replaceCode) {
        this.replaceCode = replaceCode;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (postImagePK != null ? postImagePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PostImage)) {
            return false;
        }
        PostImage other = (PostImage) object;
        if ((this.postImagePK == null && other.postImagePK != null) || (this.postImagePK != null && !this.postImagePK.equals(other.postImagePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.PostImage[ postImagePK=" + postImagePK + " ]";
    }
    
}
