/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.pojo.Score;
import com.topic14.service.MajorService;
import com.topic14.service.ScoreService;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private MajorService majorService;

    private int size = 20;

    @ModelAttribute
    public void commonAttributes(Model model) {
        int year = Year.now().getValue();
        List<Integer> years = new ArrayList<>();
        for (int i = year - 6; i <= year + 20; i++) {
            years.add(i);
        }
        model.addAttribute("years", years);
        model.addAttribute("majors", this.majorService.getMajorses());
    }

    @GetMapping("/scores")
    public String getListScores(Model model, @RequestParam(name = "majorId", required = false, defaultValue = "0") int majorId,
            @RequestParam(name = "page", required = false, defaultValue = "1") int page) {

        model.addAttribute("majors", this.majorService.getMajorses());

        List<Score> scores = null;
        scores = this.scoreService.getListScore();
        if (majorId != 0) {
            scores = this.scoreService.getListScoreByMajorId(majorId);
        }

        int offset = (page - 1) * this.size;
        int total_data = scores.toArray().length;
        int total_page = total_data % this.size == 0 ? (int) (total_data / this.size) : (int) (1 + total_data / this.size);
        scores = scores.stream().skip(offset).limit(size).collect(Collectors.toList());

        model.addAttribute("scores", scores);
        model.addAttribute("total_page", total_page);
        model.addAttribute("page_now", page);
        model.addAttribute("majorid", majorId);
        return "admin-score";
    }

    @GetMapping("/score/create")
    public String createScore(Model model) {
        model.addAttribute("diem", new Score());
        return "create-scores";
    }

    @PostMapping(path = "/score/create")
    public String createScore(Model model, @ModelAttribute(value = "diem") Score score) {
        if (this.scoreService.createScore(score)) {
            model.addAttribute("succMsg", "Thêm thông tin thành công.");
        } else {
            model.addAttribute("errMsg", "Thêm thông tin thất bại");
        }
        return "create-scores";
    }
}
