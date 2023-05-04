/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Category;
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
    public List<Post> getPosts(Map<String, String> params) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Post> q = b.createQuery(Post.class);
        Root root = q.from(Post.class);
        q.select(root);
        
        if (params != null) {
        List<Predicate> predicates = new ArrayList<>();
         String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("title").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }
        String cateId = params.get("categoryId");
        if (cateId != null) {
            Predicate p = b.lessThanOrEqualTo(root.get("categoryId"), Integer.parseInt(cateId));
            predicates.add(p);
            }
        q.where(predicates.toArray(Predicate[]::new));
        }
        q.orderBy(b.desc(root.get("id")));
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
    public boolean addNewPost(Post p) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            p.setCreateDate(new Date());
            p.setIsActive(Boolean.TRUE);
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

    @Override
    public boolean deletePost(int id) {
        Post p = this.getPostById(id);
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.delete(p);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public boolean UpdatePost(Post p) {
           Session s = this.factory.getObject().getCurrentSession();
        try {
            p.setModifyDate(new Date());
            s.update(p);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public List<Post> getPostsByCategory(int cateId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Post Where categoryId.id=:cateId");
        q.setParameter("cateId", cateId);
        return q.getResultList();
    }
    
}
