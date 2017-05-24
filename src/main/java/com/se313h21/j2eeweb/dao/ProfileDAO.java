/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.repositories.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author huynphu
 */
@Service
public class ProfileDAO {
    @Autowired
    ProfileRepository repo;
    
    Profile pro;
    
//    public Profile create(int UserID)
//    {
//        
//    }
}
