package com.topic14.pojo;

import com.topic14.pojo.Comment;
import com.topic14.pojo.Post;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-05-03T21:14:20")
@StaticMetamodel(Reply.class)
public class Reply_ { 

    public static volatile SingularAttribute<Reply, Date> createdDate;
    public static volatile SingularAttribute<Reply, Integer> id;
    public static volatile SingularAttribute<Reply, Post> postId;
    public static volatile SingularAttribute<Reply, User> userId;
    public static volatile SingularAttribute<Reply, String> content;
    public static volatile SingularAttribute<Reply, Comment> parentId;

}