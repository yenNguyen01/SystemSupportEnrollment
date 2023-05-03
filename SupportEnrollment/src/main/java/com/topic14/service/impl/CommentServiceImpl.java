/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Comment;
import com.topic14.repository.CommentRepository;
import com.topic14.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepo;
    @Override
    public List<Comment> getComments(int postId) {
        return this.commentRepo.getComments(postId);
    }

    @Override
    public boolean addComment(Comment c) {
        return this.commentRepo.addComment(c);
    }

    @Override
    public Comment getcommentById(int id) {
        return this.commentRepo.getcommentById(id);
    }
    
}
