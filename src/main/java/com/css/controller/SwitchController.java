package com.css.controller;

import com.css.entity.DMinfo;
import com.css.entity.DeptJL;
import com.css.entity.XunGeng;
import com.css.service.DeptJLService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import com.css.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wang on 4/21 0021.
 */
@Controller
@RequestMapping("/")
public class SwitchController {

    @Resource
    private DeptJLService deptJLService;
    @Resource
    private XunGengService xunGengService;

    @Resource
    private IDianMingService dianMingService;

    @RequestMapping("/toIndex")
    public ModelAndView toIndex(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }


    @RequestMapping("/toYjInfo")
    public ModelAndView easyUI(HttpServletRequest request) {
//        ModelAndView mv = new ModelAndView("easyUI");
        ModelAndView mv = new ModelAndView("hzsj");
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        date = calendar.getTime();
        String nowTime = f.format(date);
        mv.getModel().put("time", nowTime);
        mv.getModel().put("now", f.format(new Date()));
        return mv;

    }

    @RequestMapping("/toYkxxb")
    public ModelAndView led(HttpServletRequest request) throws Exception {
//        ModelAndView mv = new ModelAndView("easyUI");
        ModelAndView mv = new ModelAndView("jkxxb");
        List zbList = deptJLService.getDeptZBAndHeadZBInfo();
        DeptJL dejl = (DeptJL) zbList.get(0);
        mv.getModel().put("zzbr", dejl.getTypeName());
        return mv;

    }


    @RequestMapping("/getFxryInfo")
    @ResponseBody
    public String getFxryInfo() {

        Map result = new HashMap();

        try {
            result = dianMingService.getDmSum();
            List list = deptJLService.getYDDeptJLCountHJ();
            DeptJL deptJL = (DeptJL) list.get(0);
            result.put("jlsd", deptJL.getRealCount());
            result.put("jlyd", deptJL.getPlanCount());
            result.put("jlwd", deptJL.getPlanCount() - deptJL.getRealCount());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return JSON.mapToJson(result);
    }

    @RequestMapping("/toJldc")
    @ResponseBody
    public ModelAndView getJldc() throws Exception {

        List deptJLList = deptJLService.getYesterdayTjData();
        Map data = new HashMap();
        List viewList = new ArrayList();
        viewList.add(deptJLList);
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"时间(点)", "民警人数", "事业单位人数", "职工人数", "外单位人数"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("警力异常数据表");
        data.put("sheets", sheets);
        return new ModelAndView(new JlExcel("jl.xls"), data);
    }


    @RequestMapping("/toDmdc")
    @ResponseBody
    public ModelAndView toDmdc() throws Exception {
//        ModelAndView mv = new ModelAndView("led");
        Map reqmap = dianMingService.getHzsj();
        Map data = new HashMap();

        List dmNumList = dianMingService.getDmNum(reqmap);

        List<DMinfo> list1 = new ArrayList<DMinfo>();

        for (int i = 0; i < dmNumList.size(); i++) {
            DMinfo dMinfo = (DMinfo) dmNumList.get(i);
            list1.add(dMinfo);
        }


        List viewList = new ArrayList();
        viewList.add(list1);
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"监区", "时间"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("点名报告表");
        data.put("sheets", sheets);

        //mv.addObject("zbz","王汉英");
        String now = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());

        return new ModelAndView(new ViewExcel(now + "dm.xls"), data);
    }

    @RequestMapping("/toXgdc")
    @ResponseBody
    public ModelAndView getXgdc() throws Exception {

        List XGtongjiList = xunGengService.getXGtongjiInfo();
        Map data = new HashMap();
        List viewList = new ArrayList();
        viewList.add(XGtongjiList);
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"地址名称", "巡更次数"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("巡更预警数据表");
        data.put("sheets", sheets);
        return new ModelAndView(new XgExcel("ycyj.xls"), data);
    }


    @RequestMapping("/toYcdc")
    @ResponseBody
    public ModelAndView getYcdc() throws Exception {
        Map reqmap = new HashMap();
        //控制时间部分
//        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
//        Date date = new Date();
//        Calendar calendar = Calendar.getInstance();
//        calendar.setTime(date);
//        calendar.add(Calendar.DAY_OF_MONTH, -1);
//        date = calendar.getTime();
//        String endTime = f.format(date);
//        System.out.print(endTime);
//        calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);
//        date = calendar.getTime();
//        String stTime = f.format(date);
//        System.out.println("提前一小时 的时间是：" + stTime);
//
//        reqmap.put("stTime", "2017-03-09 10:00:00");
//        reqmap.put("endTime", "2017-03-09 11:00:00");
        reqmap = dianMingService.getHzsj();
//        reqmap.put("stTime", stTime);
//        reqmap.put("endTime", endTime);
        List resList = dianMingService.getAllDianMingInfo(reqmap);
        List xgList = xunGengService.getWXGtongjiInfo(reqmap);
        resList.addAll(xgList);
        Map data = new HashMap();
        List viewList = new ArrayList();
        viewList.add(resList);
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"名称", "异常预警"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("异常预警数据表");
        data.put("sheets", sheets);
        return new ModelAndView(new YcExcel("异常预警.xls"), data);
    }

    @RequestMapping(value = "/toXGfenxiJosn", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String xgfenxiList() {

        Map data = new HashMap();
        List<XunGeng> xgfenxiList = new ArrayList<XunGeng>();

        try {
            xgfenxiList = xunGengService.getXGfenxiInfo();

        } catch (Exception e) {
            xgfenxiList = xgfenxiList;
        }


        Map xg = null;
        try {
            xg = xunGengService.getXgsj();
        } catch (Exception e) {
            e.printStackTrace();
        }

        data.put("xgsjd", xg.get("startHHMM") + "-" + xg.get("endHHMM"));
        data.put("dataList", xgfenxiList);
        return JSON.mapToJson(data);
    }

    @RequestMapping(value = "/getJianQuFenBu", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String getJianQuFenBu(HttpServletRequest request) {

        List list = new ArrayList();
        try {
            list = dianMingService.getDianMingInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.listToJson(list);
    }

    @RequestMapping(value = "/getDmCount", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String getDmCount(HttpServletRequest request) throws Exception {

        int i = dianMingService.getAreaNum();

        int j = dianMingService.getAreaLog();

        System.out.println(i + "----" + j);

        Map data = new HashMap();
        data.put("dmjq", j);
        data.put("wdmjq", i - j);

        return JSON.mapToJson(data);

    }

}
