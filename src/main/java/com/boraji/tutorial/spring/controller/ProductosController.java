/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.boraji.tutorial.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author sala4
 */
@Controller
public class ProductosController {

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/productos", method = RequestMethod.GET)
    public String productos(Locale locale, Model model, HttpSession session) {
        
        Object user = session.getAttribute("userId");        
        
        if(user == null)
            return "redirect:/logout";     
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        
        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate );
        model.addAttribute("currentUser", user);

        return "productos";
    }

}