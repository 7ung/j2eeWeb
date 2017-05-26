package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmarkPK;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(UserPostBookmark.class)
public class UserPostBookmark_ { 

    public static volatile SingularAttribute<UserPostBookmark, Date> date;
    public static volatile SingularAttribute<UserPostBookmark, String> note;
    public static volatile SingularAttribute<UserPostBookmark, UserPostBookmarkPK> userPostBookmarkPK;
    public static volatile SingularAttribute<UserPostBookmark, Post> post;
    public static volatile SingularAttribute<UserPostBookmark, User> user;

}