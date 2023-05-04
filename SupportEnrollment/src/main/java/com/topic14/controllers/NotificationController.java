/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.google.protobuf.TextFormat.ParseException;
import com.topic14.pojo.Notification;
import com.topic14.service.NotificationService;
import com.topic14.service.UserService;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Computer
 */
@Controller
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserService userService;

    private static final int page_size = 20;

    @GetMapping("/list-notifications")
    public String getListNotification(Model model, @RequestParam(name = "page",
            required = false, defaultValue = "1") int page) {

        List<Notification> noties = this.notificationService.getListNotifications();

        int offset = (page - 1) * this.page_size;
        int total_data = noties.toArray().length;
        int total_page = (total_data % this.page_size) == 0 ? (int) (total_data / this.page_size) : (int) (1 + total_data / this.page_size);
        noties = noties.stream().skip(offset).limit(page_size).collect(Collectors.toList());

        Date today = new Date();
        Date yesterday = new Date(today.getTime() - (1000 * 60 * 60 * 24));
        model.addAttribute("noties", noties);
        model.addAttribute("date", yesterday);
        model.addAttribute("total_page", total_page);
        model.addAttribute("page_now", page);

        return "noties-page";
    }

    @GetMapping("/admin/notification/create")
    public String createNotification(Model model) {
        model.addAttribute("notification", new Notification());
        return "create-noti";
    }

    @PostMapping("/admin/notification/create")
    public String createNotification(Model model, Principal principal,
            @ModelAttribute(value = "notification") Notification noti) throws ParseException, java.text.ParseException,
             UnsupportedEncodingException {

        //Set UserId
        noti.setUserId(this.userService.getUserByUsername(principal.getName()));

        //Xử lý start time
        String date_start = noti.getStartCalendar().replace("T", " ") + ":00";
        Date date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_start);
        noti.setStartTime(date1);

        //Xử lý end time
        if (noti.getEndCalendar() != null) {
            String date_end = noti.getEndCalendar().replace("T", " ") + ":00";
            Date date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_end);
            noti.setEndTime(date2);
        }

        //Xử lý endcoding title-content
        ////title
        byte[] bytes_title = noti.getTitle().getBytes("ISO-8859-1");
        String tieude = new String(bytes_title, "UTF-8");
        noti.setTitle(tieude);
        ////content
        byte[] bytes_content = noti.getContent().getBytes("ISO-8859-1");
        String noidung = new String(bytes_content, "UTF-8");
        noti.setContent(noidung);

        if (this.notificationService.createNotification(noti)) {
            return "redirect:/list-notifications";
        } else {
            model.addAttribute("errMsg", "Thêm bài viết thất bại.");
        }
        return "create-noti";
    }

    //Update Notification
    @GetMapping("/admin/notification-update/{notiId}")
    public String updateNotification(Model model, @PathVariable(value = "notiId") int id) {
        Notification noti = this.notificationService.getNotificationById(id);

        noti.setStartCalendar(noti.getStartTime().toString());
        if (noti.getEndTime() != null) {
            noti.setEndCalendar(noti.getEndTime().toString());
        }

        model.addAttribute("notification", noti);
        return "create-noti";
    }

    @PostMapping("/admin/notification-update/{notiId}")
    public String updateNotification(Model model, @PathVariable(value = "notiId") int id,
            @ModelAttribute(value = "notification") Notification noti, Principal principal)
            throws java.text.ParseException, UnsupportedEncodingException {

        //Set UserId
        noti.setUserId(this.userService.getUserByUsername(principal.getName()));

        //Xử lý start time
        String date_start = noti.getStartCalendar().replace("T", " ") + ":00";
        Date date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_start);
        noti.setStartTime(date1);

        //Xử lý end time
        if (noti.getEndCalendar() != null) {
            String date_end = noti.getEndCalendar().replace("T", " ") + ":00";
            Date date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date_end);
            noti.setEndTime(date2);
        }

        //Xử lý endcoding title-content
        ////title
        byte[] bytes_title = noti.getTitle().getBytes("ISO-8859-1");
        String tieude = new String(bytes_title, "UTF-8");
        noti.setTitle(tieude);
        ////content
        byte[] bytes_content = noti.getContent().getBytes("ISO-8859-1");
        String noidung = new String(bytes_content, "UTF-8");
        noti.setContent(noidung);

        if (this.notificationService.updateNotification(noti, id)) {
            model.addAttribute("updSuccMsg", "Sửa thông tin bài viết thành công.");
        } else {
            model.addAttribute("updErrMsg", "Sửa thông tin bài viết thất bại.");
        }
        return "create-noti";
    }

}
