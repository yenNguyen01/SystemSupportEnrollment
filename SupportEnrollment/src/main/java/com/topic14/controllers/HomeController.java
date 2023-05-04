/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Banner;
import com.topic14.pojo.Category;
import com.topic14.pojo.Comment;
import com.topic14.pojo.Pagination;
import com.topic14.pojo.Post;
import com.topic14.pojo.Reply;
import com.topic14.pojo.User;
import com.topic14.service.BannerService;
import com.topic14.service.CategoryService;
import com.topic14.service.CommentService;
import com.topic14.service.PostService;
import com.topic14.service.ReplyService;
import com.topic14.service.UserService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
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
    
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private ReplyService replyService;
    
    
    @ModelAttribute
    public void commonAttributes(Model model, HttpSession session) {
        List<Category> cates = this.categoryService.getCategories();
        List<Banner> bns = this.bannerService.getBanner();
        cates = cates.stream().filter(category -> !"Giới thiệu".equals(category.getName())).collect(Collectors.toList());
        model.addAttribute("categories", cates);
        model.addAttribute("banners", bns);
    }
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        List<Post> listPost = this.postService.getPosts(params);
        List<Post> listNewPost = null; 
           listNewPost = listPost.stream().limit(5).collect(Collectors.toList());
        Map<Category, List<Post>> postsByCategory = listPost.stream()
                .collect(Collectors.groupingBy(Post::getCategoryId));
        List<Post> top5PostsByCategory = new ArrayList<>();
        for (List<Post> categoryProducts : postsByCategory.values()) {
            top5PostsByCategory.addAll(categoryProducts.stream()
            .limit(5)
            .collect(Collectors.toList()));
        }
        
        model.addAttribute("postCategory", top5PostsByCategory);
        model.addAttribute("newPost", listNewPost);
        model.addAttribute("banners", this.bannerService.getBanner()
            .stream().filter(x -> x.getIsActive() == true).collect(Collectors.toList()));
        model.addAttribute("postIndex", this.postService.getInforSchool());
        return "home";
    }
    //category
    @RequestMapping("/category/{categoryId}")
    public String CategoryIndex(Model model,@PathVariable(value = "categoryId") int id,
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "10") int pageSize) {
        List<Post> listPost = this.postService.getPostsByCategory(id);
        
        Pagination<Post> pagination = new Pagination<>(pageNo, pageSize, listPost);    
        model.addAttribute("pagination", pagination);
        model.addAttribute("postsByCate", listPost);
        model.addAttribute("cate", this.categoryService.getCategoryById(id));
        return "client-category";
    }
    
     @GetMapping(path = {"/posts/{postId}","/posts/{postId}/{cmtId}"} )
    public String productDetail(Model model, @PathVariable(value = "postId") int id){
        model.addAttribute("post", this.postService.getPostById(id));
        model.addAttribute("comment", new Comment());
        model.addAttribute("reply", new Reply());
        model.addAttribute("comments", this.commentService.getComments(id));
        model.addAttribute("replys", this.replyService.getReplys(id));
        return "detailPost";
    }
    
    @PostMapping("/posts/{postId}" )
    public String addComment(Model model,@Valid @ModelAttribute(value = "comment") Comment c,
            BindingResult result,
            @PathVariable(value = "postId") int id,
            HttpSession session) {
        c.setPostId(this.postService.getPostById(id));
        c.setUserId((User) session.getAttribute("currentUser"));
        if (this.commentService.addComment(c) == true) {
            return "redirect:/posts/" + id;
        } else {
            model.addAttribute("errMsg", "Something Wrong!!!");
            return "detailPost";
        }

    }
    @PostMapping("/posts/{postId}/{commentId}")
    public String addReply(Model model,@Valid @ModelAttribute(value = "reply") Reply r,
            BindingResult result,
            @PathVariable(value = "postId") int pId, @PathVariable(value = "commentId") int cmtId,
            HttpSession session) {
        r.setPostId(this.postService.getPostById(pId));
        r.setParentId(this.commentService.getcommentById(cmtId));
        r.setUserId((User) session.getAttribute("currentUser"));
        if (this.replyService.addReply(r) == true) {
            return "redirect:/posts/" + pId;
        } else {
            model.addAttribute("errMsg", "Something Wrong!!!");
            return "detailPost";
        }

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
            model.addAttribute("errMsg", "Some thing Wrong! Please check again");
            return "register";
        }
        if (user.getPassWord().equals(user.getCheckPassWord()) == false) {
             model.addAttribute("errMsg", "Repeat password không khớp với password !");
            return "register";
        }
        userService.registerUser(user);
        return "redirect:/login";
    }
}
