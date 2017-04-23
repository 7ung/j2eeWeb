/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Stevie
 */
@Service
@RestController
public class SubjectRestController {
    
    private static String TAG = SubjectRestController.class.getName();
    
    private static int ItemToSearch = 6;
    
    @Autowired
    SubjectDAO subjectDao;
    
    @Autowired
    UserDAO userDao;
    
    @RequestMapping("/user-info/subject")
    public List<Subject> getUserSubject(@RequestParam(value="user_id", defaultValue="0") int userId) {
        System.out.println(TAG + ": user id = " + userId);
        User user = userDao.get(userId);
        if (user == null) {
            return new ArrayList<>();
        }
        return subjectDao.getMany(user);
    }
    
    @RequestMapping(value = "/user-info/subject-by-title", produces="application/json;charset=UTF-8")
    public List<Subject> getUserSubject(
            @RequestParam(value="user_id", defaultValue="0") int userId,
            @RequestParam(value="subject_title", defaultValue="") String subjectTitle){
        
        System.out.println(TAG + ": user id = " + userId);
        System.out.println(TAG + ": subject title = " + subjectTitle);
        User user = userDao.get(userId);
        if (user == null) {
            return new ArrayList<>();
        }
        return subjectDao.getTop(user, subjectTitle);
    }
}
