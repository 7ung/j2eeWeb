package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(Experience.class)
public class Experience_ { 

    public static volatile SingularAttribute<Experience, String> code;
    public static volatile CollectionAttribute<Experience, User> userCollection;
    public static volatile SingularAttribute<Experience, String> name;
    public static volatile SingularAttribute<Experience, Integer> id;

}