/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.PostRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class PostDAO {
    
    @Autowired
    PostRepository postRepo;

    public Post create(String title, String content, User user, Subject subject){
        Post post = new Post(-1, "-1", title, content, Utils.currentTimestamp());
        post.setUserId(user);
        post.setStatus("published");
        post = postRepo.save(post);
        post.setCode(Integer.toHexString(post.getId()));
        post = postRepo.save(post);
        if (subject != null)
            post.setSubjectId(subject);
        return post;
    }
    
    public Post create(String title, String content, User user){
        return create(title, content, user, null);
    }
    
}
