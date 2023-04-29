/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Majors;
import com.topic14.pojo.Score;
import com.topic14.repository.MajorRepository;
import com.topic14.repository.ScoreRepository;
import com.topic14.service.ScoreService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class ScoreServiceImpl implements ScoreService{

    @Autowired
    private ScoreRepository scoreRepository;
    
    @Autowired
    private MajorRepository majorRepository;
    
    @Override
    public List<Score> getListScoreByMajorId(int majorId) {
        return this.scoreRepository.getListScoreByMajorId(majorId);
    }

    @Override
    public Score getScoreById(int id) {
        return this.scoreRepository.getScoreById(id);
    }

    @Override
    public boolean createScore(Score score) {
        Majors m = this.majorRepository.getMajorsById(score.getMajId());
        score.setMajorId(m);
        return this.scoreRepository.createScore(score);
    }

    @Override
    public boolean updateScore(Score score, int id) {
        Score score_old=this.getScoreById(id);
        
        score.setId(id);
        Majors m = this.majorRepository.getMajorsById(score.getMajId());
        score.setMajorId(m);
        score.setCreateDate(score_old.getCreateDate());
        
        return this.scoreRepository.updateScore(score);
    }

    @Override
    public boolean deleteScore(int scoreId) {
        return this.scoreRepository.deleteScore(scoreId);
    }

    @Override
    public List<Score> getListScore() {
        return this.scoreRepository.getListScore();
    }

    @Override
    public List<Score> getTop5ScoresByMajorId(int majorId) {
        return this.scoreRepository.getTop5ScoresByMajorId(majorId);
    }
    
}
