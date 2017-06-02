/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller.restcontroller;

import com.se313h21.j2eeweb.controller.BaseAuthorizationUserController;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.dao.UserPostBookmarkDAO;
import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Nguyen Tan Luan
 */
@RestController
@Service
public class CommentRestController extends BaseAuthorizationUserController {

    @Autowired
    UserDAO userDao;
    @Autowired
    UserPostBookmarkDAO bookmarkDao;

    @RequestMapping(value = "/notification")
    public List<Comment> getNotification(HttpServletRequest request,
            HttpServletResponse response) {
        User user = super.fetchUser(request, response);
        List<Comment> notifies = bookmarkDao.getNotifyByUserBookmark(user);
        userDao.updateLastLogin(user);
        return notifies;
    }
}
