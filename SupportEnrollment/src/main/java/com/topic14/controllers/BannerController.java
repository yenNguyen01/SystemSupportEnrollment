/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Banner;
import com.topic14.service.BannerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author admin
 */
@Controller
@RequestMapping("/admin")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    
    @ModelAttribute
    public void commonAttribute(Model model) {
        model.addAttribute("banners", this.bannerService.getBanner());
    }
    
    @RequestMapping("/banners")
    public String index(Model model){
        List<Banner> listBanner = this.bannerService.getBanner();
        model.addAttribute("banners", listBanner);
        return "manageBanner";
    }  
    @GetMapping("/banners/addNew")
    public String addPost(Model model)
    {
       model.addAttribute("banner", new Banner());
       return "addNew-Banner";
    }
    @PostMapping("/banners/addNew")
    public String addPost(Model model,
            @ModelAttribute(value = "banner") Banner b) {
        if (b.getId() == null) {
            if (this.bannerService.addNewBanner(b) == true) {
                return "redirect:/admin/banners";
            } else {
                model.addAttribute("errMsg", "Something Wrong!!!");
            }
        } else {
            if (this.bannerService.UpdateBanner(b) == true) {
                return "redirect:/admin/banners";
            } else {
                model.addAttribute("errMsg", "Something Wrong!!!");
            }
        }
        return "addNew-Banner";
    }
    
    @GetMapping("/banners/{bannerId}")
    public String updatePost(Model model, @PathVariable(value = "bannerId") int id) {
        model.addAttribute("banner", this.bannerService.getBannerById(id));
        return "addNew-Banner";
    }
}
