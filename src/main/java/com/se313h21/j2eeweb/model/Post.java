/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Stevie
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Post.findAll", query = "SELECT p FROM Post p"),
    @NamedQuery(name = "Post.findById", query = "SELECT p FROM Post p WHERE p.id = :id"),
    @NamedQuery(name = "Post.findByCode", query = "SELECT p FROM Post p WHERE p.code = :code"),
    @NamedQuery(name = "Post.findByTitle", query = "SELECT p FROM Post p WHERE p.title = :title"),
    @NamedQuery(name = "Post.findByContent", query = "SELECT p FROM Post p WHERE p.content = :content"),
    @NamedQuery(name = "Post.findByDate", query = "SELECT p FROM Post p WHERE p.date = :date"),
    @NamedQuery(name = "Post.findByView", query = "SELECT p FROM Post p WHERE p.view = :view"),
    @NamedQuery(name = "Post.findByStatus", query = "SELECT p FROM Post p WHERE p.status = :status")})
public class Post implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 120)
    private String code;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8192)
    private String content;
    @Basic(optional = false)
    @NotNull
    private double date;
    private Integer view;
    @Size(max = 32)
    private String status;
    @JoinTable(name = "post_tag", joinColumns = {
        @JoinColumn(name = "post_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "tag_id", referencedColumnName = "id")})
    @ManyToMany
    private Collection<Tag> tagCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post")
    private Collection<PostImage> postImageCollection;
    @JoinColumn(name = "subject_id", referencedColumnName = "id")
    @ManyToOne
    private Subject subjectId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private User userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "post")
    private Collection<UserPostBookmark> userPostBookmarkCollection;

    public Post() {
    }

    public Post(Integer id) {
        this.id = id;
    }

    public Post(Integer id, String code, String title, String content, double date) {
        this.id = id;
        this.code = code;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getDate() {
        return date;
    }

    public void setDate(double date) {
        this.date = date;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @JsonIgnore
    @XmlTransient
    public Collection<Tag> getTagCollection() {
        return tagCollection;
    }

    @JsonIgnore
    public void setTagCollection(Collection<Tag> tagCollection) {
        this.tagCollection = tagCollection;
    }

    @JsonIgnore
    @XmlTransient
    public Collection<PostImage> getPostImageCollection() {
        return postImageCollection;
    }

    @JsonIgnore
    public void setPostImageCollection(Collection<PostImage> postImageCollection) {
        this.postImageCollection = postImageCollection;
    }

    @JsonIgnore
    public Subject getSubjectId() {
        return subjectId;
    }

    @JsonIgnore
    public void setSubjectId(Subject subjectId) {
        this.subjectId = subjectId;
    }

    @JsonIgnore
    public User getUserId() {
        return userId;
    }

    @JsonIgnore
    public void setUserId(User userId) {
        this.userId = userId;
    }

    @JsonIgnore
    @XmlTransient
    public Collection<UserPostBookmark> getUserPostBookmarkCollection() {
        return userPostBookmarkCollection;
    }

    @JsonIgnore
    public void setUserPostBookmarkCollection(Collection<UserPostBookmark> userPostBookmarkCollection) {
        this.userPostBookmarkCollection = userPostBookmarkCollection;
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
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.Post[ id=" + id + " ]";
    }
    
}
