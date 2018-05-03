package com.css.controller;

import com.css.entity.EasyDemo;
import com.css.service.IConfigService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by wang on 6/27 0027.
 */
@Controller
@RequestMapping("/")
public class CommonController {

    @Resource
    IConfigService service;

    @RequestMapping("/common/toConfigPage")
    public ModelAndView toConfigPage(HttpServletRequest request) throws Exception {

        ModelAndView modelAndView = new ModelAndView("config/add");

        List dataList = service.getAreaList();

        modelAndView.getModel().put("select", dataList);
        
        return modelAndView;
    }
    @RequestMapping(value = "/common/savecfg", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String save(HttpServletRequest request){


        String addr =  request.getParameter("addr");
        String[] sel = request.getParameterValues("select");
        String str = "";
        for (String s:sel){
            str += s+",";
        }

        EasyDemo bean = new EasyDemo();
        bean.setAddr(addr);
        bean.setSelect(str.substring(0 ,str.length()-1));

        service.saveCfg(bean);
        return "操作成功";
    }

    @RequestMapping(value = "/common/getSelectVal", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String getSelectValue(HttpServletRequest request){

        EasyDemo bean = service.getSelVal(request.getParameter("id"));
        JSONObject json = new JSONObject();
        if (bean!=null){
            String[] str = bean.getDeptid().split(",");
            json.put("data",str);
        }else{
            json.put("data","");
        }

        return json.toString();
    }

    @RequestMapping("/entrance")
    public String  entrance (){
        return "entrance";
    }

    @RequestMapping("/404")
    public String pageNotFound(){
        return "404";
    }
}
