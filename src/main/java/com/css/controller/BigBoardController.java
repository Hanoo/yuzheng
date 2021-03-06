package com.css.controller;

import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import com.css.entity.YuzhengUser;
import com.css.service.BigBoardService;
import com.css.util.IConstant;
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
        DutyInfo dutyInfo = bigBoardService.getDisplayDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        return "bigBoard/dutyInfoHL";
    }

    @RequestMapping("/manageInfo")
    public String manageInfo(HttpServletRequest request){
        ManageInfo manageInfo = bigBoardService.getDisplayManageInfo();
        if(null!= manageInfo) {
            request.setAttribute("manageInfo", JSONObject.fromObject(manageInfo));
        } else {
            request.setAttribute("manageInfo", "null");
        }
        return "bigBoard/manageInfoHL";
    }

    @RequestMapping(value = "/editDutyInfo", method = RequestMethod.GET)
    public String editDutyInfo(HttpServletRequest request){
        DutyInfo dutyInfo = bigBoardService.getDisplayDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        return "bigBoard/editDutyInfo";
    }

    @RequestMapping(value = "/editDutyInfo", method = RequestMethod.POST)
    @ResponseBody
    public String editDutyInfo(@RequestBody JSONObject dutyInfo){
        DataSourceTypeManager.set(DataSources.JIANYU);
        boolean result = bigBoardService.saveDutyInfo(dutyInfo);
        return String.valueOf(result);
    }

    @RequestMapping(value = "/editManageInfo", method = RequestMethod.GET)
    public String editManageInfo(HttpServletRequest request){
        YuzhengUser user = (YuzhengUser) request.getSession().getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
        if (!IConstant.ADMIN_AREA.equals(user.getPrisonArea())) {
            request.setAttribute("errorCode", "503");
            request.setAttribute("eMsg", "您没有权限访问这个页面！");
            return "innerError";
        }
        DutyInfo dutyInfo = bigBoardService.getDisplayDutyInfo();
        if(null!= dutyInfo) {
            request.setAttribute("dutyInfo", JSONObject.fromObject(dutyInfo));
        } else {
            request.setAttribute("dutyInfo", "null");
        }
        ManageInfo manageInfo = bigBoardService.getDisplayManageInfo();
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
    public String editManage(@RequestBody JSONObject manageInfo){
        DataSourceTypeManager.set(DataSources.JIANYU);
        boolean result = bigBoardService.saveManageInfo(manageInfo);
        return String.valueOf(result);
    }
}
