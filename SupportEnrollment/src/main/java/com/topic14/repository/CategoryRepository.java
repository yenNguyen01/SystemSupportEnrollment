/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Category;
import com.topic14.pojo.Post;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CategoryRepository {
    List<Category> getCategories();
    Category getCategoryById(int id);
    boolean addCategory(Category c);
    boolean deleteCategory(int id);
    boolean updateCategory(Category c);
}
