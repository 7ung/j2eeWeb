/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.User;

import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;
import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

/**
 *
 * @author Stevie
 */
@Service
public class AuthToken {
    
    @Autowired
    AccessTokenRepository accessTokenRepo;
        
    @Autowired
    private WebApplicationContext appContext;
    
    public User determineUser(HttpServletRequest request, HttpServletResponse response)
    {
        String token = getToken(request);       // lấy token từ cookie
        if (Strings.isNullOrEmpty(token)){
            // nếu token từ cookie null thì lấy token từ session
            token = ""+request.getSession().getAttribute("token");
        }
        // nếu token từ session vẫn null thì trả về null
        if (Strings.isNullOrEmpty(token))
            return null;
        
//        Repositories repositories = new Repositories(appContext);
//        accessTokenRepo = (AccessTokenRepository)(JpaRepository)repositories.getRepositoryFor(AccessTokenRepository.class);
        // nếu có token string thì tìm token bằng token string
        List<AccessToken> lists = accessTokenRepo.findByAccessToken(token);
        if (lists.isEmpty() == false) {
            if (lists.get(0).getExpired() < (new Date()).getTime()){
                // token hết hạn => xoá đối tượng token và return null
                accessTokenRepo.delete(lists.get(0));
                return null;
            }
            // tìm user
            User user = lists.get(0).getUserId();
            request.setAttribute("user", user);
            return user;
        }
        // không tìm thấy thì trả về null
        return null;

    }
    
    private String getToken(HttpServletRequest request)
    {
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("token")) {
                return cookies[i].getValue();
            }
        }        
        return null;
    }
}
