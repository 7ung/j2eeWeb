/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.repositories.SeekingJobRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author quytocngheo
 */
@Controller
@Service
public class SeekingJobController {
    
     @Autowired(required = false)
    SeekingJobRepository repo;
    
     @RequestMapping(value="/seeking-job", method=RequestMethod.GET)
    public String index(ModelMap model)
    {
        List<SeekingJob> seekingJobs = Lists.newArrayList(repo.findAll().iterator());
        //model.addAttribute("code", seekingJobs.get(0).getCode());
        return "seeking-job";
    }
}
