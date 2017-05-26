package com.se313h21.j2eeweb.model;

import com.se313h21.j2eeweb.model.Image;
import com.se313h21.j2eeweb.model.Post;
import com.se313h21.j2eeweb.model.PostImagePK;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-05-26T16:56:13")
@StaticMetamodel(PostImage.class)
public class PostImage_ { 

    public static volatile SingularAttribute<PostImage, Image> image;
    public static volatile SingularAttribute<PostImage, Post> post;
    public static volatile SingularAttribute<PostImage, PostImagePK> postImagePK;
    public static volatile SingularAttribute<PostImage, String> replaceCode;

}