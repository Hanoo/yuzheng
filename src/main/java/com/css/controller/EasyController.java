package com.css.controller;

import com.css.entity.EasyDemo;
import com.css.util.JSON;
import com.css.util.ParseHtml;
import net.sf.ehcache.statistics.LiveCacheStatisticsData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wang on 6/21 0021.
 */
@Controller
@RequestMapping("/")
public class EasyController {

    @RequestMapping(value = "/toTest", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String testEasy(HttpServletRequest request) {

        //EasyDemo bean = (EasyDemo) new ParseHtml().parseRequest(request, new EasyDemo());

        //String result = bean.getName() + "-" + bean.getEmail() + "-" + bean.getSubject() + "-" + bean.getMessage();
        String param = request.getParameter("param");

        System.out.println(param);

        List<EasyDemo> listData = new ArrayList<EasyDemo>();
        for (int i = 0; i < 5; i++) {
            EasyDemo demo = new EasyDemo();
            demo.setName("张三" + i);
            demo.setEmail("zhangsan" + i + "@css.com.cn");
            demo.setLanguage("chinese" + i);
            demo.setSubject("sub" + i);
            listData.add(demo);
        }
        request.setAttribute("param","123");
        return JSON.listToJson(listData);
    }
}
