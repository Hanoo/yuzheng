package com.css.controller;

import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DMinfo;
import com.css.entity.YuzhengUser;
import com.css.service.*;
import com.css.util.IConstant;
import com.css.util.YcExcel;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/statistic")
public class StatisticController {

    @Resource
    StatisticService stService;

    @Resource
    private IDianMingService dianMingService;

    @Resource
    private XunGengService xunGengService;

    @Resource
    private YuzhengUserService yuzhengUserService;

    @Resource
    private DeptJLService jlService;


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
                logger.info("用户" + yuzhengUser.getDisplayName() + "登陆成功。");
                Map<String, String> config = stService.getIntervalConfig();
                session.setAttribute(IConstant.IntervalConfig, config);
            } else {
                json.put("msg", "failed");
                logger.info("用户" + json.getString("userName") + "登陆失败。");
            }
        } catch (Exception e) {
            json.put("msg", "error");
            logger.error("用户" + json.getString("userName") + "登陆失败。", e);
        }
        return json;
    }

    @RequestMapping("/getAgeGroups")
    @ResponseBody
    public JSONArray getAgeGroups() throws Exception {
        List list = stService.getAgeGroups();
        if(null!=list && list.size()>0) {
            return JSONArray.fromObject(list);
        } else {
            return new JSONArray();
        }
    }

    @RequestMapping("/getSentenceLength")
    @ResponseBody
    public JSONArray getSentenceLength() throws Exception {
        List list = stService.getSentenceLength();
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
    public JSONObject getWarningInfo(HttpSession session) throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List resList = dianMingService.getAllDianMingReduceInfoByPArea(reqmap, getUserPArea(session));

        if(isXGTime(reqmap)) {
            List xgList = xunGengService.getWXGtongjiReduceInfo(reqmap);
            resList.addAll(xgList);
        }
        JSONObject jsonObject = JSONObject.fromObject(reqmap);
        jsonObject.put("resList", resList);
        return jsonObject;
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
        List result = stService.getPCountInNation();

        return JSONArray.fromObject(result);
    }

    @RequestMapping("/getPCountByCrimeType")
    @ResponseBody
    public JSONArray getPCountByCrimeType() throws Exception {
        List result = stService.getPCountByCrimeType();

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

    @RequestMapping("/deptJingLi")
    public String deptJingLi() {
        return "statistic/deptJingLi";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        return "login";
    }

    @RequestMapping("/doResetPasswd")
    @ResponseBody
    public JSONObject doResetPasswd(HttpSession session, @RequestBody JSONObject data) throws Exception {
        String oldPasswd = data.getString("oldPasswd");
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        if(user.getUserPassword().equals(oldPasswd)) {
            String newPasswd = data.getString("newPasswd");
            if(StringUtils.isNullOrEmpty(newPasswd)) {
                data.put("msg", "error");
            } else {
                DataSourceTypeManager.set(DataSources.JIANYU);
                int result = yuzhengUserService.updateUserPassword(user.getUserName(), oldPasswd, newPasswd);
                if(-2 == result) {
                    data.put("msg", "wrong");
                } else if(1>result) {
                    data.put("msg", "error");
                } else {
                    data.put("msg", "success");
                    logger.info("用户修改密码成功：" + user.getDisplayName());
                    return data;
                }
            }
        } else {
            data.put("msg", "wrong");
        }
        logger.info("用户修改密码失败" + user.getDisplayName());
        return data;
    }

    @RequestMapping(value = "eliminateDM", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject eliminateDM(HttpSession session, @RequestBody JSONObject data ) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);

        Map logInfo = (Map) JSONObject.toBean(data, Map.class);
        logInfo.put("aid", user.getPrisonArea());
        logInfo.put("jkczy", user.getDisplayName());
        int result = 0;
        try {
            DataSourceTypeManager.set(DataSources.ZKESERVER);
            result = dianMingService.insertManualDianMingInfo(logInfo);
        } catch (Exception e) {
            logger.error("点名消除预警失败！", e);
        }
        if(result>0) {
            logger.info("点名预警消除成功，操作人：" + user.getDisplayName());
            data.put("msg", "success");
        } else {
            logger.error("点名预警消除失败，操作人：" + user.getDisplayName());
            data.put("msg", "error");
        }
        return data;
    }

    @RequestMapping(value = "eliminateXG", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject eliminateXG(HttpSession session, @RequestBody JSONObject data ) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);

        Map xgInfo = (Map) JSONObject.toBean(data, Map.class);

        String OpeName = data.getString("OpeName");
        if(StringUtils.isNullOrEmpty(OpeName)) {
            xgInfo.put("OpeName", user.getDisplayName());
        }
        xgInfo.put("UserID", user.getPrisonArea());

        int result = 0;
        try {
            DataSourceTypeManager.set(DataSources.EYFINGER);
            result = xunGengService.insertManualXGInfo(xgInfo);
        } catch (Exception e) {
            logger.error("巡更异常失败！", e);
        }
        if(result>0) {
            logger.info("巡更异常处理成功，操作人：" + user.getDisplayName());
            data.put("msg", "success");
        } else {
            logger.error("巡更异常处理失败，操作人：" + user.getDisplayName());
            data.put("msg", "error");
        }
        return data;
    }

    @RequestMapping(value = "eliminateJl", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject eliminateJl(HttpSession session, @RequestBody JSONObject data ) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);

        Map jlInfo = (Map) JSONObject.toBean(data, Map.class);

        String operator = data.getString("operator");
        if(StringUtils.isNullOrEmpty(operator)) {
            jlInfo.put("operator", user.getDisplayName());
        }

        int result = 0;
        try {
            DataSourceTypeManager.set(DataSources.IMSDB);
            result = jlService.insertManualJlInfo(jlInfo);
        } catch (Exception e) {
            logger.error("警力预警消除失败！", e);
        }
        if(result>0) {
            logger.info("警力预警消除成功，操作人：" + user.getDisplayName());
            data.put("msg", "success");
        } else {
            logger.error("警力预警消除失败，操作人：" + user.getDisplayName());
            data.put("msg", "error");
        }
        return data;
    }

    @RequestMapping("/wRecord")
    public String wRecord(){
        return "statistic/wRecord";
    }

    @RequestMapping("/wRecFrame")
    public String wRecFrame(){
        return "statistic/wRecFrame";
    }

    @RequestMapping("/getWarningRec")
    @ResponseBody
    public List wHistory() throws Exception{
        Map reqmap = dianMingService.getHzsj();
        List resList = dianMingService.getYcInfoByTime(reqmap);
//        if(isXGTime(reqmap)) {
            List xgList = xunGengService.getXGYc(reqmap);
            resList.addAll(xgList);
//        }
        return resList;
    }

    private String getUserPArea(HttpSession session) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        return user.getPrisonArea();
    }

    private Boolean isXGTime(Map timePair) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date stTime = df.parse(timePair.get("stTime").toString());
        Date endTime = df.parse(timePair.get("endTime").toString());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(stTime);
        int hourInStTime = calendar.get(Calendar.HOUR_OF_DAY);
        calendar.setTime(endTime);
        int hourInEndTime = calendar.get(Calendar.HOUR_OF_DAY);
        int beginHour = xunGengService.getXGStartTime();
        int endHour = xunGengService.getXGEndTime();
        if(hourInStTime>=beginHour && hourInEndTime<=endHour) {
            return true;
        }
        return false;
    }

    private static final Log logger = LogFactory.getLog(StatisticController.class);
}
