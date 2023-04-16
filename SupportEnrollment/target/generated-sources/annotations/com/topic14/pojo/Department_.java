package com.topic14.pojo;

import com.topic14.pojo.Majors;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-04-16T11:10:46")
@StaticMetamodel(Department.class)
public class Department_ { 

    public static volatile SingularAttribute<Department, String> website;
    public static volatile SingularAttribute<Department, Date> modifyDate;
    public static volatile SingularAttribute<Department, String> embedVideo;
    public static volatile SetAttribute<Department, Majors> majorsSet;
    public static volatile SingularAttribute<Department, String> name;
    public static volatile SingularAttribute<Department, String> description;
    public static volatile SingularAttribute<Department, Integer> id;
    public static volatile SingularAttribute<Department, Date> createDate;

}