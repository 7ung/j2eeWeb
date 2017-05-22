package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.SeekingJob;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:55")
@StaticMetamodel(Seniority.class)
public class Seniority_ { 

    public static volatile SingularAttribute<Seniority, String> code;
    public static volatile SingularAttribute<Seniority, String> name;
    public static volatile SingularAttribute<Seniority, String> description;
    public static volatile SingularAttribute<Seniority, Integer> id;
    public static volatile CollectionAttribute<Seniority, SeekingJob> seekingJobCollection;

}