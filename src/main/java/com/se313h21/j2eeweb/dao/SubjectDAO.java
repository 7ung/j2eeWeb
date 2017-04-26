/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.SubjectRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.Collections;
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
        subject = subjectRepo.save(subject);
        return subject;
    }
    
    public List<Subject> getFollowedSubject(User user){
        List<Subject> subjects = subjectRepo.findSubjectByFollowUserId(user.getId());
        Collections.shuffle(subjects, new Random());
        if (subjects.size() >= 4)
            return subjects.subList(0, 4); // thằng này bị điên.  (subList(0,3) thì trả về 3 item)
        else return subjects;
    }


}
