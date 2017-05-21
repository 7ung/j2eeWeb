/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.repositories.UserSubjectBookmarkRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class UserSubjectBookmarkDAO {
    
    @Autowired
    UserSubjectBookmarkRepository usbRepo;
    
    public boolean isUserFollowedPost(User user, Subject subject){
        return usbRepo.existsByUserIdAndSubjectId(user.getId(), subject.getId());
    }
}
