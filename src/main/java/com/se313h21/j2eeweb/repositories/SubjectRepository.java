/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import java.awt.print.Pageable;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Stevie
 */
public interface SubjectRepository  extends JpaRepository<Subject, Integer>{
    public List<Subject> findByUserId(User user);
    public List<Subject> findByTitle(String title);
    public List<Subject> findByUserIdAndTitle(User user, String title);
    
    public List<Subject> findFirst6ByUserIdAndTitleContaining(User userid, String title, Sort sort);

    @Query(value = "select * from subject left join user_subject_bookmark on subject.id = user_subject_bookmark.subject_id "
            + "where user_subject_bookmark.user_id = ?1", nativeQuery  = true)
    public List<Subject> findSubjectByFollowUserId( Integer userId);

    public List<Subject> findByUserIdNot(User user);
   
    
}
