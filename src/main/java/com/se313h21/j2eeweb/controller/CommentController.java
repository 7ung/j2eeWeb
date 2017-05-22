/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.se313h21.j2eeweb.dao.CommentDAO;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

/**
 *
 * @author Nguyen Tan Luan
 */
@Controller
@Service
public class CommentController extends BaseAuthorizationUserController {

    @Autowired
    PostDAO postDao;

    @Autowired
    CommentDAO commentDao;

    @Autowired
    UserDAO userDao;

    @RequestMapping(value = "/post", method = RequestMethod.POST, params = {"id"})
    public String comment_create(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int postId,
            ModelMap model) {
        String content = request.getParameter("comment-content");
        User user = super.fetchUser(request, response);
        if (user == null) {
            model.addAttribute("startPage", 0); // 1 => register;  0 => login
            return "registration";
        }

        Post post = postDao.get(postId);
        Comment comment = commentDao.create(content, user, post);
        return "redirect:post?id=" + post.getId();
    }

    @RequestMapping(value = "/comment-edit", method = RequestMethod.POST, params = {"id"})
    @ResponseBody
    public int comment_edit(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int commentId,
            @RequestParam(value = "post_id") int postId,
            ModelMap model) {
        String content = request.getParameter("comment-content");
        User user = super.fetchUser(request, response);
        Comment comment = commentDao.getCommentById(commentId);
        if (comment != null) {
            comment.setContent(content);
            comment.setdate(Utils.currentTimestamp());
        }
        Comment commentSuccess=commentDao.update(comment);
        if(commentSuccess!=null){
            System.out.println("aaaaaaaaaaaaaa ");
            return 200;
        }else{ 
             System.out.println("aaaaaaaaaaaaaa ");
            return 400;
        }
        //return "redirect:post?id=" + postId;
        //return "post/post_show";
    }

    @RequestMapping(value = "/comment-delete", method = RequestMethod.GET,params = {"id"})
    @ResponseBody
    public int comment_delete(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "id") int commentId,
            ModelMap model) {
        Comment comment=commentDao.getCommentById(commentId);
        System.out.println("delete ------comment--- "+commentId);
        boolean success = commentDao.delete(comment);
        if (success) {
            System.out.println("aaaaaaaaaa");
            return 200;
            
        } else {
            System.out.println("bbbbbbbbbb");
            return 400;
        }
        //return "post/post_show";
    }

//    @RequestMapping(value = "/post", method = RequestMethod.GET, params = "{id}")
//    public String comment_show(HttpServletRequest request,
//            HttpServletResponse response,
//            @RequestParam(value = "id") int postId,
//            ModelMap model) {
//
//        Post post = postDao.get(postId);
//
//        List<Comment> comments = commentDao.getMany(post);
//        if (comments.size() > 8) {
//            comments = comments.subList(0, 8);
//        }
//
//        //model.addAttribute("comments", comments);
//        return "post/post_show";
//    }

}
