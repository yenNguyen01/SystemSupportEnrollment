package com.topic14.pojo;

import com.topic14.pojo.Majors;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-16T11:10:46")
@StaticMetamodel(Score.class)
public class Score_ { 

    public static volatile SingularAttribute<Score, Integer> score;
    public static volatile SingularAttribute<Score, String> note;
    public static volatile SingularAttribute<Score, Majors> majorId;
    public static volatile SingularAttribute<Score, Integer> year;
    public static volatile SingularAttribute<Score, Integer> id;
    public static volatile SingularAttribute<Score, Date> createDate;

}