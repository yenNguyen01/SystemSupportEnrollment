/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Answer;
import com.topic14.repository.AnswerRepository;
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
public class AnswerRepositoryImpl implements AnswerRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Answer> getAnswersByQuestionId(int questionId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Answer Where questionId.id=:questionId");
        q.setParameter("questionId", questionId);
        return q.getResultList();
    }

    @Override
    public Answer getAnswerById(int answerId) {
        Session s = this.factory.getObject().getCurrentSession();
        Answer a = s.getReference(Answer.class, answerId);
        return a;
    }

    @Override
    public boolean createAnswer(Answer answer) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.save(answer);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean updateAnswer(Answer answer) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.update(answer);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean deleteAnswer(int answerId) {
        Session s = this.factory.getObject().getCurrentSession();
        Answer a = this.getAnswerById(answerId);
        try {
            s.delete(a);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }
    
}
