/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Tag;
import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Stevie
 */
public interface TagRepository extends JpaRepository<Tag, Integer>{
    
    public List<Tag> findFirst6ByNameContaining(String name, Sort sort);
    public List<Tag> findByName(String name);
//    public List<Tag> findFirst6(Sort sort);
    
}
