package com.springbootjsp.controller;

import com.springbootjsp.pojo.User;
import com.springbootjsp.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@RestController
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public ModelAndView login(String username,Integer role, String password, HttpSession session){
		ModelAndView mv = new ModelAndView();

		User user = userService.findBuUsername(username,role);
		if (user == null){
			mv.setViewName("index");
			mv.addObject("username",username);
			mv.addObject("role",role);
			mv.addObject("msg","该账号不存在！");
		}else{
			if (!user.getPassword().equals(password)){
				mv.setViewName("index");
				mv.addObject("username",username);
				mv.addObject("role",role);
				mv.addObject("msg","密码不正确！");
			}else{//登陆成功，记录当前用户及其角色
				session.setAttribute("user",user);
				session.setAttribute("role",role);
				mv.setViewName("loading");
			}
		}
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session){
		session.invalidate();//清空当前数据
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/loginView")
	public ModelAndView loginView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/registerView")
	public ModelAndView registerView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}

	@PostMapping("/register")
	public ModelAndView register(User user){
		ModelAndView mv = new ModelAndView();
		try{
			User userByDatabases = userService.findBuUsername(user.getUsername(),1);
			if (userByDatabases !=null){
				mv.setViewName("register");
				mv.addObject("user",user);
				mv.addObject("msg","该账号已经被注册过！");
			}else{
				user.setCode(System.currentTimeMillis()+"");
				user.setRole(1);
				userService.insert(user);
				mv.addObject("user",user);
				mv.setViewName("index");
			}
		}catch (Exception e){
			e.printStackTrace();
			mv.setViewName("register");
			mv.addObject("user",user);
			mv.addObject("msg","注册失败，请稍后重试！");
		}
		return mv;
	}
}
