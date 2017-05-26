/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.ProfileRepository;
import com.se313h21.j2eeweb.repositories.UserRepository;
import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author huynphu
 */
@Service
public class ProfileDAO {
    @Autowired
    ProfileRepository proRepo;
    
    @Autowired
    UserRepository userRepo;
    
    public Profile create(User user, String displayName, Date dateOfBirth, String gender, String country, String personalLink, String about)
    {
        Profile profile = new Profile(-1, "", "");
        profile.setUserId(user);
        profile.setDisplayName(displayName);
        profile.setDob(dateOfBirth);
        profile.setGender(gender);
        profile.setCountry(country);
        profile.setPersonalLink(personalLink);
        profile.setAbout(about);
        profile = proRepo.save(profile);
        return profile;
    }
    
    public Profile create(User user, String displayName, String gender)
    {
        return create(user, displayName, null);
     
    }
    
    public Profile get(int proId) {
        return proRepo.findOne(proId);
    }
    
    public Profile update(Profile profile)
    {
        return proRepo.save(profile);
    }
}
