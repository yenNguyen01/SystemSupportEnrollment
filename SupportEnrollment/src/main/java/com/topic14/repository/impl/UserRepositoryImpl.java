/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.User;
import com.topic14.repository.UserRepository;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
              
    @Override
    public boolean registerUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            user.setPassWord(passwordEncoder.encode(user.getPassWord()));
            user.setIsActive(Boolean.TRUE);
            user.setRole("ROLE_USER");
            user.setCreateDate(new Date());
            String encodedName = new String(user.getName().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
            user.setName(encodedName);
            session.save(user);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    @Transactional
    public User getUserByUsername(String username) {
        Session s = sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);

        q.where(b.equal(root.get("userName"), username));

        Query query = s.createQuery(q);
        return (User) query.getSingleResult();
    }

    @Override
    public List<User> getUsers(Map<String, String> params) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);
        
        if (params != null) {
        List<Predicate> predicates = new ArrayList<>();
         String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("userName").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }
        
        q.where(predicates.toArray(Predicate[]::new));
        }
        q.orderBy(b.desc(root.get("id")));
        Query query = s.createQuery(q);
                
        List<User> users = query.getResultList();

        return users;
    }

    @Override
    public boolean UpdateUser(User p) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.update(p);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }
    
}
