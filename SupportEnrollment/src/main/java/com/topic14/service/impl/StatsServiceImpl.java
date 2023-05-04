/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.repository.StatsRepository;
import com.topic14.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class StatsServiceImpl implements StatsService{
    
    @Autowired
    private StatsRepository statsRepository;

    @Override
    public List<Object[]> statUser(Date fromDate, Date toDate) {
        List<Object[]> reList = this.statsRepository.statUser(fromDate, toDate);
        return this.statsRepository.statUser(fromDate, toDate);
    }
}
