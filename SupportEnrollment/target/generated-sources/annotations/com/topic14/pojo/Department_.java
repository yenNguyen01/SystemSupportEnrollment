package com.topic14.pojo;

import com.topic14.pojo.Majors;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-05-04T11:51:49")
@StaticMetamodel(Department.class)
public class Department_ { 

    public static volatile SingularAttribute<Department, String> image;
    public static volatile SingularAttribute<Department, String> website;
    public static volatile SingularAttribute<Department, Date> modifyDate;
    public static volatile SingularAttribute<Department, String> embedVideo;
    public static volatile SetAttribute<Department, Majors> majorsSet;
    public static volatile SingularAttribute<Department, String> name;
    public static volatile SingularAttribute<Department, String> description;
    public static volatile SingularAttribute<Department, Integer> id;
    public static volatile SingularAttribute<Department, Boolean> isActive;
    public static volatile SingularAttribute<Department, Date> createDate;

}