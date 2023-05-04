package com.topic14.pojo;

import com.topic14.pojo.Department;
import com.topic14.pojo.Score;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2023-05-04T10:23:52")
@StaticMetamodel(Majors.class)
public class Majors_ { 

    public static volatile SingularAttribute<Majors, String> code;
    public static volatile SingularAttribute<Majors, Department> departmentId;
    public static volatile SingularAttribute<Majors, String> name;
    public static volatile SingularAttribute<Majors, Integer> id;
    public static volatile SetAttribute<Majors, Score> scoreSet;

}