/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Stevie
 */
public interface SubjectRepository  extends JpaRepository<Subject, Integer>{
    public List<Subject> findByUserId(User user);
}
