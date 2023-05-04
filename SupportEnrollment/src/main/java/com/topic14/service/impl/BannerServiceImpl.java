/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.topic14.pojo.Banner;
import com.topic14.repository.BannerRepository;
import com.topic14.service.BannerService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class BannerServiceImpl implements BannerService{
   
    @Autowired
    private BannerRepository bannerRepo;
    
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Banner> getBanner() {
        return this.bannerRepo.getBanner();
    }

    @Override
    public Banner getBannerById(int id) {
        return this.bannerRepo.getBannerById(id);
    }

    @Override
    public boolean addNewBanner(Banner b) {
        if (!b.getFile().isEmpty()) {
            try {
                Map rs = this.cloudinary.uploader().upload(b.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                b.setUrl(rs.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.bannerRepo.addNewBanner(b);
    }

    @Override
    public boolean UpdateBanner(Banner b) {
        return this.bannerRepo.UpdateBanner(b);
    }

    @Override
    public boolean deleteBanner(int id) {
        return this.bannerRepo.deleteBanner(id);
    }
}
