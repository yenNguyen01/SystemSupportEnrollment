/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Department;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface DepartmentRepository {
    List<Department> getDepartments();
    Department getDepartmentById(int id);
    boolean createdDepartment(Department d);
    boolean updateDepartment(Department d);
    boolean deleteDepartment(int id);
}
