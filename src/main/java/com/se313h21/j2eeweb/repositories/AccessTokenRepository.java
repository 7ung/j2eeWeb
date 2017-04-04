/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.jboss.logging.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Stevie
 */
public interface AccessTokenRepository extends JpaRepository<AccessToken, Integer>{
 
    public List<AccessToken> findByUserId(User user);
    
    
    
}
