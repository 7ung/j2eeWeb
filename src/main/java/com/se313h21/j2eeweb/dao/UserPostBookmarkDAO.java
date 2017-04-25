/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.repositories.UserPostBookmarkRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class UserPostBookmarkDAO {
    
    @Autowired
    UserPostBookmarkRepository repo;
    
    public boolean isUserFollowedPost(User user, Post post){
        List<UserPostBookmark> bookmarks = repo.findByUserIdAndPostId(user.getId(), post.getId());
        return (bookmarks.isEmpty() == false);
    }
    
    public boolean unFollow(User user,Post post){
        List<UserPostBookmark> bookmarks = repo.findByUserIdAndPostId(user.getId(), post.getId());
        if (bookmarks.isEmpty())
            return true;
        System.out.println("UserPostBookmarkDAO@unFollow@" + user.getId() + "@" + post.getId());
        try{
            repo.delete(bookmarks.get(0).getUserPostBookmarkPK());
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
}
