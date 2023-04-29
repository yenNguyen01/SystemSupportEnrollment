/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Banner;
import com.topic14.repository.BannerRepository;
import com.topic14.service.BannerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class BannerServiceImpl implements BannerService{
    @Autowired
    private BannerRepository bannerRepo;

    @Override
    public List<Banner> getBanner() {
        return this.bannerRepo.getBanner();
    }
    
    
}
