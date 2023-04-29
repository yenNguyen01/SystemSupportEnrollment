/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Post;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface PostService {
    List<Post> getPosts();
    List<Post> getInforSchool();
    Post getPostById(int id);
    boolean addOrUpdatePost(Post p);
}
