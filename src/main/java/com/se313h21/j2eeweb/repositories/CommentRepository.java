/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Nguyen Tan Luan
 */
public interface CommentRepository extends JpaRepository<Comment, Integer>{
    public List<Comment> findByUserId(Integer userId);
    public List<Comment> findByPostId(Post postId);
    
}
