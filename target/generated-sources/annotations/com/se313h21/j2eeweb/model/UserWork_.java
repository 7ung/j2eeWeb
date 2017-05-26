package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.User;
import com.se313h21.j2eeweb.model.UserWorkPK;
import com.se313h21.j2eeweb.model.Work;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:28:52")
@StaticMetamodel(UserWork.class)
public class UserWork_ { 

    public static volatile SingularAttribute<UserWork, String> role;
    public static volatile SingularAttribute<UserWork, UserWorkPK> userWorkPK;
    public static volatile SingularAttribute<UserWork, Date> endDate;
    public static volatile SingularAttribute<UserWork, Work> work;
    public static volatile SingularAttribute<UserWork, User> user;
    public static volatile SingularAttribute<UserWork, Date> startDate;

}