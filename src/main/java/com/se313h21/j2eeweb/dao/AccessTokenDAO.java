/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.AccessTokenRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class AccessTokenDAO {

    private static String TAG = "AccessTokenDAO";
    
    /**
     * Thời gian sống của token (12 giờ) tính bằng giây
     */
    public static double TOKEN_EXPIRED = (12 * 60 * 60);// 12 giờ
    
    @Autowired
    AccessTokenRepository accessTokenRepo;
    
    AccessToken accessToken;
    
    /**
     * Tìm token từ cookie và session. 
     * Load user. 
     * 
     * @param request truyền req, res từ controller vào
     * @param response
     * @return User nếu tìm thấy, return null nếu token không hợp lệ hoặc empty
     */
    public User determineUser(HttpServletRequest request, HttpServletResponse response)
    {
        String token = CookieUtils.getToken(request);       // lấy token từ cookie
        if (Strings.isNullOrEmpty(token)){
            System.out.println(TAG + ": Can not find token from cookie. ");
            // nếu token từ cookie null thì lấy token từ session
            token = (String) request.getSession().getAttribute("token");
        }
        // nếu token từ session vẫn null thì trả về null
        if (Strings.isNullOrEmpty(token)){
            System.out.println(TAG + ": Can not find token from session. ");
            return null;
        }
        System.out.println(TAG + ": Found token from session. Token String = " + token);

        // nếu có token string thì tìm token bằng token string
        List<AccessToken> lists = accessTokenRepo.findByAccessToken(token.trim());
        if (lists.isEmpty()) {
            
            System.out.println(TAG + ": Can not find access token by token string");
            request.getSession().removeAttribute("token");
            System.out.println(TAG + ": Removed token from session");

            // không tìm thấy thì trả về null
            return null;
        }
        accessToken = lists.get(0);
        if (accessToken.getExpired() < Utils.currentTimestamp()){
            // token hết hạn => xoá đối tượng token và return null
            accessTokenRepo.delete(accessToken);
            request.getSession().removeAttribute("token");
            return null;
        }
        // tìm user
        User user = accessToken.getUserId();

        return user;

    }
    
    /**
     * Tạo token cho user hoặc load token nếu đã tồn tại.
     * 
     * @param user
     * @return 
     */
    public AccessToken get(User user){
        List<AccessToken> tokens = accessTokenRepo.findByUserId(user);
        if (tokens.isEmpty()) {
            accessToken = generateToken(user);
            accessToken = accessTokenRepo.save(accessToken);
        }
        else {
            accessToken = tokens.get(0);
        }
        return accessToken;
    }
    
    
    /**
     * update thời gian sống cho token sau khi login.
     * (user có 12 giờ token kể từ khi login thành công)
     * @return 
     */
    public boolean updateExpiredTime(){
        accessToken.setExpired(TOKEN_EXPIRED + Utils.currentTimestamp());
        return (accessTokenRepo.save(accessToken) != null);
    }
    
    
    private AccessToken generateToken(User user){
        String originTokenString = user.getId() + Hashing.randomToken();
        AccessToken token = new AccessToken();
        token.setUserId(user);
        token.setAccessToken(Hashing.generateHash(originTokenString));
        token.setExpired(TOKEN_EXPIRED + Utils.currentTimestamp());
        return token;
    }
}
