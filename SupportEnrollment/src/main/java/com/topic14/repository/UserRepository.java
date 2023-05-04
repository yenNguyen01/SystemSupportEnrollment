/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.repository;

import com.topic14.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Computer
 */
public interface UserRepository {
    boolean registerUser(User user);
    User getUserByUsername(String username);
    List<User> getUsers(Map<String, String> params);
    boolean UpdateUser(User p);
}
