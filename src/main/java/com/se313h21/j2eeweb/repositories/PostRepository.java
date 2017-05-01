/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

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
            
    @Query(value ="select *,post_tag.tag_id as tag_id from post inner join post_tag on post.id = post_tag.post_id where post_tag.tag_id = ?1 order by post.date desc,?#{#pageable}",
        countQuery = "select count(*) as tag_id from post inner join post_tag on post.id = post_tag.post_id where post_tag.tag_id = ?1 ",
        nativeQuery= true)
    Page<Post> findByTagId(Integer userId, Pageable pageable);

    Page<Post> findByUserId(User user, Pageable pageable);    
    
}
