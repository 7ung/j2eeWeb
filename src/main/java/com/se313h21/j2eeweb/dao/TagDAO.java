/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.dao;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import com.se313h21.j2eeweb.model.UserTagBookmark;
import com.se313h21.j2eeweb.repositories.TagRepository;
import com.se313h21.j2eeweb.repositories.UserTagBookmarkRepository;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.persistence.metamodel.SingularAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

/**
 *
 * @author Stevie
 */
@Service
public class TagDAO {
    
    @Autowired
    TagRepository tagRepo;
    
    @Autowired
    UserTagBookmarkRepository utbRepo; 
    
    public List<Tag> getTop6(String name){
        List<Tag> tags = tagRepo.findFirst6ByNameContaining(name, new Sort("name"));
        return tags;
    }
    
    public Tag get(String name){
        List<Tag> tags = tagRepo.findByName(name);
        if (tags.isEmpty())
            return create(name);
        return tags.get(0);
    }
    
    public List<Tag> getMany(User user){
        List<UserTagBookmark> userTags = utbRepo.findByUserId(user.getId());
        if (userTags.isEmpty())
            return new ArrayList();
        List<Tag> rs = new ArrayList();
        for (UserTagBookmark t : userTags){
            rs.add(t.getTag());
        }
        return rs;
    }
    
    private Tag create(String name){
        Tag t = new Tag(-1, "-1");
        t.setName(name);
        t = tagRepo.save(t);
        t.setCode(Integer.toHexString(t.getId()));
        t = tagRepo.save(t);
        return t;
    }
    
    public Tag get(int tagId) {
        return tagRepo.findOne(tagId);
    }

    public boolean isUserFollowedTag(User user, Tag tag) {
        return utbRepo.existsByUserIdAndTagId(user.getId(), tag.getId());
    }

    public boolean follow(Tag tag, Integer userId) {
        try{
            UserTagBookmark bookmark = new UserTagBookmark(userId, tag.getId());
            bookmark.setDate(new Date());
            Collection<UserTagBookmark> userBookmarks = tag.getUserTagBookmarkCollection();
            userBookmarks.add(bookmark);
            tag.setUserTagBookmarkCollection(userBookmarks);
            System.out.println("TagDAO@follow: set success" );
            tag = tagRepo.save(tag);
            System.out.println("TagDAO@follow: save success" );

            return true;
        }
        catch(Exception e){
            System.out.println("TagDAO@follow: " + e.getMessage());
            return false;
        }   
    }
    
    public boolean unfollow(Tag tag, Integer userId){
        List<UserTagBookmark> bookmarks = utbRepo.findByUserIdAndTagId(userId, tag.getId());
        if (bookmarks.isEmpty())
            return true;
        try{
            tag.getUserTagBookmarkCollection().remove(bookmarks.get(0));
            tag = tagRepo.save(tag);
            return true;
        }
        catch(Exception e){
            return false;
        }           
    }
}
