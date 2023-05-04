/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Question;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface QuestionRepository {
    List<Question> getQuestions();
    List<Question> getQuestionsByNotiId(int notiId);
    Question getQuestionById(int id);
    boolean createQuestion(Question question);
    boolean updateQuestion(Question question);
    boolean deleteQuestion(int questionId);
}
