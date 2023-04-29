/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Post;
import com.topic14.repository.PostRepository;
import com.topic14.repository.UserRepository;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
public class PostRepositoryImpl implements PostRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Post> getPosts() {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Post> q = b.createQuery(Post.class);
        Root root = q.from(Post.class);
        q.select(root);
        List<Predicate> predicates = new ArrayList<>();
//        String cateId = params.get("categoryId");
//        if (cateId != null) {
//            Predicate p = b.lessThanOrEqualTo(root.get("categoryId"), Integer.parseInt(cateId));
//            predicates.add(p);
//        }
        q.orderBy(b.desc(root.get("categoryId")));
        Query query = s.createQuery(q);
        List<Post> posts = query.getResultList();
        
        return posts;
    }

    @Override
    public Post getPostById(int id) {
       Session s = this.factory.getObject().getCurrentSession();
        return s.get(Post.class, id);
    }

    @Override
    public boolean addOrUpdatePost(Post p) {
         Session s = this.factory.getObject().getCurrentSession();
        try {
            if (p.getId() > 0)
                s.update(p);
            else
                p.setCreateDate(new Date());
                p.setUserId(userRepository.getUserByUsername(SecurityContextHolder.getContext().getAuthentication().getName()));
                s.save(p);
            
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public List<Post> getInforSchool() {
        Session s = factory.getObject().getCurrentSession();
        String hql = "Select p FROM Post p "
                + "JOIN p.categoryId c "
                + "WHERE c.name =: ten";
        Query q = s.createQuery(hql);
        q.setParameter("ten", "Giới thiệu");
        return q.getResultList();
    }
    
}
