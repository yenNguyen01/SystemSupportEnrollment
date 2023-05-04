/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.topic14.pojo.Post;
import com.topic14.repository.PostRepository;
import com.topic14.service.PostService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    public List<Post> getPosts(Map<String, String> params) {
        return this.postRepository.getPosts(params);
    }

    @Override
    public Post getPostById(int id) {
        return this.postRepository.getPostById(id);
    }

    @Override
    public boolean addNewPost(Post p) {
        if (!p.getFile().isEmpty()) {
            try {
                Map rs = this.cloudinary.uploader().upload(p.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                p.setImage(rs.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
               p.setImage("https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-unnamed.png"); 
            }
        return this.postRepository.addNewPost(p);
    }

    @Override
    public List<Post> getInforSchool() {
        return this.postRepository.getInforSchool();
    }

    @Override
    public boolean deletePost(int id) {
        return this.postRepository.deletePost(id);
    }

    @Override
    public boolean UpdatePost(Post post) {
            if (!post.getFile().isEmpty()) {
            try {
                Map rs = this.cloudinary.uploader().upload(post.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                post.setImage(rs.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
            
        return this.postRepository.UpdatePost(post);
                
    }

    @Override
    public List<Post> getPostsByCategory(int cateId) {
        return this.postRepository.getPostsByCategory(cateId);
    }
}
