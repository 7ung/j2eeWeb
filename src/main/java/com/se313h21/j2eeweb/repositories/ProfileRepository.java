/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ProfileRepository extends JpaRepository<Profile, Integer>{
   
   //@Query ("SELECT p FROM profile p WHERE p.userId = :user")
   //public List<Profile> findByUserId(User user);
}
