/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Notification;
import com.topic14.repository.NotificationRepository;
import com.topic14.service.NotificationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class NotificationServiceImpl implements NotificationService{

    @Autowired
    private NotificationRepository notificationRepository;
    
    @Override
    public List<Notification> getListNotifications() {
        return this.notificationRepository.getListNotifications();
    }

    @Override
    public Notification getNotificationById(int id) {
        return this.notificationRepository.getNotificationById(id);
    }

    @Override
    public boolean createNotification(Notification notification) {
        return this.notificationRepository.createNotification(notification);
    }

    @Override
    public boolean updateNotification(Notification notification, int id) {
        
        Notification notification_old = this.getNotificationById(id);
        
        notification.setId(id);
        notification.setCreateDate(notification_old.getCreateDate());
        
        return this.notificationRepository.updateNotification(notification);
        
    }

    @Override
    public boolean deleteNotification(int notificationId) {
        return this.notificationRepository.deleteNotification(notificationId);
    }
    
}
