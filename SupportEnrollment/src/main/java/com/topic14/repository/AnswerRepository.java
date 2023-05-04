/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Answer;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface AnswerRepository {
    List<Answer> getAnswersByQuestionId(int questionId);
    Answer getAnswerById(int answerId);
    boolean createAnswer(Answer answer);
    boolean updateAnswer(Answer answer);
    boolean deleteAnswer(int answerId);
            
}
