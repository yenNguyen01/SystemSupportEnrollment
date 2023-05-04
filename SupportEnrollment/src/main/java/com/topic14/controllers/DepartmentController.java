/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Department;
import com.topic14.service.DepartmentService;
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
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class DepartmentController {
    
    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/departments")
    public String getDepartments(Model model) {
        model.addAttribute("departments", this.departmentService.getDepartments());
        return "admin-dep";
    }

    @GetMapping("/department/create")
    public String createDepartment(Model model) {
        model.addAttribute("department", new Department());
        return "create-dep";
    }

    @PostMapping("/department/create")
    public String createDepartment(Model model, @ModelAttribute(value = "department") Department d) {
        if(this.departmentService.createdDepartment(d)==true){
            return "redirect:/admin/departments";
        }
        else{
            model.addAttribute("errMsg", "Thông tin khoa thêm không thành công do lỗi hệ thống hoặc bản ghi đã tồn tại.");
        }
        return "create-dep";
    }
    @GetMapping("/update/department/{departmentId}")
    public String updateDep(Model model, @PathVariable(value = "departmentId") int id) {
        model.addAttribute("department", this.departmentService.getDepartmentById(id));
        return "create-dep";
    }
    
    @PostMapping("/update/department/{departmentId}")
    public String updateDep(Model model, @ModelAttribute(value = "department") Department d,
            @PathVariable(value = "departmentId") int id){
        
        if(!d.getName().isEmpty()){
            if(this.departmentService.updateDepartment(d, id)){
                return "redirect:/admin/departments";
            }
            else{
                model.addAttribute("errMsg", "Thông tin khoa cập nhật không thành công do lỗi hệ thống hoặc bản ghi đã tồn tại.");
            }
        }
        else{
            model.addAttribute("errMsg", "Không tồn tại thông tin khoa.");
        }
        return "create-dep";
    }
    
}
