package com.topic14.pojo;

import com.topic14.pojo.Category;
import com.topic14.pojo.Comment;
import com.topic14.pojo.Reply;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-29T07:19:52")
@StaticMetamodel(Post.class)
public class Post_ { 

    public static volatile SingularAttribute<Post, Date> modifyDate;
    public static volatile SingularAttribute<Post, Date> endDate;
    public static volatile SingularAttribute<Post, String> title;
    public static volatile SingularAttribute<Post, Boolean> isActive;
    public static volatile SingularAttribute<Post, User> userId;
    public static volatile SingularAttribute<Post, String> content;
    public static volatile SingularAttribute<Post, String> url;
    public static volatile SetAttribute<Post, Comment> commentSet;
    public static volatile SingularAttribute<Post, Integer> id;
    public static volatile SetAttribute<Post, Reply> replySet;
    public static volatile SingularAttribute<Post, Date> startDate;
    public static volatile SingularAttribute<Post, Category> categoryId;
    public static volatile SingularAttribute<Post, Date> createDate;

}