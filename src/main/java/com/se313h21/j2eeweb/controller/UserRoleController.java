/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.model.UserRole;
import com.se313h21.j2eeweb.repositories.UserRoleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author huynphu
 */
@Controller
@Service
public class UserRoleController {
    @Autowired(required = false)
    UserRoleRepository repo;
    
    @RequestMapping(value="/user-role", method=RequestMethod.GET)
    public String index(ModelMap model)
    {
        List<UserRole> userroles = Lists.newArrayList(repo.findAll().iterator());
        model.addAttribute("code", userroles.get(0).getCode());
        return "user-role";
    }
}
