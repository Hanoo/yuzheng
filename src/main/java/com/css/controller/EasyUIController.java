package com.css.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yhc on 2017/6/29.
 */
@Controller
@RequestMapping("/")
public class EasyUIController {

    @RequestMapping("/toEasyUI")
    public ModelAndView easyUI(HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView("easyUI");
        ModelAndView mv = new ModelAndView("hzsj");
        return mv;

    }


}
