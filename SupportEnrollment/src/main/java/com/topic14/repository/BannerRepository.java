/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Banner;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface BannerRepository {
    List<Banner> getBanner();
    Banner getBannerById(int id);
    boolean addNewBanner(Banner b);
    boolean UpdateBanner(Banner b);
    boolean deleteBanner(int id);
}
