/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profile.findAll", query = "SELECT p FROM Profile p"),
    @NamedQuery(name = "Profile.findById", query = "SELECT p FROM Profile p WHERE p.id = :id"),
    @NamedQuery(name = "Profile.findByDisplayName", query = "SELECT p FROM Profile p WHERE p.displayName = :displayName"),
    @NamedQuery(name = "Profile.findByDob", query = "SELECT p FROM Profile p WHERE p.dob = :dob"),
    @NamedQuery(name = "Profile.findByGender", query = "SELECT p FROM Profile p WHERE p.gender = :gender"),
    @NamedQuery(name = "Profile.findByCountry", query = "SELECT p FROM Profile p WHERE p.country = :country"),
    @NamedQuery(name = "Profile.findByLocation", query = "SELECT p FROM Profile p WHERE p.location = :location"),
    @NamedQuery(name = "Profile.findByPersonalLink", query = "SELECT p FROM Profile p WHERE p.personalLink = :personalLink"),
    @NamedQuery(name = "Profile.findByAbout", query = "SELECT p FROM Profile p WHERE p.about = :about"),
    @NamedQuery(name = "Profile.findByProfilePictureId", query = "SELECT p FROM Profile p WHERE p.profilePictureId = :profilePictureId")})
public class Profile implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "display_name")
    private String displayName;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dob;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    private String gender;
    @Size(max = 64)
    private String country;
    @Size(max = 128)
    private String location;
    @Size(max = 256)
    @Column(name = "personal_link")
    private String personalLink;
    @Size(max = 512)
    private String about;
    @Column(name = "profile_picture_id")
    private Integer profilePictureId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne
    @JsonIgnore
    private User userId;

    public Profile() {
    }

    public Profile(Integer id) {
        this.id = id;
    }

    public Profile(Integer id, String displayName, String gender) {
        this.id = id;
        this.displayName = displayName;
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPersonalLink() {
        return personalLink;
    }

    public void setPersonalLink(String personalLink) {
        this.personalLink = personalLink;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Integer getProfilePictureId() {
        return profilePictureId;
    }

    public void setProfilePictureId(Integer profilePictureId) {
        this.profilePictureId = profilePictureId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof Profile)) {
            return false;
        }
        Profile other = (Profile) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.se313h21.j2eeweb.model.Profile[ id=" + id + " ]";
    }
    
}
