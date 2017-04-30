/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.controller.BaseAuthorizationUserController;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefaults;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Stevie
 */
@RestController
@Service
public class PostRestController extends BaseAuthorizationUserController{
    
    @Autowired
    PostDAO postDao;
    
    @Autowired
    SubjectDAO subjectDao;
    
    @Autowired
    UserDAO userDao;
    
    @Autowired
    TagDAO tagDao;
    
    @RequestMapping(value="/subjects/{id}/posts-top")
    public List<Post> getTopPostBySubjectId(
        @PathVariable(value = "id") int subjectId){
        
        List<Post> posts =  findPostBySubjectId(subjectId);

        if (posts.size() > 3){
            Collections.shuffle(posts);
            posts = posts.subList(0, 4); // 3 item từ 0 tới 3 thì viết subList(0, 4). đm cái hàm thằng nào viết ngu vãi
        }
        for(Post p : posts){
            p.setContent(""); // bỏ trường content để giảm json
        }
        return posts;
    }
    
    @RequestMapping(value="/subjects/{id}/posts")
    public List<Post> getPostBySubjectId(
        @PathVariable(value = "id") int subjectId){
        
        List<Post> posts =  findPostBySubjectId(subjectId);
        for(Post p : posts){
            // bỏ trường content để giảm json. 
            // Vì hiển thị list post thì không cần xem content
            p.setContent(""); 
        }
        return posts;
    }
   
    
    @RequestMapping(value = "/users/{id}/posts")
    public List<Post> getPostByUserId(
        @PathVariable(value = "id") int userId){
        User user = userDao.get(userId);
        if (user == null)
            return new ArrayList();
        List<Post> posts = postDao.get(user);
        Collections.shuffle(posts, new Random());
        
        if (posts.size() > 8)
            posts = posts.subList(0, 8);
        for(Post p : posts){
            // bỏ trường content để giảm json. 
            // Vì hiển thị list post thì không cần xem content
            p.setContent(""); 
        }
        
        return posts;
    }
    
    @RequestMapping(value="/post/{id}/follows")
    public int getPostFollows(@PathVariable(value = "id") int postId){
        Post post = postDao.get(postId);
        if (post == null)
            return 0;
        return postDao.countFollow(post);
    }
    
    @RequestMapping(value = "/tags/{id}/posts", params = {"page","size"})
    @ResponseBody
    public Page<Post> postByTagPaging(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model,
            @PathVariable("id") int tagId,
            @RequestParam("page") int pageNumber,
            @RequestParam("size") int pageSize){
            
        Tag tag = tagDao.get(tagId);
        if (tag == null)
            return null;
        Pageable pageable = new PageRequest(pageNumber, pageSize);
        Page<Post> posts = postDao.getPaging(tag, pageable);
        for (Post p : posts){
            p.setContent("");
        }
        return posts;
    }
    
    private List<Post> findPostBySubjectId(int subjectId){
        System.out.println("PostRestController@getTopPostBySubjectId: subjectid = " + subjectId);
        Subject subject = subjectDao.get(subjectId);
        if (subject == null)
            return new ArrayList();
        return postDao.get(subject);        
    }
    
}
