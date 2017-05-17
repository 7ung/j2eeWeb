/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.controller;

import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.dao.SeekingJobDAO;
import com.se313h21.j2eeweb.dao.UserDAO;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.DevelopmentType;
import com.se313h21.j2eeweb.model.Seniority;
import com.se313h21.j2eeweb.repositories.DevelopmentTypeRepository;
import com.se313h21.j2eeweb.repositories.SeekingJobRepository;
import com.se313h21.j2eeweb.repositories.SeniorityRepository;
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
import com.se313h21.j2eeweb.repositories.Utils;

/**
 *
 * @author quytocngheo
 */
@Controller
@Service
public class CreateSeekingJobController extends BaseAuthorizationUserController {
     @Autowired(required = false)
    SeekingJobRepository repo;
     
     @Autowired(required = false)
    SeniorityRepository repoSe;
     
     @Autowired(required = false)
    DevelopmentTypeRepository repoDev;
     
     @Autowired
    SeekingJobDAO seekDao;
     
      @Autowired
    UserDAO userDao;
     
     
    
      public enum eCreateSeekingJobStatus{
        SUCCESS (0, "Create success."), 
        MIN_SALARY_EMPTY (1, "Create fail!!! Min salary must not empty."),
        MAX_SALARY_EMPTY (2, "Create fail!!! Max salary must not empty."),
        LOCATION_EMPTY (3, "Create fail!!! Location must not empty."),
        MIN_SALARY_NOT_NUMBER (4, "Create fail!!! Min salary must be number."),
        MIN_SALARY_LOWER_0 (5, "Create fail!!! Min salary must be higher than 0."),
        MAX_SALARY_LOWER_MIN (6, "Create fail!!! Max salary must be higher than min salary."),
        DEVELOPMENT_TYPE_EMPTY (7,"Create fail!!! You must choose a development type."),
        SENIORITY_EMPTY (8, "Create fail!!! You must choose a seniority."),
        MAX_SALARY_NOT_NUMBER (9, "Create fail!!! Max salary must be number."),
        FAIL (10, "Create fail!!! Something went wrong.");
        private int value;
        private String message;
        
        private eCreateSeekingJobStatus(int value, String message) {
            this.value = value;
            this.message = message;
        }
        public int getValue() {
            return value;
        }
        public String getMessage(){
            return this.message;
        }
    }
     
//     @RequestMapping(value="/create-seeking-job", method=RequestMethod.GET)
//    public String index(ModelMap model)
//    {
//         User user = super.fetchUser(request, response);
//        if (user == null) {
//            return ProfileController.redirect;
//        }
//        List<SeekingJob> seekingJobs = Lists.newArrayList(repo.findByIsActive(true,new Sort(Sort.Direction.DESC, "id")).iterator());
//        model.addAttribute("listseekingJob", seekingJobs);
//        
//        return "create-seeking-job";
//    }
     
     @RequestMapping(value="/create-seeking-job", method=RequestMethod.GET)
    public String profile_show(HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model){
        User user = super.fetchUser(request, response);
        if (user == null) {
            return ProfileController.redirect;
        }
        List<DevelopmentType> listDevelope = (List<DevelopmentType>) user.getDevelopmentTypeCollection();
        model.addAttribute("developmentTypeCollection", listDevelope);
        List<Seniority> seniorities = repoSe.findAll();
        model.addAttribute("seniorities", seniorities);
        List<SeekingJob> listSeekingJob = userDao.getSeekingJobActive(user);
        model.addAttribute("devLabel", "Development Type");
        model.addAttribute("seniorityLabel", "Seniority");
        model.addAttribute("listseekingJob", listSeekingJob);
        model.addAttribute("create", "create");
        return "create-seeking-job";
    }
    
    @RequestMapping(value="/create-seeking-job", method=RequestMethod.POST)
    public String registration_post(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        User user = super.fetchUser(request, response);
        String create = request.getParameter("create");
        
        String developmentType = request.getParameter("developmentType");
        System.out.printf("abcd "+developmentType.trim());
        if(developmentType.isEmpty()) {
            model.addAttribute("status", eCreateSeekingJobStatus.DEVELOPMENT_TYPE_EMPTY.message);
            return doneCreate(user, model);
        }
        String minSalary = request.getParameter("minSalary");
        if(minSalary.isEmpty()) {
            model.addAttribute("status", eCreateSeekingJobStatus.MIN_SALARY_EMPTY.message);
            return doneCreate(user, model);
        }
        if(!Utils.isInteger(minSalary)) {
            model.addAttribute("status", eCreateSeekingJobStatus.MIN_SALARY_NOT_NUMBER.message);
            return doneCreate(user, model);
        }
        int minSa = Integer.parseInt(minSalary);
        if(minSa <= 0) {
            model.addAttribute("status", eCreateSeekingJobStatus.MIN_SALARY_LOWER_0.message);
            return doneCreate(user, model);
        }
        String maxSalary = request.getParameter("maxSalary");
        if(maxSalary.isEmpty()) {
            model.addAttribute("status", eCreateSeekingJobStatus.MAX_SALARY_EMPTY.message);
            return doneCreate(user, model);
        }
        if(!Utils.isInteger(maxSalary)) {
            model.addAttribute("status", eCreateSeekingJobStatus.MAX_SALARY_NOT_NUMBER.message);
            return doneCreate(user, model);
        }
        int maxSa = Integer.parseInt(maxSalary);
        if(maxSa <= minSa) {
            model.addAttribute("status", eCreateSeekingJobStatus.MAX_SALARY_LOWER_MIN.message);
            return doneCreate(user, model);
        }
        String seniority = request.getParameter("seniority");
        if(seniority.isEmpty()) {
            model.addAttribute("status", eCreateSeekingJobStatus.SENIORITY_EMPTY.message);
            return doneCreate(user, model);
        }
        String location = request.getParameter("location");
        if(location.isEmpty()) {
            model.addAttribute("status", eCreateSeekingJobStatus.LOCATION_EMPTY.message);
            return doneCreate(user, model);
        }
        DevelopmentType devType = repoDev.findByName(developmentType.trim()).get(0);
        System.out.printf("developmentType "+devType.getName());
        Seniority sen = repoSe.findByName(seniority.trim()).get(0);
        System.out.printf("seniority "+sen.getName());
        SeekingJob tamp = null;
        if(create.compareTo("create")==0) {
            tamp =  seekDao.create(location, minSa, maxSa, devType, sen, user);
        } else {
            String idStr = request.getParameter("seekCreateID");
            int id= Integer.parseInt(idStr);
            tamp = repo.findById(id).get(0);
            tamp.setLocation(location);
            tamp.setMaxSalary(maxSa);
            tamp.setMinSalary(minSa);
            tamp.setDevelopmentTypeId(devType);
            tamp.setSeniorityId(sen);
            tamp.setUserId(user);
            tamp = seekDao.update(tamp);
            
        }
        
        if (tamp!=null) {
            model.addAttribute("status", eCreateSeekingJobStatus.SUCCESS.message);
        } else {
            model.addAttribute("status", eCreateSeekingJobStatus.FAIL.message);
        }
        //List<SeekingJob> listseekingJob = Lists.newArrayList(repo.findBySearchTerm(searchKeyword,new Sort(Sort.Direction.DESC, "id")).iterator());
//       List<SeekingJob> listseekingJob = seekDao.search(searchKeyword);
//        for (SeekingJob item : listseekingJob) {
//             System.out.printf("anh chang dep trai %d", item.getId());
//        }
//        request.setAttribute("listseekingJob", listseekingJob);
//        //model.addAttribute("listseekingJob", listseekingJob);
        
        return doneCreate(user,model);
    }
    
    String doneCreate(User user, ModelMap model) {
        List<DevelopmentType> listDevelope = (List<DevelopmentType>) user.getDevelopmentTypeCollection();
        model.addAttribute("developmentTypeCollection", listDevelope);
        List<Seniority> seniorities = repoSe.findAll();
        model.addAttribute("seniorities", seniorities);
        List<SeekingJob> listSeekingJob = (List<SeekingJob>) user.getSeekingJobCollection();
        model.addAttribute("devLabel", "Development Type");
        model.addAttribute("seniorityLabel", "Seniority");
        model.addAttribute("listseekingJob", listSeekingJob);
        model.addAttribute("create", "create");
        return "create-seeking-job";
    }
    
    @RequestMapping(value="/edit-seeking-job", method=RequestMethod.POST)
    public String seekingJob_edit(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String idStr = request.getParameter("seekID");
        int id= Integer.parseInt(idStr);
        SeekingJob tamp = repo.findById(id).get(0);
        model.addAttribute("devLabel", tamp.getDevelopmentTypeId().getName());
        model.addAttribute("developmentType", tamp.getDevelopmentTypeId().getName());
        model.addAttribute("minSalary", tamp.getMinSalary());
        model.addAttribute("maxSalary", tamp.getMaxSalary());
        model.addAttribute("seniority", tamp.getSeniorityId().getName());
        model.addAttribute("seniorityLabel", tamp.getSeniorityId().getName());
        model.addAttribute("location", tamp.getLocation());        
        model.addAttribute("create", "update");
        model.addAttribute("seekCreateID", tamp.getId());
        User user = super.fetchUser(request, response);
        List<SeekingJob> listSeekingJob = userDao.getSeekingJobActive(user);
        model.addAttribute("listseekingJob", listSeekingJob);
        System.out.printf("van tien"+idStr);
        return "create-seeking-job";
    }
    
    @RequestMapping(value="/deactive-seeking-job", method=RequestMethod.POST)
    public String deactive_edit(HttpServletRequest request,
            HttpServletResponse response, ModelMap model) {
        String idStr = request.getParameter("seekID");
        int id= Integer.parseInt(idStr);
        SeekingJob tamp = repo.findById(id).get(0);
        tamp.setIsActive(false);
        seekDao.update(tamp);
        User user = super.fetchUser(request, response);
        List<SeekingJob> listSeekingJob = userDao.getSeekingJobActive(user);
        model.addAttribute("listseekingJob", listSeekingJob);
        System.out.printf("van tien"+idStr);
        return "create-seeking-job";
    }
}
