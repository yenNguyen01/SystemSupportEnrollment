/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service.impl;

import com.topic14.pojo.Reply;
import com.topic14.repository.ReplyRepository;
import com.topic14.service.ReplyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ReplyServiceImpl implements  ReplyService{
    
    @Autowired
    private ReplyRepository replyRepo;
    @Override
    public List<Reply> getReplys(int postId) {
        return this.replyRepo.getReplys(postId);
    }

    @Override
    public boolean addReply(Reply c) {
        return this.replyRepo.addReply(c);
    }
    
}
