/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Department;
import com.topic14.pojo.Majors;
import com.topic14.repository.DepartmentRepository;
import com.topic14.repository.MajorRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Computer
 */
@Repository
@Transactional
public class DepartmentRepositoryImpl implements DepartmentRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private MajorRepository majorRepository;

    @Override
    public List<Department> getDepartments() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From Department");
        return query.getResultList();
    }

    @Override
    public boolean createdDepartment(Department d) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(d);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public boolean updateDepartment(Department d) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.update(d);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public boolean deleteDepartment(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Department d = this.getDepartmentById(id);
        d.setIsActive(false);
        try {
            List<Majors> majors = this.majorRepository.getMajorsesByDepartmentId(id);
            if (majors != null) {
                for (Majors m : majors) {
                    m.setDepartmentId(null);
                    boolean res = this.majorRepository.updateMajors(m);
                    if (res == false) {
                        return false;
                    }
                }
            }

            s.update(d);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public Department getDepartmentById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Department d = s.get(Department.class, id);
        return d;
    }

}
