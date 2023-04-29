/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.cloudinary.Cloudinary;
import com.topic14.pojo.Post;
import com.topic14.repository.PostRepository;
import com.topic14.service.PostService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class PostServiceImpl implements PostService{
     @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private PostRepository postRepository;
    @Override
    public List<Post> getPosts() {
        return this.postRepository.getPosts();
    }

    @Override
    public Post getPostById(int id) {
        return this.postRepository.getPostById(id);
    }

    @Override
    public boolean addOrUpdatePost(Post p) {
        return this.postRepository.addOrUpdatePost(p);
    }

    @Override
    public List<Post> getInforSchool() {
        return this.postRepository.getInforSchool();
    }
    
}
