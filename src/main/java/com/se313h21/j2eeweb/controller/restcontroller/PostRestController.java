/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Stevie
 */
@RestController
@Service
public class PostRestController {
    
    @Autowired
    PostDAO postDao;
    
    @Autowired
    SubjectDAO subjectDao;
    
    @RequestMapping(value="/subjects/{id}/posts-top")
    public List<Post> getTopPostBySubjectId(
        @PathVariable(value = "id") int subjectId){
        
        System.out.println("PostRestController@getTopPostBySubjectId: subjectid = " + subjectId);
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return new ArrayList();
        List<Post> posts = postDao.get(subject);
        if (posts.size() > 3){
            Collections.shuffle(posts);
            
            posts = posts.subList(0, 4); // 3 item từ 0 tới 3 thì viết subList(0, 4). đm cái hàm thằng nào viết ngu vãi
        }
        for(Post p : posts){
            p.setContent(""); // bỏ trường content để giảm json
        }
        return posts;
    }
}
