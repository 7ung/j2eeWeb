/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.model.UserPostBookmarkPK;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Stevie
 */
public interface UserPostBookmarkRepository extends JpaRepository<UserPostBookmark, UserPostBookmarkPK>{
    List<UserPostBookmark> findByUserIdAndPostId(Integer userId, Integer post);
    List<UserPostBookmark> findByUserId(Integer userId);
    public int countByPostId(Integer postId);
   
    
}
