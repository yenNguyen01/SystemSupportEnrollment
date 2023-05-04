/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.User;
import com.topic14.repository.StatsRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Query;
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
public class StatsRepositoryImpl implements StatsRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Object[]> statUser(Date fromDate, Date toDate) {
        Session s = this.factory.getObject().getCurrentSession();
        
        String query;
        Query q;
        
        if(fromDate!=null && toDate!=null){
            query = "SELECT MONTH(createDate), COUNT(id) "
                + "FROM User "
                + "WHERE createDate >=: fromDate AND createDate <=: toDate "
                + "GROUP BY MONTH(createDate) "
                + "ORDER BY MONTH(createDate) ASC";
            q = s.createQuery(query);
            q.setParameter("fromDate", fromDate);
            q.setParameter("toDate", toDate);
        }
        else if(fromDate!=null){
            query = "SELECT MONTH(createDate), COUNT(id) "
                + "FROM User "
                + "WHERE createDate >=: fromDate AND createDate <=: toDate "
                + "GROUP BY MONTH(createDate) "
                + "ORDER BY MONTH(createDate) ASC";
            q = s.createQuery(query);
            q.setParameter("fromDate", fromDate);
            q.setParameter("toDate", new Date());
        }
        else if(toDate!=null){
            query = "SELECT MONTH(createDate), COUNT(id) "
                + "FROM User "
                + "WHERE createDate <= :toDate "
                + "GROUP BY MONTH(createDate) "
                + "ORDER BY MONTH(createDate) ASC";
            q = s.createQuery(query);
            q.setParameter("toDate", toDate);
        }      
        else{
            query = "SELECT MONTH(createDate), COUNT(id) "
                + "FROM User "
                + "GROUP BY MONTH(createDate) "
                + "ORDER BY MONTH(createDate) ASC";
            q = s.createQuery(query);
        }
        
        return q.getResultList();
    }
    
}
