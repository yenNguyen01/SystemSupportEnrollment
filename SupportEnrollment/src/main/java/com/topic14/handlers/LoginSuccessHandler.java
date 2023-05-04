/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.handlers;

import com.topic14.pojo.User;
import com.topic14.service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 *
 * @author Computer
 */
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
    
     @Autowired
    private UserService userService;
     
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication a) throws IOException, ServletException {
        User u = this.userService.getUserByUsername(a.getName());
        request.getSession().setAttribute("currentUser", u);
        
        response.sendRedirect(request.getContextPath());
    }  
}
