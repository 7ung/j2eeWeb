/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Stevie
 */
public interface UserRepository extends JpaRepository<User, Integer>{
    
    public List<User> findByUsername(String username);
    
    public List<User> findByEmail(String email);
    
    //@Query("select * from user where username=:username and password=:password")
    public List<User> findByUsernameAndPassword(String username, String password);
}
