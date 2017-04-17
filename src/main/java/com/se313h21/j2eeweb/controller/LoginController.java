/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.base.Strings;
import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.repositories.AccessTokenRepository;
import com.se313h21.j2eeweb.repositories.UserRepository;
import java.io.Console;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author Stevie
 */
@Controller
@Service
//@SessionAttributes("token")
public class LoginController {
    /**
     * Current account for test: 
     * jobjob - 123123
     * 123 - 123
     */
    @Autowired(required = false)
    UserRepository repo;
    
    @Autowired(required = false)
    AccessTokenRepository accessTokenRepo;
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String registration_get(
            ModelMap model){

        model.addAttribute("startPage", 0);
        return "registration";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String login(
            HttpServletRequest request,
            HttpServletResponse response, ModelMap model,
            @ModelAttribute("remember") String remember){
        
        // Lấy thông tin parse từ post params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String hashedPassword = Hashing.generateHash(password);
//        String redirectPath = request.getParameter("redirect_path");
        String redirectPath = (String) request.getSession().getAttribute("redirect_login");
        model.addAttribute("redirectPath", redirectPath);
        
        // Kiểm tra có tồn tại cặp giá trị username - password
        List<User> users = repo.findByUsernameAndPassword(username, hashedPassword);
        
        // Nếu thông tin đăng nhập đúng sẽ tìm được 1 user => not empty
        if (users.isEmpty()){
            // Đăng nhập sai. 
            model.addAttribute("status", RegistrationController.eRegistrationStatus.LOGIN_FAIL);
            model.addAttribute("startPage", 0); // 1 => register;  0 => login
            return "registration";
        }
        else {
            // Đăng nhập thành công.

            // Tạo token. Nếu đã có token thì không tạo mới.
            User user = users.get(0);
            List<AccessToken> tokens = accessTokenRepo.findByUserId(user);
            AccessToken token = null;

            if (tokens.isEmpty())
                token = createToken(user);
            else {
                token = tokens.get(0);
            }
            
            // token expire sau 2 giờ.
            // thời điểm hiện tại tính bằng giây 
            Date now = new Date();
            long after2h = now.getTime() + 12 * 60 * 60; // 2 giờ
            Timestamp timestamp = new Timestamp(after2h);
            token.setExpired(timestamp.getTime());
            
            // update token expired
            token = accessTokenRepo.save(token);
            
            if (remember.equals("on")){
                Cookie cookie = new Cookie("token", token.getAccessToken());
                cookie.setMaxAge(12 * 60 * 59); // should be 59 rather than 60
                response.addCookie(cookie);
            }
        
            request.getSession().setAttribute("token", token.getAccessToken());
            
            if (Strings.isNullOrEmpty(redirectPath) == false){
                request.getSession().removeAttribute("redirect_login");
                return redirectPath;
            }
            else {
                model.addAttribute("status", RegistrationController.eRegistrationStatus.LOGIN_SUCCESS);
                model.addAttribute("startPage", 0); // 1 => register;  0 => login
                return "registration";                
            }
            
        }
        
//        return "registration";
    }
    
    private AccessToken createToken(User user){
            
        String token = "";
        token += user.getId() + Hashing.randomToken();
        AccessToken accessToken = new AccessToken(-1, Hashing.generateHash(token), -1);
        accessToken.setUserId(user);
        accessToken = accessTokenRepo.save(accessToken);
        return accessToken;
    }
   

}
