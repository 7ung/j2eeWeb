package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Comment;
import com.se313h21.j2eeweb.model.PostImage;
import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserPostBookmark;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:28:52")
@StaticMetamodel(Post.class)
public class Post_ { 

    public static volatile SingularAttribute<Post, Double> date;
    public static volatile CollectionAttribute<Post, Tag> tagCollection;
    public static volatile SingularAttribute<Post, String> code;
    public static volatile CollectionAttribute<Post, Comment> commentCollection;
    public static volatile SingularAttribute<Post, String> title;
    public static volatile CollectionAttribute<Post, PostImage> postImageCollection;
    public static volatile SingularAttribute<Post, User> userId;
    public static volatile SingularAttribute<Post, String> content;
    public static volatile SingularAttribute<Post, Subject> subjectId;
    public static volatile SingularAttribute<Post, Integer> view;
    public static volatile SingularAttribute<Post, Integer> id;
    public static volatile CollectionAttribute<Post, UserPostBookmark> userPostBookmarkCollection;
    public static volatile SingularAttribute<Post, String> status;

}