/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import java.util.List;
import javax.persistence.NamedQuery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Nguyen Tan Luan
 */
public interface CommentRepository extends JpaRepository<Comment, Integer>{
    public List<Comment> findByUserId(Integer userId);
    public Comment findById(Integer id);
    @Query ( "SELECT c FROM Comment c WHERE c.postId = :postId ORDER BY c.date DESC")
    public List<Comment> findByPostId(@Param("postId") Post postId);
    
}
