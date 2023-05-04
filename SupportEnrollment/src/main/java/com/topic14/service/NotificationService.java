/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Notification;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface NotificationService {
    List<Notification> getListNotifications();
    Notification getNotificationById(int id);
    boolean createNotification(Notification notification);
    boolean updateNotification(Notification notification, int id);
    boolean deleteNotification(int notificationId);
}
