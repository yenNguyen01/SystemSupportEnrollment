/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Question;
import com.topic14.repository.QuestionRepository;
import com.topic14.service.QuestionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private JavaMailSender javaMailSenderImpl;

    @Override
    public List<Question> getQuestions() {
        return this.questionRepository.getQuestions();
    }

    @Override
    public List<Question> getQuestionsByNotiId(int notiId) {
        return this.questionRepository.getQuestionsByNotiId(notiId);
    }

    @Override
    public Question getQuestionById(int id) {
        return this.questionRepository.getQuestionById(id);
    }

    @Override
    public boolean createQuestion(Question question) {

        boolean kq = this.questionRepository.createQuestion(question);
        if (kq == true && question.getNotiId().getEndTime() != null) {
            //Send email
            String subject = "Thông báo có câu hỏi mới trên diễn đàn tuyển sinh.";
            String text = "Người dùng " + question.getUserId().getUserName() + " vừa thêm câu hỏi trong bài đăng "
                    + question.getNotiId().getContent().toUpperCase();
            sendMail("minitham1402@gmail.com", "1951052184tham@ou.edu.vn", subject, text);
        }
        return kq;
    }

    @Override
    public boolean updateQuestion(Question question, int id) {
        Question question_old = this.getQuestionById(id);

        question.setId(id);
        question.setCreateDate(question_old.getCreateDate());

        return this.questionRepository.updateQuestion(question);
    }

    @Override
    public boolean deleteQuestion(int questionId) {
        return this.questionRepository.deleteQuestion(questionId);
    }

    private void sendMail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);
        javaMailSenderImpl.send(mailMessage);
    }
}
