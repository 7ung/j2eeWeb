package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(Profile.class)
public class Profile_ { 

    public static volatile SingularAttribute<Profile, String> country;
    public static volatile SingularAttribute<Profile, String> gender;
    public static volatile SingularAttribute<Profile, String> displayName;
    public static volatile SingularAttribute<Profile, Date> dob;
    public static volatile SingularAttribute<Profile, Integer> profilePictureId;
    public static volatile SingularAttribute<Profile, String> about;
    public static volatile SingularAttribute<Profile, String> location;
    public static volatile SingularAttribute<Profile, Integer> id;
    public static volatile SingularAttribute<Profile, String> personalLink;
    public static volatile SingularAttribute<Profile, User> userId;

}