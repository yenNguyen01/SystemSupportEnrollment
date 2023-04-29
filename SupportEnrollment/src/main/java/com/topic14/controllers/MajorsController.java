/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Majors;
import com.topic14.service.DepartmentService;
import com.topic14.service.MajorService;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class MajorsController {

    @Autowired
    private MajorService majorService;

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/majors")
    public String getListMajors(Model model) {
        model.addAttribute("majors", this.majorService.getMajorses());
        model.addAttribute("departments", this.departmentService.getDepartments()
                .stream().filter(x -> x.isIsActive() == true).collect(Collectors.toList()));
        return "admin-major";
    }

    @GetMapping("/major/create")
    public String createMajor(Model model) {
        model.addAttribute("departments", this.departmentService.getDepartments()
                .stream().filter(x -> x.isIsActive() == true).collect(Collectors.toList()));
        model.addAttribute("major", new Majors());
        return "create-major";
    }

    @PostMapping(path = "/major/create")
    public String createMajor(Model model, @ModelAttribute(value = "major") Majors majors) {
        if (this.majorService.createMajors(majors)) {
            return "redirect:/admin/majors";
        } else {
            model.addAttribute("errMsg", "Thêm thông tin ngành không thành công");
        }
        return "create-major";
    }

}
