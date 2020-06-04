package com.springbootjsp.controller;

import com.alibaba.fastjson.JSON;
import com.springbootjsp.pojo.User;
import com.springbootjsp.service.UserIService;
import com.springbootjsp.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("/getMyInfo")
    public ModelAndView getMyInfo(HttpSession session){
        User user = (User) session.getAttribute("user");
        User userData = userService.find(user.getId());
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",userData);
        mv.setViewName("views/my/myInfo");
        return mv;
    }

    @RequestMapping("/updateMyInfo")
    public ModelAndView updateMyInfo(User user,HttpSession session){
        User userSession = (User) session.getAttribute("user");
        user.setId(userSession.getId());
        userService.edit(user);//编辑用户信息
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("views/my/myInfo");
        return mv;
    }

    @RequestMapping("/updatePasswordView")
    public ModelAndView updatePasswordView(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("views/my/updatePassword");
        return mv;
    }

    @RequestMapping("/updatePassword")
    public ModelAndView updatePassword(String oldPassword,String newPassword,String rePassword,HttpSession session){
        User userSession = (User) session.getAttribute("user");
        User user = userService.find(userSession.getId());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("views/my/updatePassword");
        if (!user.getPassword().equals(oldPassword)){
            mv.addObject("msg","旧密码不正确！");
            return mv;
        }
        if (!newPassword.equals(rePassword)){
            mv.addObject("msg","两次密码不一致！");
            return mv;
        }
        user.setPassword(newPassword);
        userService.edit(user);
        mv.addObject("msg","修改密码成功！");
        return mv;
    }

    @RequestMapping("/userList")
    public ModelAndView userList(){
        List<User> userList = userService.listByRole(1);
        ModelAndView mv = new ModelAndView();
        mv.addObject("userList",userList);
        mv.setViewName("views/user/userList");
        return mv;
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public String userList(Integer id){
        User user = userService.find(id);
        user.setIsDelete(1);
        userService.edit(user);
        return JSON.toJSONString(true);
    }

}
