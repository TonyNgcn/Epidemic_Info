package com.tonyng.epidemic.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    public static Logger logger=Logger.getLogger(UserController.class);


    @RequestMapping("/login")
    public String login(){
        logger.debug("loggin()方法被执行了");
        return "main";
    }
}
