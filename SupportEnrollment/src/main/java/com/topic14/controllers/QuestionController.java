/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Answer;
import com.topic14.pojo.Notification;
import com.topic14.pojo.Question;
import com.topic14.service.AnswerService;
import com.topic14.service.NotificationService;
import com.topic14.service.QuestionService;
import com.topic14.service.UserService;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private UserService userService;

    @Autowired
    private AnswerService answerService;

    private int page_size = 25;

    @GetMapping("/questions/{notiId}")
    public String getQuestions(Model model, @PathVariable(value = "notiId") int notiId) {
        //Lay Notification theo id
        Notification notiDtl = this.notificationService.getNotificationById(notiId);
        //Them cac attribute 
        model.addAttribute("questionsByNotiId", this.questionService.getQuestionsByNotiId(notiId));
        model.addAttribute("notiDtl", notiDtl);

        Question q = new Question();
        q.setNotificationId(notiId);
        model.addAttribute("question", q);
        model.addAttribute("answer", new Answer());

        boolean isQ = false;
        boolean isLs = false;

        if (notiDtl.getEndTime() != null) {
            isQ = new Date().after(notiDtl.getStartTime()) && new Date().before(notiDtl.getEndTime());
        } else {
            isLs = new Date().after(notiDtl.getCreateDate()) && new Date().before(notiDtl.getStartTime());
        }

        model.addAttribute("isQ", isQ);
        model.addAttribute("isLs", isLs);
        return "question-page";
    }

    @PostMapping("question-create")
    public String createQuestion(Model model, @ModelAttribute(value = "question") Question q,
            Principal principal) throws UnsupportedEncodingException {

        byte[] bytes = q.getContent().getBytes("ISO-8859-1");
        String noidung = new String(bytes, "UTF-8");
        q.setContent(noidung);
        q.setUserId(this.userService.getUserByUsername(principal.getName()));
        Notification noti = this.notificationService.getNotificationById(q.getNotificationId());
        q.setNotiId(noti);

        if (this.questionService.createQuestion(q)) {
            model.addAttribute("succMsg", "Thêm câu hỏi thành công.");

            return "redirect:/questions/" + q.getNotiId().getId();
        } else {
            model.addAttribute("errMsg", "Thêm câu hỏi thất bại. Vui lòng quay lại sau.");
        }
        return "question-page";
    }

    @PostMapping("/admin/answer-create")
    public String createAnswer(Model model, @ModelAttribute(value = "answer") Answer answer,
            Principal principal) throws UnsupportedEncodingException {

        answer.setUserId(this.userService.getUserByUsername(principal.getName()));
        answer.setQuestionId(this.questionService.getQuestionById(answer.getQuestId()));
        answer.setNotiId(this.notificationService.getNotificationById(answer.getNotificationId()));
        byte[] bytes = answer.getContent().getBytes("ISO-8859-1");
        String noidung = new String(bytes, "UTF-8");
        answer.setContent(noidung);

        if (this.answerService.createAnswer(answer)) {
            return "redirect:/questions/" + answer.getNotificationId();
        } else {
            model.addAttribute("errMsg", "Tạo câu trả lời thất bại");
        }
        return "question-page";
    }

    @GetMapping("/frequent-questions")
    public String questionsFrequent(Model model, @RequestParam(name = "page", required = false, defaultValue = "1") int page) {
        List<Question> listQuestions = this.questionService.getQuestions().stream()
                .filter(x -> x.getAnswerSet().toArray().length > 0).collect(Collectors.toList());

        int page_offset = (page - 1) * this.page_size;
        int total_data = listQuestions.toArray().length;
        int total_page = total_data % this.page_size == 0 ? (int) (total_data / this.page_size) : (int) (1 + (total_data / this.page_size));
        listQuestions = listQuestions.stream().skip(page_offset).limit(page_size).collect(Collectors.toList());

        model.addAttribute("page_now", page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("questions", listQuestions);
        return "frequent-question";
    }
}
