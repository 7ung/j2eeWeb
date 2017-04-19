/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    private String password;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    private String email;
    @ManyToMany(mappedBy = "userCollection")
    private Collection<DevelopmentType> developmentTypeCollection;
    @ManyToMany(mappedBy = "userCollection")
    private Collection<Experience> experienceCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<Image> imageCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<Subject> subjectCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<Profile> profileCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<SeekingJob> seekingJobCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<AccessToken> accessTokenCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserTagBookmark> userTagBookmarkCollection;
    @OneToMany(mappedBy = "userId")
    private Collection<Post> postCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserPostBookmark> userPostBookmarkCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserSubjectBookmark> userSubjectBookmarkCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Collection<UserWork> userWorkCollection;
    @JoinColumn(name = "user_role_id", referencedColumnName = "id")
    @ManyToOne
    private UserRole userRoleId;

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String username, String password, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public Collection<DevelopmentType> getDevelopmentTypeCollection() {
        return developmentTypeCollection;
    }

    public void setDevelopmentTypeCollection(Collection<DevelopmentType> developmentTypeCollection) {
        this.developmentTypeCollection = developmentTypeCollection;
    }

    @XmlTransient
    public Collection<Experience> getExperienceCollection() {
        return experienceCollection;
    }

    public void setExperienceCollection(Collection<Experience> experienceCollection) {
        this.experienceCollection = experienceCollection;
    }

    @XmlTransient
    public Collection<Image> getImageCollection() {
        return imageCollection;
    }

    public void setImageCollection(Collection<Image> imageCollection) {
        this.imageCollection = imageCollection;
    }

    @XmlTransient
    public Collection<Subject> getSubjectCollection() {
        return subjectCollection;
    }

    public void setSubjectCollection(Collection<Subject> subjectCollection) {
        this.subjectCollection = subjectCollection;
    }

    @XmlTransient
    public Collection<Profile> getProfileCollection() {
        return profileCollection;
    }

    public void setProfileCollection(Collection<Profile> profileCollection) {
        this.profileCollection = profileCollection;
    }

    @XmlTransient
    public Collection<SeekingJob> getSeekingJobCollection() {
        return seekingJobCollection;
    }

    public void setSeekingJobCollection(Collection<SeekingJob> seekingJobCollection) {
        this.seekingJobCollection = seekingJobCollection;
    }

    @XmlTransient
    public Collection<AccessToken> getAccessTokenCollection() {
        return accessTokenCollection;
    }

    public void setAccessTokenCollection(Collection<AccessToken> accessTokenCollection) {
        this.accessTokenCollection = accessTokenCollection;
    }

    @XmlTransient
    public Collection<UserTagBookmark> getUserTagBookmarkCollection() {
        return userTagBookmarkCollection;
    }

    public void setUserTagBookmarkCollection(Collection<UserTagBookmark> userTagBookmarkCollection) {
        this.userTagBookmarkCollection = userTagBookmarkCollection;
    }

    @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }

    @XmlTransient
    public Collection<UserPostBookmark> getUserPostBookmarkCollection() {
        return userPostBookmarkCollection;
    }

    public void setUserPostBookmarkCollection(Collection<UserPostBookmark> userPostBookmarkCollection) {
        this.userPostBookmarkCollection = userPostBookmarkCollection;
    }

    @XmlTransient
    public Collection<UserSubjectBookmark> getUserSubjectBookmarkCollection() {
        return userSubjectBookmarkCollection;
    }

    public void setUserSubjectBookmarkCollection(Collection<UserSubjectBookmark> userSubjectBookmarkCollection) {
        this.userSubjectBookmarkCollection = userSubjectBookmarkCollection;
    }

    @XmlTransient
    public Collection<UserWork> getUserWorkCollection() {
        return userWorkCollection;
    }

    public void setUserWorkCollection(Collection<UserWork> userWorkCollection) {
        this.userWorkCollection = userWorkCollection;
    }

    public UserRole getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(UserRole userRoleId) {
        this.userRoleId = userRoleId;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.User[ id=" + id + " ]";
    }
    
}
