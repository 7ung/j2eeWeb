package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(AccessToken.class)
public class AccessToken_ { 

    public static volatile SingularAttribute<AccessToken, Double> expired;
    public static volatile SingularAttribute<AccessToken, Integer> id;
    public static volatile SingularAttribute<AccessToken, String> accessToken;
    public static volatile SingularAttribute<AccessToken, User> userId;

}