package com.instagram.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.instagram.newuser;

@Controller
public class Webcontroller {
	@RequestMapping("/")  
    public String display(ModelAndView m)  
    {  
		m.addObject("newuser", new newuser());
        return "index";  
    }
	@ModelAttribute("newuser")
	public newuser createmodel()
	{
		return new newuser();
	}

}
