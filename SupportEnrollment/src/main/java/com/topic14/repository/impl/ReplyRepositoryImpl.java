/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Reply;
import com.topic14.repository.ReplyRepository;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class ReplyRepositoryImpl implements ReplyRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Reply> getReplys(int postId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Reply Where postId.id=:postId");
//                Query q = s.createQuery("From Reply Where postId.id=:postId and parentId.id=:cmtId");
        q.setParameter("postId", postId);
//        q.setParameter("cmtId", cmtId);
        return q.getResultList();
    }

    @Override
    public boolean addReply(Reply r) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            r.setCreatedDate(new Date());
            s.save(r);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    
}
