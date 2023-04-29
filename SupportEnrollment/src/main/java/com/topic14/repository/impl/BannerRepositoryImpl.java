/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Banner;
import com.topic14.repository.BannerRepository;
import java.util.List;
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
public class BannerRepositoryImpl implements BannerRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Banner> getBanner() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Banner");
        return q.getResultList();
    }
    
}
