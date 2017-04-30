/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.google.common.base.Predicate;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.repositories.PostRepository;
import com.se313h21.j2eeweb.repositories.SubjectRepository;
import com.se313h21.j2eeweb.repositories.UserPostBookmarkRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class PostDAO {
    
    @Autowired
    PostRepository postRepo;

    @Autowired
    UserPostBookmarkRepository repo;
    
    @Autowired 
    SubjectRepository subjectRepo;
    
    
    public Post create(String title, String content, User user, Subject subject, Collection<Tag> tags){
        Post post = create(title, content, user, subject);
        post.setTagCollection(tags);
        post = postRepo.save(post);
        return post;
    }
    
    public Post create(String title, String content, User user, Subject subject){
        Post post = new Post(-1, "-1", title, content, Utils.currentTimestamp());
        post.setUserId(user);
        post.setStatus("published");
        post.setView(0);
        post = postRepo.save(post);
        post.setCode(Integer.toHexString(post.getId()));
        if (subject != null){
            post.setSubjectId(subject);
        }
        post = postRepo.save(post);
        return post;
    }
    
    public Post create(String title, String content, User user){
        return create(title, content, user, null);
    }

    public Post get(int postId) {
        return postRepo.findOne(postId);
    }

    public Post increaseView(Post post) {
        post.setView(post.getView() + 1);
//        post.getSubjectId().getPostCollection();
        return postRepo.save(post);
    }

    public Post update(Post post) {
        return postRepo.save(post);
    }

    public Post setPrivate(Post post) {
        post.setStatus("private");
        return postRepo.save(post);
    }
    
    public Post setPublish(Post post) {
        post.setStatus("published");
        return postRepo.save(post);
    }    

    public boolean delete(Post post) {
        try{
            postRepo.delete(post.getId());
            return true;
        }
        catch(Exception e){
            return false;
        }
    }

    public boolean follow(Post post, Integer userId) {
        try{
            UserPostBookmark bookmark = new UserPostBookmark(userId, post.getId());
            bookmark.setDate(new Date());
            bookmark.setNote("");
            Collection<UserPostBookmark> userBookmarks = post.getUserPostBookmarkCollection();
            userBookmarks.add(bookmark);
            post.setUserPostBookmarkCollection(userBookmarks);
            post = postRepo.save(post);
            return true;
        }
        catch(Exception e){
            return false;
        }   
    }

    public boolean unfollow(Post post, Integer userId) {
        List<UserPostBookmark> bookmarks = repo.findByUserIdAndPostId(userId, post.getId());
        if (bookmarks.isEmpty())
                return true;
        try{
            post.getUserPostBookmarkCollection().remove(bookmarks.get(0));
            post = postRepo.save(post);
            return true;
        }
        catch(Exception e){
            return false;
        }   
    }

    public Long countPost(Subject subjectId) {
        return postRepo.countBySubjectId(subjectId);
    }

    public List<Post> get(Subject subject) {
        return postRepo.findBySubjectId(subject);
    }
    
    public List<Post> get(User user) {
        return postRepo.findByUserId(user);
    }

    public int countFollow(Post postId) {
        return repo.countByPostId(postId.getId());
    }

    public List<Post> getRecent() {
        return postRepo.findAll(new Sort(Direction.DESC, "date"));
    }

    public Page<Post> getFirstPaging() {
        return postRepo.findAll(new PageRequest(0, 16));
    }
    
    public Page<Post> getPaging(int pageNumber) {
        return postRepo.findAll(new PageRequest(pageNumber, 16));
    }
    
    public Page<Post> getFirstPaging(Tag tag) {
        return postRepo.findByTagId(tag.getId(), new PageRequest(0, 16));
    }
    
    public Page<Post> getPaging(Tag tag, int pageNumber) {
        return postRepo.findByTagId(tag.getId(), new PageRequest(pageNumber, 16));
    }
    

}
