package com.css.controller;

import com.css.entity.XunGeng;
import com.css.service.XunGengService;
import com.css.util.JSON;
import com.css.util.XgExcel;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wang on 4/21 0021.
 */
@Controller
@RequestMapping("/")
public class XunGengController {

    @Resource
    private XunGengService xunGengService;

    @RequestMapping("/toXg")

    public ModelAndView toXunGeng(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
        int hour = c.get(Calendar.HOUR_OF_DAY);
        String name = request.getParameter("name");
        if (name == null) name = "1";
        if (hour >= 20 || name.equals("2")) {
            mv.setViewName("xugeng");
            //mv= new ModelAndView("xugeng");
        } else {
            //mv= new ModelAndView("xugengRi");
            mv.setViewName("xugengRi");
        }

//        List<XunGeng> xunGengList;
//        try {
//            xunGengList = xunGengService.getXunGengInfo();
//            String jsonStrXG = JSON.listToJson(xunGengList);
//            mv.getModel().put("jsonStrXG", jsonStrXG);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return mv;
    }

    @RequestMapping("/toXGaddr")
    @ResponseBody
    public List<XunGeng> toXGaddr() {
        List<XunGeng> jsonStrXG = getXGCount();
        return jsonStrXG;
    }

    @RequestMapping("/toXgsj")
    @ResponseBody
    public String toXgsj() {
        Map data = null;
        try {
            data = xunGengService.getXgsj();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String str = data.get("startHHMM") + "," + data.get("endHHMM");
        return str;
    }

    private List<XunGeng> getXGCount() {
        List<XunGeng> xunGengList = new ArrayList<XunGeng>();
        try {
            xunGengList = xunGengService.getXunGengInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return xunGengList;
    }


//    @RequestMapping ("/toXGtime")
//    @ResponseBody
//    public  List<XunGeng> toXGtime(){
//        try {
//           xunGengService.getTimeInfo();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return  null;
//    }

    @RequestMapping("/toXGtongji")
    @ResponseBody
    public  String toXGtongji(){


        List<XunGeng> XGtongjiList= new ArrayList<XunGeng>();
        String str = "";
        try {
            XGtongjiList = xunGengService.getXGtongjiInfo();
            str =  JSON.listToJson(XGtongjiList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return  str;
    }

    @RequestMapping("/toWXGtongji")
    @ResponseBody
    private List<XunGeng> toWXGtongji() {
        List<XunGeng> WXGtongjiList = new ArrayList<XunGeng>();
        Map map = new HashMap();
        try {

            WXGtongjiList = xunGengService.getWXGtongjiInfo(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return WXGtongjiList;
    }

    @RequestMapping("/xg/getHistoryData")
    @ResponseBody
    public List<XunGeng> getHistoryData(String timeParam) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date queryTime = sdf.parse(timeParam);
        Calendar instance = Calendar.getInstance();
        instance.setTime(queryTime);
        String stTime = sdf.format(instance.getTime());
        instance.set(Calendar.HOUR_OF_DAY, instance.get(Calendar.HOUR_OF_DAY)+1);
        String endTime = sdf.format(instance.getTime());
        List<XunGeng> xgList = xunGengService.getXunGengByTime(stTime, endTime);
        return xgList;
    }

    @RequestMapping("/xg/export")
    @ResponseBody
    public ModelAndView export(String timeParam, HttpServletRequest request) throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date queryTime = sdf.parse(timeParam);
        Calendar instance = Calendar.getInstance();
        instance.setTime(queryTime);
        String stTime = sdf.format(instance.getTime());
        instance.set(Calendar.HOUR_OF_DAY, instance.get(Calendar.HOUR_OF_DAY)+1);
        String endTime = sdf.format(instance.getTime());
        List<XunGeng> xgList = xunGengService.getXunGengByTime(stTime, endTime);

        if(0==xgList.size()) {
            request.setAttribute("errorMsg", "查询结果集为空，无法导出列表。");
            return new ModelAndView("404");
        }

        Map data = new HashMap();
        List viewList = new ArrayList();
        viewList.add(xgList);// 创建多个sheet使用
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"地址名称", "是否巡更"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("巡更数据表");
        data.put("sheets", sheets);
        return new ModelAndView(new XgExcel("巡更"+stTime+"至"+endTime+".xls"), data);
    }
}
