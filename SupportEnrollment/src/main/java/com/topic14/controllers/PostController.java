/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Category;
import com.topic14.pojo.Post;
import com.topic14.service.CategoryService;
import com.topic14.service.PostService;
import com.topic14.service.UserService;
import java.util.Map;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
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
        model.addAttribute("posts", this.postService.getPosts());
        model.addAttribute("categories", cates);
    }

    @GetMapping("/posts")
    public String products(Model model) {
        model.addAttribute("post", new Post());

        return "managePost";
    }
    @RequestMapping("/posts")
    public String index(Model model, @RequestParam Map<String, String> params) {
        List<Post> listPost = this.postService.getPosts();
       
        model.addAttribute("posts", listPost);
        return "managePost";
    }        
    @PostMapping("/posts")
    public String addPost(Model model,
            @ModelAttribute(value = "post") Post p) {
        if (this.postService.addOrUpdatePost(p) == true) {
            return "redirect:/admin/managePost";
        } else {
            model.addAttribute("errMsg", "Something Wrong!!!");
        }

        return "managePost";
    }

    @GetMapping("/posts/{postId}")
    public String updateProduct(Model model, @PathVariable(value = "postId") int id) {
        model.addAttribute("post", this.postService.getPostById(id));
        return "managePost";
    }

}
