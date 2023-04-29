/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Banner;
import com.topic14.pojo.Category;
import com.topic14.pojo.User;
import com.topic14.service.BannerService;
import com.topic14.service.CategoryService;
import com.topic14.service.PostService;
import com.topic14.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired 
    private UserService userService;
    @Autowired 
    private BannerService bannerService;
    
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private PostService postService;
    
    
    @ModelAttribute
    public void commonAttributes(Model model, HttpSession session) {
        List<Category> cates = this.categoryService.getCategories();
        List<Banner> bns = this.bannerService.getBanner();
        model.addAttribute("categories", cates);
        model.addAttribute("banners", bns);
    }
    
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("banners", this.bannerService.getBanner());
        model.addAttribute("postIndex", this.postService.getInforSchool());
        return "home";
    }

    @GetMapping("/login")
    public String loginView() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    @PostMapping(value = "/register")
    public String registerProcess(
            @ModelAttribute(name = "user") @Valid User user,
            BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "register";
        }
//        String registrationError = "";
//        if (user.getPassWord().equals(user.getCheckPassWord()) == false) {
//            registrationError = "Không khớp với mật khẩu đã nhập";
//            return "register";
//        }
        userService.registerUser(user);
        return "redirect:/login";
    }
}
