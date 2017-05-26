package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.UserTagBookmark;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(Tag.class)
public class Tag_ { 

    public static volatile SingularAttribute<Tag, String> code;
    public static volatile CollectionAttribute<Tag, Post> postCollection;
    public static volatile SingularAttribute<Tag, String> name;
    public static volatile CollectionAttribute<Tag, UserTagBookmark> userTagBookmarkCollection;
    public static volatile SingularAttribute<Tag, Integer> id;

}