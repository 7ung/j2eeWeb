/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SubjectDAO;
import com.se313h21.j2eeweb.dao.TagDAO;
import com.se313h21.j2eeweb.dao.UserPostBookmarkDAO;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.activiti.engine.impl.util.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Stevie
 */
@Controller
@Service
public class PostController extends BaseAuthorizationUserController{
    
    private static String TAG = "[PostController]:";
    
    @Autowired
    PostDAO postDao;
    
    @Autowired
    SubjectDAO subjectDao;
    
    @Autowired
    TagDAO tagDao;
    
    @Autowired
    UserPostBookmarkDAO upbDao;
    
    @RequestMapping(value="/post", method=RequestMethod.GET)
    public String post_create(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return PostController.redirect;
        }
        
        List<Subject> subjects = subjectDao.getMany(user);
        model.addAttribute("subjects", subjects);
        
        return "post/post_create";
    }
    
    
    @RequestMapping(value = "/post", method=RequestMethod.POST)
    public String post_store(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        User user = fetchUser(request, response);
        
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String tagsListString = request.getParameter("tags-post-list");
        
        Subject subject = null;
        
        int subjectId = Integer.parseInt( request.getParameter("subject-id"));
        String subjectName = request.getParameter("subject-name");
        
        System.out.println(TAG + " subject id = " + subjectId);
        System.out.println(TAG + " subject name = " + subjectName);
        System.out.println(TAG + " tags = " + tagsListString);

        List<Tag> tags = getTagsName(tagsListString);
        
        subject = retreiveSubject(subjectId, subjectName, user);
        
        Post post = null;
        if (request.getParameter("post-id") != null){
            int postId = Integer.parseInt(request.getParameter("post-id"));
            post = postDao.get(postId);
            if (post == null){
                return "error_pages/404";
            }
            post.setTitle(title);
            post.setContent(content);
            post.setTagCollection(tags);
            post.setDate(Utils.currentTimestamp());
            post.setSubjectId(subject);
            post = postDao.update(post);
        }
        else {
            post = postDao.create(title, content, user, subject, tags);
        }
            
        return "redirect:post?id=" + post.getId();
        
    }
    
    private Subject retreiveSubject(int subjectId, String subjectName, User user){
        Subject subject = null;
        
        if (subjectId != -1){
            subject = subjectDao.get(subjectId);
        }
        if (subject == null && subjectId == -1 && !subjectName.equals(""))
            subject = subjectDao.create(subjectName, "", user);
        return subject;
    }
    
    
    private List<Tag> getTagsName(String tagListString){
        List<Tag> tags = new ArrayList<>();
        String[] names = tagListString.split(";");
        Tag t = null;
        for (String name : names) {
            System.out.println(TAG + " look for tag names: " + name);
            t = tagDao.get(name.trim());
            tags.add(t);
        }
        return tags;
    }
    
    @RequestMapping(value="/post", method=RequestMethod.GET, params = {"id"})
    public String post_show(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);

        Post post = postDao.get(postId);
        if (post == null)
            return "error_pages/404";
        
        boolean isOwner = isOwner(user, post);
        
        if (isOwner == false && post.getStatus().equals("private"))
            return "error_pages/403";
        model.addAttribute("owner", String.valueOf(isOwner));
        
        if (user == null){
            model.addAttribute("isFollowed", "undefined");
        }
        else {
            boolean isFollowed = upbDao.isUserFollowedPost(user, post);
            model.addAttribute("isFollowed", String.valueOf(isFollowed));
        }
        
        post = postDao.increaseView(post);
        
        model.addAttribute("post", post);
        return "post/post_show";
    }
    
    @RequestMapping(value="/post-edit", method=RequestMethod.GET, params = {"id"})
    public String post_edit(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return PostController.redirect;
        }

        Post post = postDao.get(postId);
        if (post == null)
            return "error_pages/404";
        
        boolean isOwner = isOwner(user, post);
        if (isOwner == false)
            return "error_pages/403";
        
        model.addAttribute("post", post);
        model.addAttribute("tagsCollection", post.getTagCollection());
        model.addAttribute("subject", post.getSubjectId());

        model.addAttribute("mode", "edit");
        return "post/post_create";
    }
    
    @RequestMapping(value="/post-private", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int privatePost(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }
        
        Post post = postDao.get(postId);
        if (post == null)
            return 404;
        
        if (isOwner(user, post)){
            
        }
        else {
            return 403;
        }
        
        post = postDao.setPrivate(post);
        return 200;
    } 
    
    @RequestMapping(value="/post-publish", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int publishPost(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }
        
        Post post = postDao.get(postId);
        if (post == null)
            return 404;
        
        if (isOwner(user, post)){
            
        }
        else {
            return 403;
        }
        
        post = postDao.setPublish(post);
        return 200;
    } 
    
    @RequestMapping(value="/post-delete", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int deletePost(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Post post = postDao.get(postId);
        if (post == null)
            return 404;
        
        if (isOwner(user, post)){
            
        }
        else {
            return 403;
        }
        
        boolean success = postDao.delete(post);
        if (success )
            return 200;
        else
            return 400;

    }
    
    @RequestMapping(value="/post-follow", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int followPost(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Post post = postDao.get(postId);
        if (post == null)
            return 404;
        
        if (isOwner(user, post)){
            return 409;
        }
        
        boolean success = postDao.follow(post, user.getId());
        if (success)
            return 200;
        else
            return 400;        
    }
    
    @RequestMapping(value="/post-unfollow", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int unfollowPost(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return 403;
        }   
        
        Post post = postDao.get(postId);
        if (post == null)
            return 404;
        
        if (isOwner(user, post)){
            return 409;
        }
        
        boolean success = postDao.unfollow(post, user.getId());
        if (success)
            return 200;
        else
            return 400;        
    }    
    
    @RequestMapping(value="/post-count-follow", method=RequestMethod.GET, params = {"id"})
    @ResponseBody
    public int countFollow(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model){
        Post post = postDao.get(postId);
        if (post == null)
            return 0;
        return post.getUserPostBookmarkCollection().size();
    }
    
    private boolean isOwner(User user, Post post){
        if (user == null)
            return false;
        if (Objects.equals(user.getId(), post.getUserId().getId()))
            return true;
        else
            return false;        
    }

    
    
}
