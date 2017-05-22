package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.AccessToken;
import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.DevelopmentType;
import com.se313h21.j2eeweb.model.Experience;
import com.se313h21.j2eeweb.model.Image;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.Profile;
import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import com.se313h21.j2eeweb.model.UserRole;
import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import com.se313h21.j2eeweb.model.UserTagBookmark;
import com.se313h21.j2eeweb.model.UserWork;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:56")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Double> lastLogin;
    public static volatile CollectionAttribute<User, UserSubjectBookmark> userSubjectBookmarkCollection;
    public static volatile CollectionAttribute<User, Comment> commentCollection;
    public static volatile CollectionAttribute<User, Experience> experienceCollection;
    public static volatile CollectionAttribute<User, Subject> subjectCollection;
    public static volatile CollectionAttribute<User, DevelopmentType> developmentTypeCollection;
    public static volatile SingularAttribute<User, String> password;
    public static volatile CollectionAttribute<User, AccessToken> accessTokenCollection;
    public static volatile CollectionAttribute<User, Post> postCollection;
    public static volatile CollectionAttribute<User, Image> imageCollection;
    public static volatile CollectionAttribute<User, UserTagBookmark> userTagBookmarkCollection;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, UserRole> userRoleId;
    public static volatile CollectionAttribute<User, UserPostBookmark> userPostBookmarkCollection;
    public static volatile CollectionAttribute<User, UserWork> userWorkCollection;
    public static volatile CollectionAttribute<User, SeekingJob> seekingJobCollection;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> username;
    public static volatile CollectionAttribute<User, Profile> profileCollection;

}