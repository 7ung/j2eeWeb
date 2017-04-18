/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class UserDAO {
    
    @Autowired
    UserRepository repo;
    
    User user;
    
    public User get(String username, String password){
        password = Hashing.generateHash(password);
        List<User> users = repo.findByUsernameAndPassword(username, password);
        
        if(users.isEmpty()){
            return (user = null);
        }
        else {
            return (user = users.get(0));
        }
    }
    
    public User get(){
        return user;
    }
}
