package com.topic14.pojo;

import com.topic14.pojo.Notification;
import com.topic14.pojo.Question;
import com.topic14.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-29T07:19:52")
@StaticMetamodel(Answer.class)
public class Answer_ { 

    public static volatile SingularAttribute<Answer, Date> createdDate;
    public static volatile SingularAttribute<Answer, Question> questionId;
    public static volatile SingularAttribute<Answer, Notification> notiId;
    public static volatile SingularAttribute<Answer, Integer> id;
    public static volatile SingularAttribute<Answer, User> userId;
    public static volatile SingularAttribute<Answer, String> content;

}