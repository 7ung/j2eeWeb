package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserSubjectBookmark;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:55")
@StaticMetamodel(Subject.class)
public class Subject_ { 

    public static volatile SingularAttribute<Subject, Double> date;
    public static volatile SingularAttribute<Subject, Integer> view;
    public static volatile SingularAttribute<Subject, String> code;
    public static volatile CollectionAttribute<Subject, Post> postCollection;
    public static volatile CollectionAttribute<Subject, UserSubjectBookmark> userSubjectBookmarkCollection;
    public static volatile SingularAttribute<Subject, String> description;
    public static volatile SingularAttribute<Subject, Integer> id;
    public static volatile SingularAttribute<Subject, String> title;
    public static volatile SingularAttribute<Subject, User> userId;

}