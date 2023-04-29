/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Majors;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface MajorService {
    List<Majors> getMajorses();
    Majors getMajorsById(int id);
    List<Majors> getMajorsesByDepartmentId(int departmentId);
    boolean createMajors(Majors majors);
    boolean updateMajors(Majors majors, int id);
    boolean deleteMajors(int id);
}
