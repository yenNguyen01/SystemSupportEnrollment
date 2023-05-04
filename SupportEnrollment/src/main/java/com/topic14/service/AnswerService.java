/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Answer;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface AnswerService {
    List<Answer> getAnswersByQuestionId(int questionId);
    Answer getAnswerById(int answerId);
    boolean createAnswer(Answer answer);
    boolean updateAnswer(Answer answer, int answerId);
    boolean deleteAnswer(int answerId);
}
