/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Stevie
 */
public interface PostRepository  extends JpaRepository<Post, Integer>{

    public Long countBySubjectId(Subject subjectId);

    public List<Post> findBySubjectId(Subject subject);

    public void deleteBySubjectId(Integer id);

    public List<Post> findByUserId(User user);
    
    public List<Post> findAll(Sort sort);
    
    public Page<Post> findAll(Pageable pageable);

}
