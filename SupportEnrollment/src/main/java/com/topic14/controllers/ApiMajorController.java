/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Majors;
import com.topic14.service.MajorService;
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
public class ApiMajorController {
    
    @Autowired
    private MajorService majorService;
    
    @PutMapping("/major/update/{majorId}")
    @ResponseStatus(HttpStatus.OK)
    public void updateMajor(@PathVariable(value = "majorId") int id, @RequestBody Majors majors){
        this.majorService.updateMajors(majors, id);
    }
    
    @DeleteMapping("/major/delete/{majorId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteMajor(@PathVariable(value = "majorId") int id){
        this.majorService.deleteMajors(id);
    }
}
