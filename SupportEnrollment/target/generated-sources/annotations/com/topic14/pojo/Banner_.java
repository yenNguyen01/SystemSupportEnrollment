package com.topic14.pojo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-16T11:10:46")
@StaticMetamodel(Banner.class)
public class Banner_ { 

    public static volatile SingularAttribute<Banner, Integer> id;
    public static volatile SingularAttribute<Banner, String> title;
    public static volatile SingularAttribute<Banner, String> url;
    public static volatile SingularAttribute<Banner, Date> createDate;

}