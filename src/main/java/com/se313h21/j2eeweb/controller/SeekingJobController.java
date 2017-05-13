/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.dao.PostDAO;
import com.se313h21.j2eeweb.dao.SeekingJobDAO;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.repositories.SeekingJobRepository;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author quytocngheo
 */
@Controller
@Service
public class SeekingJobController {
    private static final Logger LOGGER = Logger.getLogger( SeekingJobController.class.getName() );
     @Autowired(required = false)
    SeekingJobRepository repo;
     
     @Autowired
    SeekingJobDAO seekDao;
    
     @RequestMapping(value="/seeking-job", method=RequestMethod.GET)
    public String index(ModelMap model)
    {
        List<SeekingJob> seekingJobs = Lists.newArrayList(repo.findByIsActive(true,new Sort(Sort.Direction.DESC, "id")).iterator());
        model.addAttribute("listseekingJob", seekingJobs);
        
        return "seeking-job";
    }
    
    @RequestMapping(value="/seeking-job", method=RequestMethod.POST)
    public String registration_post(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String searchKeyword = request.getParameter("password");
        System.out.print("dmm"+searchKeyword);
        //List<SeekingJob> listseekingJob = Lists.newArrayList(repo.findBySearchTerm(searchKeyword,new Sort(Sort.Direction.DESC, "id")).iterator());
       List<SeekingJob> listseekingJob = seekDao.search(searchKeyword);
        LOGGER.log( Level.FINE, "processing {0} entries in loop", "abc" );
        for (SeekingJob item : listseekingJob) {
             System.out.printf("anh chang dep trai %d", item.getId());
        }
        request.setAttribute("listseekingJob", listseekingJob);
        //model.addAttribute("listseekingJob", listseekingJob);
        return "/seeking-job";
    } 
    
  
    
    
}
