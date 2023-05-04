package com.topic14.pojo;

import com.topic14.pojo.Answer;
import com.topic14.pojo.Question;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-05-04T11:51:49")
@StaticMetamodel(Notification.class)
public class Notification_ { 

    public static volatile SetAttribute<Notification, Question> questionSet;
    public static volatile SetAttribute<Notification, Answer> answerSet;
    public static volatile SingularAttribute<Notification, Boolean> isRead;
    public static volatile SingularAttribute<Notification, Date> startTime;
    public static volatile SingularAttribute<Notification, Integer> id;
    public static volatile SingularAttribute<Notification, Date> endTime;
    public static volatile SingularAttribute<Notification, String> title;
    public static volatile SingularAttribute<Notification, User> userId;
    public static volatile SingularAttribute<Notification, String> content;
    public static volatile SingularAttribute<Notification, Date> createDate;

}