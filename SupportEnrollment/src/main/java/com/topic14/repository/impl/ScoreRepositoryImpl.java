/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Score;
import com.topic14.repository.ScoreRepository;
import java.util.List;
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
 * @author Computer
 */
@Repository
@Transactional
public class ScoreRepositoryImpl implements ScoreRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Score> getListScoreByMajorId(int majorId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Score> q = b.createQuery(Score.class);
        Root root = q.from(Score.class);
        q.select(root);
        Predicate p = b.equal(root.get("majorId"), majorId);
        q.where(p);

        Query query = s.createQuery(q);
        return query.getResultList();

    }

    @Override
    public boolean createScore(Score score) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(score);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean updateScore(Score score) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.update(score);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean deleteScore(int scoreId) {
        Session s = this.factory.getObject().getCurrentSession();
        Score score = this.getScoreById(scoreId);
        try {
            s.delete(score);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public Score getScoreById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Score score = s.get(Score.class, id);
        return score;
    }

    @Override
    public List<Score> getListScore() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Score Order by majorId.name, year desc");
        return q.getResultList();
    }

    @Override
    public List<Score> getTop5ScoresByMajorId(int majorId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Score Where majorId.id=:majorId Order By year desc").setMaxResults(5);
        q.setParameter("majorId", majorId);
        return q.getResultList();
    }

}
