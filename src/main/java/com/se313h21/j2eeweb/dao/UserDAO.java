/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.controller.utils.Hashing;
import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.model.UserRole;
import com.se313h21.j2eeweb.repositories.UserRepository;
import com.se313h21.j2eeweb.repositories.Utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class UserDAO {

    @Autowired
    UserRepository repo;

    User user;

    public User get(String username, String password) {
        password = Hashing.generateHash(password);
        List<User> users = repo.findByUsernameAndPassword(username, password);

        if (users.isEmpty()) {
            return (user = null);
        } else {
            return (user = users.get(0));
        }
    }

    public User create(String username, String password, String email) {
        password = Hashing.generateHash(password);
        User user = new User(-1, username, password, email);
        user.setUserRoleId(new UserRole(1));

        user = repo.save(user);
        Profile profile = new Profile(-1, username, "male");
        Collection<Profile> profiles = user.getProfileCollection();
        profile.setUserId(user);
        profiles.add(profile);
        user.setProfileCollection(profiles);
        user = repo.save(user);
        return (this.user = user);
    }

    public User get() {
        return user;
    }

    public User get(int id) {
        return repo.findOne(id);
    }

    public void updateLastLogin() {
        user.setLastLogin(Utils.currentTimestamp());
        repo.save(user);
    }
    public void updateLastLogin(User user) {
        user.setLastLogin(Utils.currentTimestamp());
        repo.save(user);
    }

    public List<SeekingJob> getSeekingJobActive(User user) {
        List<SeekingJob> result = new ArrayList<>();
        List<SeekingJob> tamp = (List<SeekingJob>) user.getSeekingJobCollection();
        for (SeekingJob item : tamp) {
            if (item.getIsActive()) {
                result.add(item);
            }
        }
        return result;
    }


}
