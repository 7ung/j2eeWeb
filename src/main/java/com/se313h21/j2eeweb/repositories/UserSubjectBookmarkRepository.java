/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import com.se313h21.j2eeweb.model.UserSubjectBookmarkPK;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Stevie
 */
public interface UserSubjectBookmarkRepository extends JpaRepository<UserSubjectBookmark, UserSubjectBookmarkPK>{
    
    public List<UserSubjectBookmark> findByUserId(Integer userId);

    public boolean existsByUserIdAndSubjectId(Integer userId, Integer subjectId);
    
    public Long countBySubjectId(Integer subjectId);
    
    public Long countByUserId(Integer userId);

    public List<UserSubjectBookmark> findByUserIdAndSubjectId(Integer userId, Integer id);

    public void deleteBySubjectId(Integer id);

}
