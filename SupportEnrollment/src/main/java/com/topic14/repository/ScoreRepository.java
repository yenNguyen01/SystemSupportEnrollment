/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Score;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface ScoreRepository {
    List<Score> getListScore();
    List<Score> getListScoreByMajorId(int majorId);
    List<Score> getTop5ScoresByMajorId(int majorId);
    Score getScoreById(int id);
    boolean createScore(Score score);
    boolean updateScore(Score score);
    boolean deleteScore(int scoreId);
}
