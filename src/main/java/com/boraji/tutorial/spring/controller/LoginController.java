/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.boraji.tutorial.spring.controller;

import com.boraji.tutorial.spring.model.MUserDetails;
import com.boraji.tutorial.spring.model.User;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.apache.log4j.Logger;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;

@SessionAttributes({"currentUser"})
@Controller
public class LoginController {
    
    private static final Logger log = LogManager.getLogger(LoginController.class);
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("error", "false");
        return "login";
    }
    
    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginError(Model model) {
        log.info("Login attempt failed");
        model.addAttribute("error", "true");
        return "login";
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(SessionStatus session, HttpSession ses) {
        ses.setAttribute("userId", null);
        SecurityContextHolder.getContext().setAuthentication(null);
        session.setComplete();
        return "redirect:/home";
    }
    
    @RequestMapping(value = "/postLogin", method = RequestMethod.POST)
    public String postLogin(Model model, HttpSession session) {
        log.info("postLogin()");
        // read principal out of security context and set it to session
        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();        
        validatePrinciple(authentication.getPrincipal());
        
        User loggedInUser = ((MUserDetails) authentication.getPrincipal()).getUserDetails();
        model.addAttribute("currentUser", loggedInUser.getUsername());
        session.setAttribute("userId", loggedInUser.getUsername());
        return "redirect:/home";
        
    }
    
    private void validatePrinciple(Object principal) {
        if (!(principal instanceof MUserDetails)) {
            throw new  IllegalArgumentException("Principal can not be null!");
        }
    }
}