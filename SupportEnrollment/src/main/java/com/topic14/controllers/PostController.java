/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Category;
import com.topic14.pojo.Pagination;
import com.topic14.pojo.Post;
import com.topic14.pojo.User;
import com.topic14.service.CategoryService;
import com.topic14.service.PostService;
import com.topic14.service.UserService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class PostController {
    
    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private PostService postService;
    
    
    @ModelAttribute
    public void commonAttribute(Model model) {
        List<Category> cates = this.categoryService.getCategories();
        model.addAttribute("posts", this.postService.getPosts(null));
        model.addAttribute("categories", cates);
    }

    @RequestMapping("/posts")
    public String index(Model model, @RequestParam Map<String, String> params,
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "10") int pageSize) {
         
        List<Post> listPost = this.postService.getPosts(params);
        
        Pagination<Post> pagination = new Pagination<>(pageNo, pageSize, listPost);    
        model.addAttribute("pagination", pagination);
        model.addAttribute("posts", listPost);
        return "managePost";
    }  
    
    @GetMapping("/posts/addNew")
    public String addPost(Model  model)
    {
       model.addAttribute("post", new Post());
       return "addnew-Post";
    }
    @PostMapping("/posts/addNew")
    public String addPost(Model model,
            @ModelAttribute(value = "post") @Valid Post p, BindingResult results, HttpSession session) {
        if (p.getId() == null) {
            if (results.hasErrors()){
                return "addnew-Post";
            }
            p.setUserId((User) session.getAttribute("currentUser"));
            if (this.postService.addNewPost(p) == true) {
                return "redirect:/admin/posts";
            } else {
                model.addAttribute("errMsg", "Something Wrong!!!");
            }
        } else {
            if (this.postService.UpdatePost(p) == true) {
                return "redirect:/admin/posts";
            } else {
                model.addAttribute("errMsg", "Something Wrong!!!");
            }
        }
        return "addnew-Post";
    }
    
    @GetMapping("/posts/{postId}")
    public String updatePost(Model model, @PathVariable(value = "postId") int id) {
        model.addAttribute("post", this.postService.getPostById(id));
        return "addnew-Post";
    }
}
