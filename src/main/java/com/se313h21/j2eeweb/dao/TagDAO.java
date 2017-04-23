/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.repositories.TagRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class TagDAO {
    
    @Autowired
    TagRepository tagRepo;
    
    public List<Tag> getTop6(String name){
        List<Tag> tags = tagRepo.findFirst6ByNameContaining(name, new Sort("name"));
        return tags;
    }
    
//    public List<Tag> getTop6(){
//        List<Tag> tags = tagRepo.findFirst6(new Sort("name"));
//        return tags;
//    }
}
