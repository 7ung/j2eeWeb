/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.google.common.collect.Lists;
import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.DevelopmentType;
import com.se313h21.j2eeweb.model.Experience;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.Seniority;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserRole;
import com.se313h21.j2eeweb.repositories.SeekingJobRepository;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 *
 * @author quytocngheo
 */
@Service
public class SeekingJobDAO {
    @Autowired 
    SeekingJobRepository repo;
    
    public Boolean checkSearch(SeekingJob item, String keyword) {
        String newKey= keyword.toLowerCase();
        Collection<Experience> listExperience = item.getUserId().getExperienceCollection();
        for (Experience element:listExperience) {
            System.out.print("name: "+element.getName().toLowerCase());
            if(element.getName().toLowerCase().contains(newKey)) return true;
        }
        return false;
    }
    
    public List<SeekingJob> refactorList(List<SeekingJob> list1, List<SeekingJob> list2) {
        List<SeekingJob> result = new ArrayList<>(list1);
        for (SeekingJob element:list2) {
            if(!checkContain(result,element)) result.add(element);
        }
        return result;
    }
    
    public Boolean checkContain(List<SeekingJob> list, SeekingJob item) {
        for (SeekingJob element:list) {
            if(element.getId()==item.getId()) return true;
        }
        return false;
    }
    
    public List<SeekingJob> searchInExperience(String keyword) {
        
        List<SeekingJob> list1 = Lists.newArrayList(repo.findByIsActive(true,new Sort(Sort.Direction.DESC, "id")).iterator());
        List<SeekingJob> result = new ArrayList<>();
        for (SeekingJob element:list1) {
            if(checkSearch(element,keyword)) result.add(element);
        }
        
       
       System.out.printf("key "+keyword);
        return result;
    }
    
    public List<SeekingJob> search(String keyword) {
        List<SeekingJob> list1 = searchInExperience(keyword);
        List<SeekingJob> list2 = Lists.newArrayList(repo.findBySearchTerm(keyword,new Sort(Sort.Direction.DESC, "id")).iterator());
        System.out.printf("so luong query %d", list2.size());
        List<SeekingJob> result = refactorList(list1,list2);
        System.out.printf("so luong result %d", result.size());
        return result;
    }
    public SeekingJob create(String location, Integer minSalary, Integer maxSalary, DevelopmentType developmentTypeId, Seniority seniorityId, User userId){

        SeekingJob seekingJob = new SeekingJob(location, minSalary, maxSalary, developmentTypeId, seniorityId, userId);
        seekingJob = repo.save(seekingJob);
        return seekingJob;
    }
    public SeekingJob update(SeekingJob seek) {
        return repo.save(seek);
    }
    
    public SeekingJob findById(int Id) {
        return repo.findById(Id).get(0);
    }
    public List<SeekingJob> findByUser(User user) {
        List<SeekingJob> result = new ArrayList<>();
        List<SeekingJob> tamp = repo.findByUserId(user);
         for (SeekingJob item : tamp) {
            if(item.getIsActive()) {
                result.add(item);
            }
        }
        return result;
    }
}
