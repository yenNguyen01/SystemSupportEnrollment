/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Category;
import com.topic14.repository.CategoryRepository;
import java.util.Date;
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
public class CategoryRepositoryImpl implements CategoryRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public Category getCategoryById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Category.class, id);
    }

    @Override
    public boolean addCategory(Category c) {
        Session session = factory.getObject().getCurrentSession();
        try {
            c.setCreateDate(new Date());
            session.save(c);
            return true;
        } catch (HibernateException ex) {
            return false;  
        }
                   
    }

    @Override
    public boolean deleteCategory(int id) {
        Category c = this.getCategoryById(id);
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.delete(c);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public boolean updateCategory(Category c) {
         Session session = factory.getObject().getCurrentSession();
        try {
            session.update(c);
            return true;
        } catch (HibernateException ex) {
            return false;  
        }
    }

    @Override
    public List<Category> getCategories() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Category");
        return q.getResultList();
    }
}
