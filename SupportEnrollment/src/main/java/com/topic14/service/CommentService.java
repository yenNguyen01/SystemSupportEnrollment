/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Comment;
import java.util.List;

/**
 *
 * @author Computer
 */
public interface CommentService {
    List<Comment> getComments(int postId);
    boolean addComment(Comment c);
    Comment getcommentById(int id);
}
