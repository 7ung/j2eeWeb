/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.CommentRepository;
import com.se313h21.j2eeweb.repositories.PostRepository;
import com.se313h21.j2eeweb.repositories.UserRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nguyen Tan Luan
 */
@Service
public class CommentDAO {
    @Autowired
    CommentRepository commentRepo;
    
    @Autowired
    UserRepository userRepo;
    
    @Autowired
    PostRepository postRepo;
    
    public List<Comment> getMany(User user){
        List<Comment> listComment=commentRepo.findByUserId(user.getId());
        return listComment;
    }
    
    public List<Comment> getMany(Post post){
        List<Comment> listComment=commentRepo.findByPostId(post);
        return listComment;
    }
    
    public Comment getCommentById(Integer CommentId){
        return commentRepo.findById(CommentId);
    }
    
    public Comment create(String content, User user, Post post){
        Comment comment=new Comment(-1,content);
        comment.setDate(Utils.currentTimestamp());
        comment.setUserId(user);
        comment.setPostId(post);
        commentRepo.save(comment);
        return comment;
    }
    
    public Comment update(Comment comment){
        return commentRepo.save(comment);
    }
    
    public boolean delete(Comment comment){
        try{
        commentRepo.delete(comment.getId());
        return true;}
        catch(Exception e){
            return false;
        }
    }
    
    public Integer getCommentCount(Post post){
        return post.getCommentCollection().size();
    }
    
    
    
}
