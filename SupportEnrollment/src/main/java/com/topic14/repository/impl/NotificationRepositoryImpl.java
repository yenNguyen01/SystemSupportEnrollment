/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository.impl;

import com.topic14.pojo.Notification;
import com.topic14.repository.NotificationRepository;
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
public class NotificationRepositoryImpl implements NotificationRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    
    @Override
    public List<Notification> getListNotifications() {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("From Notification Order By id desc");
        return query.getResultList();
    }

    @Override
    public boolean createNotification(Notification notification) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.save(notification);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean updateNotification(Notification notification) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.update(notification);
            return true;
        }
        catch(HibernateException e){
            return false;
        }
    }

    @Override
    public boolean deleteNotification(int notificationId) {

        Session s = this.factory.getObject().getCurrentSession();
        try{
            Notification notification = this.getNotificationById(notificationId);
            s.delete(notification);
            return true;
        }
        catch(HibernateException e){
            return false;
        }        
    }

    @Override
    public Notification getNotificationById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Notification notification = s.get(Notification.class, id);
        return notification;
    }
    
}
