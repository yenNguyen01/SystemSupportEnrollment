package com.topic14.pojo;

import com.topic14.pojo.Answer;
import com.topic14.pojo.Notification;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-05-04T10:23:52")
@StaticMetamodel(Question.class)
public class Question_ { 

    public static volatile SingularAttribute<Question, String> answer;
    public static volatile SetAttribute<Question, Answer> answerSet;
    public static volatile SingularAttribute<Question, Notification> notiId;
    public static volatile SingularAttribute<Question, Integer> id;
    public static volatile SingularAttribute<Question, User> userId;
    public static volatile SingularAttribute<Question, String> content;
    public static volatile SingularAttribute<Question, Boolean> isAnswer;
    public static volatile SingularAttribute<Question, Date> createDate;

}