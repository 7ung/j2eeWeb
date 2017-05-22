package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.PostImage;
import com.se313h21.j2eeweb.model.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-11T15:38:55")
@StaticMetamodel(Image.class)
public class Image_ { 

    public static volatile SingularAttribute<Image, Date> date;
    public static volatile SingularAttribute<Image, String> name;
    public static volatile SingularAttribute<Image, String> description;
    public static volatile SingularAttribute<Image, Integer> id;
    public static volatile SingularAttribute<Image, User> userId;
    public static volatile CollectionAttribute<Image, PostImage> postImageCollection;
    public static volatile SingularAttribute<Image, String> url;

}