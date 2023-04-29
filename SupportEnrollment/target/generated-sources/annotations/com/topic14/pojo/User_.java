package com.topic14.pojo;

import com.topic14.pojo.Answer;
import com.topic14.pojo.Comment;
import com.topic14.pojo.Notification;
import com.topic14.pojo.Post;
import com.topic14.pojo.Question;
import com.topic14.pojo.Reply;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-29T07:19:52")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> passWord;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SetAttribute<User, Question> questionSet;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, String> userName;
    public static volatile SingularAttribute<User, Boolean> isActive;
    public static volatile SetAttribute<User, Post> postSet;
    public static volatile SetAttribute<User, Notification> notificationSet;
    public static volatile SetAttribute<User, Comment> commentSet;
    public static volatile SetAttribute<User, Answer> answerSet;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SetAttribute<User, Reply> replySet;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, Date> createDate;

}