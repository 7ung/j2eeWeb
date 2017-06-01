/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.repositories.CommentRepository;
import com.se313h21.j2eeweb.repositories.PostRepository;
import com.se313h21.j2eeweb.repositories.UserPostBookmarkRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
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

    @Autowired
    CommentRepository commentRepo;

    @Autowired
    PostRepository postRepo;
    

    public boolean isUserFollowedPost(User user, Post post) {
        List<UserPostBookmark> bookmarks = repo.findByUserIdAndPostId(user.getId(), post.getId());
        return (bookmarks.isEmpty() == false);
    }

    public List<Comment> getNotifyByUserBookmark(User user) {
        List<UserPostBookmark> bookmarks = repo.findByUserId(user.getId());
        List<Post> posts = new ArrayList<>();
        for (UserPostBookmark bookmark : bookmarks) {
            posts.add(bookmark.getPost());
        }

        List<Post> ownPosts = postRepo.findByUserId(user);
        posts.addAll(ownPosts);

        List<Comment> result = new ArrayList<>();
        for (Post post : posts) {
            List<Comment> comments = commentRepo.findByPostId(post);
            for (Comment comment : comments) {
                if (comment.getUserId().getId() != user.getId() && comment.getDate() >= user.getLastLogin()) {
                    result.add(comment);
                }
            }
        }
        
        return result;
    }

}
