/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.controllers;

import com.topic14.service.StatsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Computer
 */
@Controller
@RequestMapping("/admin")
public class StatsController {

    @Autowired
    private StatsService statsService;

    @GetMapping("/stats")
    public String statsUser(Model model, @RequestParam(name = "from", required = false, defaultValue = "") String fromDateString,
            @RequestParam(name = "to", required = false, defaultValue = "") String toDateString) throws ParseException {

        Date fromDate = null;
        Date toDate=null;
        String alertString = "Số lượng người dùng ";
        if (!fromDateString.equals("")) {
            String date = fromDateString.replace("T", " ") ;
            fromDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date);
            alertString += "từ ngày " + date.substring(0, 10);
        }
        if (!toDateString.equals("")) {
            String date = toDateString.replace("T", " ") ;
            toDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date);
            alertString += " đến ngày " + date.substring(0, 10);
        }
        if (toDateString.equals("")&& fromDateString.equals("")) {
            alertString += "các năm";
        }
        alertString += " theo từng tháng";
        model.addAttribute("stats", this.statsService.statUser(fromDate, toDate));
        model.addAttribute("alert", alertString);
        return "statsUser";
    }
}
