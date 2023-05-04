/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Question;
import com.topic14.repository.QuestionRepository;
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
public class QuestionRepositoryImpl implements QuestionRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Question> getQuestions() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Question");
        return q.getResultList();
    }

    @Override
    public List<Question> getQuestionsByNotiId(int notiId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Question Where notiId.id=:notiId");
        q.setParameter("notiId", notiId);
        return q.getResultList();
    }

    @Override
    public Question getQuestionById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Question question = s.getReference(Question.class, id);
        return question;
    }

    @Override
    public boolean createQuestion(Question question) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.save(question);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean updateQuestion(Question question) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.update(question);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean deleteQuestion(int questionId) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            Question question = this.getQuestionById(questionId);            
            s.delete(question);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

}
