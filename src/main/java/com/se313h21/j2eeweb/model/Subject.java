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
    @NamedQuery(name = "Subject.findAll", query = "SELECT s FROM Subject s"),
    @NamedQuery(name = "Subject.findById", query = "SELECT s FROM Subject s WHERE s.id = :id"),
    @NamedQuery(name = "Subject.findByCode", query = "SELECT s FROM Subject s WHERE s.code = :code"),
    @NamedQuery(name = "Subject.findByTitle", query = "SELECT s FROM Subject s WHERE s.title = :title"),
    @NamedQuery(name = "Subject.findByDescription", query = "SELECT s FROM Subject s WHERE s.description = :description"),
    @NamedQuery(name = "Subject.findByDate", query = "SELECT s FROM Subject s WHERE s.date = :date"),
    @NamedQuery(name = "Subject.findByView", query = "SELECT s FROM Subject s WHERE s.view = :view")})
public class Subject implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    private String code;
    @Size(max = 128)
    private String title;
    @Size(max = 256)
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    private Double date;
    private Integer view;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    private User userId;
    @JsonIgnore
    @OneToMany(mappedBy = "subjectId")
    private Collection<Post> postCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "subject")
    @JsonIgnore
    private Collection<UserSubjectBookmark> userSubjectBookmarkCollection;

    public Subject() {
    }

    public Subject(Integer id) {
        this.id = id;
    }

    public Subject(Integer id, String code) {
        this.id = id;
        this.code = code;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getDate() {
        return date;
    }

    public void setDate(Double date) {
        this.date = date;
    }

    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
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
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    @JsonIgnore
    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }

    @JsonIgnore
    @XmlTransient
    public Collection<UserSubjectBookmark> getUserSubjectBookmarkCollection() {
        return userSubjectBookmarkCollection;
    }

    @JsonIgnore
    public void setUserSubjectBookmarkCollection(Collection<UserSubjectBookmark> userSubjectBookmarkCollection) {
        this.userSubjectBookmarkCollection = userSubjectBookmarkCollection;
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
        if (!(object instanceof Subject)) {
            return false;
        }
        Subject other = (Subject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.Subject[ id=" + id + " ]";
    }
    
}
