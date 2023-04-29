/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Department;
import com.topic14.pojo.Majors;
import com.topic14.repository.DepartmentRepository;
import com.topic14.repository.MajorRepository;
import com.topic14.service.MajorService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class MajorServiceImpl implements MajorService{

    @Autowired
    private MajorRepository majorRepository;
    
    @Autowired
    private DepartmentRepository departmentRepository;
    
    @Override
    public List<Majors> getMajorses() {
        return this.majorRepository.getMajorses();
    }

    @Override
    public Majors getMajorsById(int id) {
        return this.majorRepository.getMajorsById(id);
    }

    @Override
    public List<Majors> getMajorsesByDepartmentId(int departmentId) {
        return this.majorRepository.getMajorsesByDepartmentId(departmentId);
    }

    @Override
    public boolean createMajors(Majors majors) {
        Department department = this.departmentRepository.getDepartmentById(majors.getDepartId());
        majors.setDepartmentId(department);
        return this.majorRepository.createMajors(majors);
    }

    @Override
    public boolean updateMajors(Majors majors, int id) {
        majors.setId(id);
        Department department = this.departmentRepository.getDepartmentById(majors.getDepartId());
        majors.setDepartmentId(department);
        return this.majorRepository.updateMajors(majors);
    }

    @Override
    public boolean deleteMajors(int id) {
        return this.majorRepository.deleteMajors(id);
    }
    
}
