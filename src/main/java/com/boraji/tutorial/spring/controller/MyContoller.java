package com.boraji.tutorial.spring.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyContoller {

  @GetMapping("/")
  public String index(Model model, Principal principal) {
    
    if(principal == null)    
        return "redirect:/home";    
    else
    {        
        model.addAttribute("message", "You are logged in as " + principal.getName());
        return "redirect:/home";
    }                
  }
}
