package com.css.controller;

import com.css.service.StatisticService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    public JSONArray getWarningInfo() throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List resList = dianMingService.getAllDianMingReduceInfo(reqmap);
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
}
