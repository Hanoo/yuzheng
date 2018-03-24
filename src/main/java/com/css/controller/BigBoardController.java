package com.css.controller;

import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import com.css.service.BigBoardService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/bigBoard")
public class BigBoardController {

    @Resource
    BigBoardService bigBoardService;

    @RequestMapping("/dutyInfo")
    public String dutyInfo(HttpServletRequest request){
        DutyInfo dutyInfo = bigBoardService.getDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        return "bigBoard/dutyInfoHL";
    }

    @RequestMapping("/manageInfo")
    public String manageInfo(HttpServletRequest request){
        ManageInfo manageInfo = bigBoardService.getManageInfo();
        if(null!= manageInfo) {
            request.setAttribute("manageInfo", JSONObject.fromObject(manageInfo));
        } else {
            request.setAttribute("manageInfo", "null");
        }
        return "bigBoard/manageInfoHL";
    }

    @RequestMapping(value = "/editDutyInfo", method = RequestMethod.GET)
    public String editDutyInfo(HttpServletRequest request){
        if(request.getSession().getAttribute("userInfo")==null) {
            return "login";
        }
        DutyInfo dutyInfo = bigBoardService.getDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        return "bigBoard/editDutyInfo";
    }

    @RequestMapping(value = "/editDutyInfo", method = RequestMethod.POST)
    @ResponseBody
    public String editDutyInfo(@RequestBody JSONObject dutyInfo, HttpSession session){
        if(session.getAttribute("userInfo")==null) {
            return "InvalidSession";
        } else {
            boolean result = bigBoardService.saveDutyInfo(dutyInfo);
            return String.valueOf(result);
        }
    }

    @RequestMapping(value = "/editManageInfo", method = RequestMethod.GET)
    public String editManageInfo(HttpServletRequest request){
        if(request.getSession().getAttribute("userInfo")==null) {
            return "login";
        }
        DutyInfo dutyInfo = bigBoardService.getDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        ManageInfo manageInfo = bigBoardService.getManageInfo();
        if(null!= manageInfo) {
            JSONObject mi = JSONObject.fromObject(manageInfo);
            mi.put("mpQuantity", mi.get("policeQuantity"));
            mi.discard("policeQuantity");
            request.setAttribute("manageInfo", mi);
        } else {
            request.setAttribute("manageInfo", "null");
        }
        return "bigBoard/editManageInfo";
    }

    @RequestMapping(value = "/editManageInfo", method = RequestMethod.POST)
    @ResponseBody
    public String editManage(@RequestBody JSONObject manageInfo, HttpSession session){
        if(session.getAttribute("userInfo")==null) {
            return "InvalidSession";
        } else {
            boolean result = bigBoardService.saveManageInfo(manageInfo);
            return String.valueOf(result);
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userInfo");
        return "login";
    }
}
