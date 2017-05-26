package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Tag;
import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserTagBookmarkPK;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(UserTagBookmark.class)
public class UserTagBookmark_ { 

    public static volatile SingularAttribute<UserTagBookmark, Date> date;
    public static volatile SingularAttribute<UserTagBookmark, UserTagBookmarkPK> userTagBookmarkPK;
    public static volatile SingularAttribute<UserTagBookmark, Tag> tag;
    public static volatile SingularAttribute<UserTagBookmark, User> user;

}