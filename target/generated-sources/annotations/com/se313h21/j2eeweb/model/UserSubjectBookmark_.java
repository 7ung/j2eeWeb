package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Subject;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserSubjectBookmarkPK;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:56")
@StaticMetamodel(UserSubjectBookmark.class)
public class UserSubjectBookmark_ { 

    public static volatile SingularAttribute<UserSubjectBookmark, Date> date;
    public static volatile SingularAttribute<UserSubjectBookmark, UserSubjectBookmarkPK> userSubjectBookmarkPK;
    public static volatile SingularAttribute<UserSubjectBookmark, Subject> subject;
    public static volatile SingularAttribute<UserSubjectBookmark, User> user;

}