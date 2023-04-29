/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Score;
import com.topic14.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Computer
 */
@RestController
@RequestMapping("/api")
public class ApiScoreController {
    
    @Autowired
    private ScoreService scoreService;
    
    @PutMapping("/score/update/{scoreId}")
    @ResponseStatus(HttpStatus.OK)
    public void updateScore(@PathVariable(value = "scoreId") int id, @RequestBody Score score){
        this.scoreService.updateScore(score, id);
    }
    
    @DeleteMapping("/score/delete/{scoreId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteScore(@PathVariable(value = "scoreId") int id){
        this.scoreService.deleteScore(id);
    }
}
