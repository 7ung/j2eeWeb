/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
import com.se313h21.j2eeweb.model.SeekingJob;
/**
 *
 * @author quytocngheo
 */
public interface SeekingJobRepository extends JpaRepository<SeekingJob, Integer> {
    
}
