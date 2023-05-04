/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.topic14.pojo.Department;
import com.topic14.repository.DepartmentRepository;
import com.topic14.service.DepartmentService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Computer
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepo;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Department> getDepartments() {
        return this.departmentRepo.getDepartments();
    }

    @Override
    public Department getDepartmentById(int id) {
        return this.departmentRepo.getDepartmentById(id);
    }

    @Override
    public boolean createdDepartment(Department d) {
        if (!d.getFile().isEmpty()) {
            try {
                java.util.Map rs = this.cloudinary.uploader().upload(d.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                d.setImage(rs.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(DepartmentServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.departmentRepo.createdDepartment(d);
    }

    @Override
    public boolean updateDepartment(Department d, int id) {
        Department d_old = this.getDepartmentById(id);
        d.setId(id);
        d.setCreateDate(d_old.getCreateDate());
        d.setImage(d_old.getImage());

        if (d_old.getName().equalsIgnoreCase(d.getName()) == false) {
            if(checkDepartmentName(d.getName())){
                return false;
            }
        }

        if (!d.getFile().isEmpty()) {
            try {
                java.util.Map rs = this.cloudinary.uploader().upload(d.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                d.setImage(rs.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(DepartmentServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.departmentRepo.updateDepartment(d);
    }

    @Override
    public boolean deleteDepartment(int id) {
        return this.departmentRepo.deleteDepartment(id);
    }

    @Override
    public boolean checkDepartmentName(String name) {
        return this.departmentRepo.checkDepartmentName(name);
    }

}
