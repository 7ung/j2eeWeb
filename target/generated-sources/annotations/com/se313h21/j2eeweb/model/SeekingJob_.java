package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.DevelopmentType;
import com.se313h21.j2eeweb.model.Seniority;
import com.se313h21.j2eeweb.model.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:28:52")
@StaticMetamodel(SeekingJob.class)
public class SeekingJob_ { 

    public static volatile SingularAttribute<SeekingJob, Integer> maxSalary;
    public static volatile SingularAttribute<SeekingJob, Integer> view;
    public static volatile SingularAttribute<SeekingJob, DevelopmentType> developmentTypeId;
    public static volatile SingularAttribute<SeekingJob, String> location;
    public static volatile SingularAttribute<SeekingJob, Seniority> seniorityId;
    public static volatile SingularAttribute<SeekingJob, Integer> id;
    public static volatile SingularAttribute<SeekingJob, Integer> minSalary;
    public static volatile SingularAttribute<SeekingJob, Boolean> isActive;
    public static volatile SingularAttribute<SeekingJob, User> userId;
    public static volatile SingularAttribute<SeekingJob, Double> createDate;

}