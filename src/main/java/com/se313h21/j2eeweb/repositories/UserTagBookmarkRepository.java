/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserTagBookmark;
import com.se313h21.j2eeweb.model.UserTagBookmarkPK;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Stevie
 */
public interface UserTagBookmarkRepository  extends JpaRepository<UserTagBookmark, UserTagBookmarkPK>{
    public List<UserTagBookmark> findByUserId(Integer userId);

    public boolean existsByUserIdAndTagId(Integer id, Integer id0);
    
}
