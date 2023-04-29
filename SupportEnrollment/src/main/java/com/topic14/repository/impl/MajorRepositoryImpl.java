/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Majors;
import com.topic14.pojo.Score;
import com.topic14.repository.MajorRepository;
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
public class MajorRepositoryImpl implements MajorRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private ScoreRepository scoreRepository;

    @Override
    public List<Majors> getMajorses() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Majors");
        return q.getResultList();
    }

    @Override
    public Majors getMajorsById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Majors m = s.get(Majors.class, id);
        return m;
    }

    @Override
    public List<Majors> getMajorsesByDepartmentId(int departmentId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Majors> q = b.createQuery(Majors.class);
        Root root = q.from(Majors.class);
        q.select(root);
        Predicate p = b.equal(root.get("departmentId"), departmentId);
        q.where(p);

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean deleteMajors(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Majors majors = this.getMajorsById(id);

        try {
            List<Score> listScores = this.scoreRepository.getListScoreByMajorId(id);
            if (listScores != null) {
                for (Score score : listScores) {
                    boolean res = this.scoreRepository.deleteScore(score.getId());
                    if (res == false) {
                        return false;
                    }
                }
            }
            s.delete(majors);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean createMajors(Majors majors) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(majors);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean updateMajors(Majors majors) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.update(majors);
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

}
