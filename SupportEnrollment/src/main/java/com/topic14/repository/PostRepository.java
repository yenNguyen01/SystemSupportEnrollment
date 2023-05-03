/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.Post;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface PostRepository {
    List<Post> getPosts(Map<String, String> params);
    List<Post> getPostsByCategory(int cateId);
    List<Post> getInforSchool();
    Post getPostById(int id);
    boolean addNewPost(Post p);
    boolean UpdatePost(Post p);
    boolean deletePost(int id);
    
}
