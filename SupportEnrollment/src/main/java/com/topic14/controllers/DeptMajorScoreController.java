/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.service.DepartmentService;
import com.topic14.service.MajorService;
import com.topic14.service.ScoreService;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Computer
 */
@Controller
public class DeptMajorScoreController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private MajorService majorService;

    @GetMapping("/department-major-score")
    public String DepartmentMajorScore(Model model) {
        model.addAttribute("departments", this.departmentService.getDepartments()
                .stream().filter(x -> x.isIsActive()==true).collect(Collectors.toList()));
        model.addAttribute("majors", this.majorService.getMajorses());
        return "user-dep-ma-sco";
    }

    @GetMapping("/department-major-score/{depId}")
    public String MajorScore(Model model, @PathVariable(value = "depId") int id,
            @RequestParam(name = "majorId", required = false) String majorId) {

        model.addAttribute("department", this.departmentService.getDepartmentById(id));
        model.addAttribute("majors", this.majorService.getMajorsesByDepartmentId(id));
        model.addAttribute("count_majors", this.majorService.getMajorsesByDepartmentId(id).toArray().length);

        if (majorId != null) {
            model.addAttribute("name_major", this.majorService.getMajorsById(Integer.parseInt(majorId)).getName());
            model.addAttribute("scores", this.scoreService.getTop5ScoresByMajorId(Integer.parseInt(majorId)));
        }

        return "user-major-score";
    }
}
