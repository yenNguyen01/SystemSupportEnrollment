/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.User;
import com.topic14.service.UserService;
import java.util.List;
import java.util.Map;
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
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class ManageUserController {
    @Autowired
    private UserService userService;
    
     @ModelAttribute
    public void commonAttribute(Model model) {
        model.addAttribute("users", this.userService.getUsers(null));
    }
    @RequestMapping("/users")
    public String index(Model model, @RequestParam Map<String, String> params){

        List<User> listUser = this.userService.getUsers(params);
        model.addAttribute("lstUser", listUser);
        return "manageUser";
    }
    @GetMapping("/users/{userName}")
    public String updateUser(Model model, @PathVariable(value = "userName") String name) {
        model.addAttribute("user", this.userService.getUserByUsername(name));
        return "register";
    }
    
    @PostMapping("/users/{userName}")
    public String updateUser(Model model, @PathVariable(value = "userName") String name,
            @ModelAttribute(value = "user") User u) {
            if (this.userService.UpdateUser(u) == true) {
                return "redirect:/admin/users";
            } else {
                model.addAttribute("errMsg", "Something Wrong!!!");
            }
        return "redirect:/admin/users/" + name;
    }
}
