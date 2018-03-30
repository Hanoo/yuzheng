package com.css.controller;

import com.css.entity.YuzhengUser;
import com.css.service.StatisticService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import com.css.service.YuzhengUserService;
import com.css.util.IConstant;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/statistic")
public class StatisticController {

    @Resource
    StatisticService ageGroupsService;

    @Resource
    private IDianMingService dianMingService;

    @Resource
    private XunGengService xunGengService;

    @Resource
    private YuzhengUserService yuzhengUserService;


    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject doLogin(HttpSession session, @RequestBody JSONObject json) {

        try {
            YuzhengUser yuzhengUser = yuzhengUserService.verifyLogin(json);
            if (null!=yuzhengUser) {
                session.setAttribute(IConstant.SESSION_ATTRIBUTE_USER, yuzhengUser);
            }
        } catch (Exception e) {
            json.put("msg", "error");
        }
        return json;
    }

    @RequestMapping("/getAgeGroups")
    @ResponseBody
    public JSONArray getAgeGroups() throws Exception {
        List list = ageGroupsService.getAgeGroups();
        if(null!=list && list.size()>0) {
            return JSONArray.fromObject(list);
        } else {
            return new JSONArray();
        }
    }

    @RequestMapping("/getSentenceLength")
    @ResponseBody
    public JSONArray getSentenceLength() throws Exception {
        List list = ageGroupsService.getSentenceLength();
        if(null!=list && list.size()>0) {
            return JSONArray.fromObject(list);
        } else {
            return new JSONArray();
        }
    }

    @RequestMapping("/index")
    public String index() {
        return "statistic/index";
    }

    @RequestMapping("/getWarningInfo")
    @ResponseBody
    public JSONArray getWarningInfo(HttpSession session) throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List resList = dianMingService.getAllDianMingReduceInfoByPArea(reqmap, getUserPArea(session));
        List xgList = xunGengService.getWXGtongjiReduceInfo(reqmap);
        resList.addAll(xgList);
        return JSONArray.fromObject(resList);
    }

    @RequestMapping("/getCGInfo")
    @ResponseBody
    public JSONArray getCGInfo() throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List data = dianMingService.getJQPCGCount(reqmap);

        return JSONArray.fromObject(data);
    }

    @RequestMapping("/getPCountByArea")
    @ResponseBody
    public JSONArray getPCountByArea() throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List data = dianMingService.getPCountByArea(reqmap);

        return JSONArray.fromObject(data);
    }

    @RequestMapping("/getPCountInNation")
    @ResponseBody
    public JSONArray getPCountInNation() throws Exception {
        List result = ageGroupsService.getPCountInNation();

        return JSONArray.fromObject(result);
    }

    @RequestMapping("/getPCountByCrimeType")
    @ResponseBody
    public JSONArray getPCountByCrimeType() throws Exception {
        List result = ageGroupsService.getPCountByCrimeType();

        return JSONArray.fromObject(result);
    }

    @RequestMapping("/dianMing")
    public String dianMing() {
        return "statistic/dianMing";
    }

    @RequestMapping("/jingLi")
    public String jingLi() {
        return "statistic/jingLi";
    }

    @RequestMapping("/xunGeng")
    public String xunGeng() {
        return "statistic/xunGeng";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        return "login";
    }

    private String getUserPArea(HttpSession session) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        return user.getPrisonArea();
    }
}
