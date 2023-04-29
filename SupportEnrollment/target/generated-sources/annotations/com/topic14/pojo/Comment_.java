package com.topic14.pojo;

import com.topic14.pojo.Post;
import com.topic14.pojo.Reply;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-29T07:19:52")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, Integer> id;
    public static volatile SingularAttribute<Comment, Post> postId;
    public static volatile SetAttribute<Comment, Reply> replySet;
    public static volatile SingularAttribute<Comment, User> userId;
    public static volatile SingularAttribute<Comment, String> content;
    public static volatile SingularAttribute<Comment, Integer> parentCmtid;
    public static volatile SingularAttribute<Comment, Date> createDate;

}