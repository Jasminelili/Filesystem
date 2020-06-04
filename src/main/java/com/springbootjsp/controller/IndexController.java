package com.springbootjsp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class IndexController {

	@RequestMapping("/")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}

}
