/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.Seniority;
import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author quytocngheo
 */
public interface SeniorityRepository extends JpaRepository<Seniority, Integer>{
    public List<Seniority> findAll();
    public List<Seniority> findByName(String name);
}
