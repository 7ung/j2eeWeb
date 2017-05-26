package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.UserWork;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(Work.class)
public class Work_ { 

    public static volatile SingularAttribute<Work, String> code;
    public static volatile SingularAttribute<Work, String> name;
    public static volatile SingularAttribute<Work, Integer> id;
    public static volatile CollectionAttribute<Work, UserWork> userWorkCollection;

}