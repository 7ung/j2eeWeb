package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.SeekingJob;
import com.se313h21.j2eeweb.model.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:56")
@StaticMetamodel(DevelopmentType.class)
public class DevelopmentType_ { 

    public static volatile SingularAttribute<DevelopmentType, String> code;
    public static volatile CollectionAttribute<DevelopmentType, User> userCollection;
    public static volatile SingularAttribute<DevelopmentType, String> name;
    public static volatile SingularAttribute<DevelopmentType, String> description;
    public static volatile SingularAttribute<DevelopmentType, Integer> id;
    public static volatile CollectionAttribute<DevelopmentType, SeekingJob> seekingJobCollection;

}