/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Score;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface ScoreService {
    List<Score> getListScoreByMajorId(int majorId);
    Score getScoreById(int id);
    boolean createScore(Score score);
    boolean updateScore(Score score, int id);
    boolean deleteScore(int scoreId);
    List<Score> getListScore();
    List<Score> getTop5ScoresByMajorId(int majorId);
}
