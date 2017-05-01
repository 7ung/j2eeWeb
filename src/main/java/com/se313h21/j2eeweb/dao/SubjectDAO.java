/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import com.se313h21.j2eeweb.repositories.PostRepository;
import com.se313h21.j2eeweb.repositories.SubjectRepository;
import com.se313h21.j2eeweb.repositories.UserSubjectBookmarkRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class SubjectDAO {
    
    @Autowired
    SubjectRepository subjectRepo;
    
    @Autowired
    UserSubjectBookmarkRepository usbRepo;
    
    @Autowired
    PostRepository postRepo;
    
    public List<Subject> getMany(){
        List<Subject> subjects = subjectRepo.findAll();
        return subjects;
    }
    
    public List<Subject> getMany(User user)
    {
        List<Subject> subjects = subjectRepo.findByUserId(user);
        return subjects;
    }
    
    public List<Subject> getMany(String title){
        List<Subject> subjects = subjectRepo.findByTitle(title);
        return subjects;
    }
    
    public List<Subject> getMany(User user, String title){
        List<Subject> subjects = subjectRepo.findByUserIdAndTitle(user, title);
        return subjects;
    }
    
    public List<Subject> getTop(User user, String title){
        List<Subject> subjects = subjectRepo.findFirst6ByUserIdAndTitleContaining(user, title, new Sort("title"));
        return subjects;
    }
    
    public Subject get(int id){
        return subjectRepo.findOne(id);
    }
    
    public Subject create(String title, String description, User user){
        Subject subject = new Subject (-1, "-1");
        subject.setTitle(title);
        subject.setDescription(description);
        subject.setDate(Utils.currentTimestamp());
        subject.setUserId(user);
        subject.setView(0);
        subject = subjectRepo.save(subject);
        subject.setCode(Integer.toHexString(subject.getId()));
        subject.setUserSubjectBookmarkCollection(new ArrayList());
        subject = subjectRepo.save(subject);
        return subject;
    }
    
    public List<Subject> getFollowedSubject(User user){
        List<Subject> subjects = subjectRepo.findSubjectByFollowUserId(user.getId());
        Collections.shuffle(subjects, new Random());
        if (subjects.size() > 8)
            return subjects.subList(0, 8); // thằng này bị điên.  (subList(0,11) thì trả về 1 item)
        else return subjects;
    }

    public List<Subject> getNotUser(User user) {
        List<Subject> subjects = subjectRepo.findByUserIdNot(user);
        Collections.shuffle(subjects, new Random());
        if (subjects.size() > 8)
            return subjects.subList(0, 8); 
        else return subjects;        
    }

    public List<Subject> getTop12() {
        List<Subject> subjects = subjectRepo.findAll();
        Collections.shuffle(subjects, new Random());
        if (subjects.size() > 8)
            return subjects.subList(0, 8); 
        else return subjects;
    }

    public boolean follow(Subject subject, Integer userId) {
        try{
            System.out.println(SubjectDAO.class.getSimpleName() + "@follow: " + "subject id: " + subject.getId() + " user id: " + userId);
            UserSubjectBookmark bookmark = new UserSubjectBookmark(userId, subject.getId());
            bookmark.setDate(new Date());
            Collection<UserSubjectBookmark> userBookmarks = subject.getUserSubjectBookmarkCollection();
            userBookmarks.add(bookmark);
            subject.setUserSubjectBookmarkCollection(userBookmarks);
            subject = subjectRepo.save(subject);
            return true;
        }
        catch(Exception e){
            return false;
        }   

    }
    
    public boolean unfollow(Subject subject, Integer userId) {
        List<UserSubjectBookmark> bookmarks = usbRepo.findByUserIdAndSubjectId(userId, subject.getId());
        if (bookmarks.isEmpty())
            return true;
        try{
            subject.getUserSubjectBookmarkCollection().remove(bookmarks.get(0));
            subject = subjectRepo.save(subject);
            return true;
        }
        catch(Exception e){
            return false;
        }   
    }
    
    public Long countFollow(Subject subject) {
        return usbRepo.countBySubjectId(subject.getId());
    }

    public boolean delete(Subject subject) {
        try{
//            usbRepo.deleteBySubjectId(subject.getId());
//            postRepo.deleteBySubjectId(subject.getId());
            subjectRepo.delete(subject.getId());
            return true;
        }
        catch(Exception e){
            System.out.println("SubjectDao@delete: Error : " + e.getMessage());
            return false;
        }
    }

    public Subject save(Subject subject) {
        subject.setDate(Utils.currentTimestamp());
        return  subjectRepo.save(subject);
    }

}
