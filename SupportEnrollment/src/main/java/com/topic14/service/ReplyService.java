/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.service;

import com.topic14.pojo.Reply;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ReplyService {
    List<Reply> getReplys(int postId);
//        List<Reply> getReplys(int postId, int cmtId);
    boolean addReply(Reply c);
}
