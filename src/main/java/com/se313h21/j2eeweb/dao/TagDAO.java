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
    
    public Tag get(String name){
        List<Tag> tags = tagRepo.findByName(name);
        if (tags.isEmpty())
            return create(name);
        return tags.get(0);
    }
    
    private Tag create(String name){
        Tag t = new Tag(-1, "-1");
        t.setName(name);
        t = tagRepo.save(t);
        t.setCode(Integer.toHexString(t.getId()));
        t = tagRepo.save(t);
        return t;
    }
    
//    public List<Tag> getTop6(){
//        List<Tag> tags = tagRepo.findFirst6(new Sort("name"));
//        return tags;
//    }
}
