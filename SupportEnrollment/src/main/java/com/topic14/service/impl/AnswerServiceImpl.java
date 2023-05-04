/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Answer;
import com.topic14.repository.AnswerRepository;
import com.topic14.service.AnswerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class AnswerServiceImpl implements AnswerService{
    
    @Autowired
    private AnswerRepository answerRepository;

    @Override
    public List<Answer> getAnswersByQuestionId(int questionId) {
        return this.answerRepository.getAnswersByQuestionId(questionId);
    }

    @Override
    public Answer getAnswerById(int answerId) {
        return this.answerRepository.getAnswerById(answerId);
    }

    @Override
    public boolean createAnswer(Answer answer) {
        return this.answerRepository.createAnswer(answer);
    }

    @Override
    public boolean updateAnswer(Answer answer, int answerId) {
        Answer answer_old = this.getAnswerById(answerId);
        answer.setId(answerId);
        answer.setCreatedDate(answer_old.getCreatedDate());
        return this.answerRepository.updateAnswer(answer);
    }

    @Override
    public boolean deleteAnswer(int answerId) {
        return this.answerRepository.deleteAnswer(answerId);
    }
    
}
