package com.css.controller;

import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DMinfo;
import com.css.entity.YuzhengUser;
import com.css.service.StatisticService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import com.css.service.YuzhengUserService;
import com.css.util.IConstant;
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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
        List xgList = xunGengService.getWXGtongjiReduceInfo(reqmap);
        resList.addAll(xgList);
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

    @RequestMapping(value = "eliminateWarning", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject eliminateWarning(HttpSession session, @RequestBody JSONObject data ) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);

        Map logInfo = (Map) JSONObject.toBean(data, Map.class);
        logInfo.put("aid", user.getPrisonArea());
        logInfo.put("jkczy", user.getDisplayName());
        int result = 0;
        try {
            DataSourceTypeManager.set(DataSources.ZKESERVER);
            result = dianMingService.insertManualDianMingInfo(logInfo);
        } catch (Exception e) {
            logger.error("消除预警失败！", e);
        }
        if(result>0) {
            logger.info("预警消除成功，操作人：" + user.getDisplayName());
            data.put("msg", "success");
        } else {
            logger.error("预警消除失败，操作人：" + user.getDisplayName());
            data.put("msg", "error");
        }
        return data;
    }

    private String getUserPArea(HttpSession session) {
        YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        return user.getPrisonArea();
    }

    private static final Log logger = LogFactory.getLog(StatisticController.class);
}
