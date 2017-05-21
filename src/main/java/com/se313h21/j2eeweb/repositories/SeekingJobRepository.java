/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.User;
import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
/**
 *
 * @author quytocngheo
 */


public interface SeekingJobRepository extends JpaRepository<SeekingJob, Integer> {
    public List<SeekingJob> findByLocation(String location);
    public List<SeekingJob> findByIsActive(Boolean active,Sort sort);
    public List<SeekingJob> findAll();
     @Query("SELECT t FROM SeekingJob t WHERE " +
            "LOWER(t.location) LIKE LOWER(CONCAT('%',:searchTerm, '%')) OR "  +
            "LOWER(t.developmentTypeId.name) LIKE LOWER(CONCAT('%',:searchTerm, '%')) OR "  +
            "LOWER(t.seniorityId.name) LIKE LOWER(CONCAT('%',:searchTerm, '%')) AND "  +
            "t.isActive = true")
    List<SeekingJob> findBySearchTerm(@Param("searchTerm") String searchTerm,Sort sort);
    List<SeekingJob> findById(int id);
    List<SeekingJob> findByUserId(User userId);
}
