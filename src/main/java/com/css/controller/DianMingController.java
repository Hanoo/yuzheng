package com.css.controller;

import com.css.entity.DMinfo;
import com.css.entity.DeptJL;
import com.css.entity.EmpInfo;
import com.css.service.DeptJLService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import com.css.util.JSON;

import com.css.util.ViewExcel;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.mail.MailParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wang on 4/20 0020.
 */
@Controller
@RequestMapping("/")
public class DianMingController {

    @Resource
    private IDianMingService dianMingService;
    @Resource
    private DeptJLService deptJLService;
    @Resource
    private XunGengService xunGengService;

    @RequestMapping("/toDm")
    public ModelAndView toDianMing(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("dianming");
//        List dmlist = new ArrayList();
//        List jllist = new ArrayList();
//        List jlSumList = new ArrayList();
//        String jsonStr = null;
//        Map reqMap = new HashMap();
//        try {
//            dmlist = dianMingService.getDMInfo();
////            dmlist = dianMingService.getDianMingInfo();
//            reqMap = dianMingService.getDmSum();
//            jsonStr = JSON.listToJson(dmlist);
//
//            jlSumList = deptJLService.getYDDeptJLCountHJ();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        DeptJL dl = (DeptJL) jlSumList.get(0);
//
//        mv.getModel().put("list", jsonStr);
//        mv.getModel().put("sdNum", reqMap.get("sdNum"));
//        mv.getModel().put("ydNum", reqMap.get("ydNum"));
//        mv.getModel().put("realCount", dl.getRealCount());
//        mv.getModel().put("planCount", dl.getPlanCount());
//        mv.getModel().put("perc", dl.getPerc());

        return mv;
    }


    @RequestMapping("/toDmAjax")
    @ResponseBody
    public Map toDianMingby() {
        Map resMap = new HashMap();
        List dmlist = new ArrayList();
        List jllist = new ArrayList();
        List jlSumList = new ArrayList();
        String jsonStr = null;
        Map reqMap = new HashMap();
        try {
            dmlist = dianMingService.getDMInfo();
            reqMap = dianMingService.getDmSum();
            //判断是否有数据
            if (dmlist.size() > 0) {
                jsonStr = JSON.listToJson(dmlist);
            }
            if (reqMap == null) {
                reqMap.put("sdNum", 0);
                reqMap.put("ydNum", 0);
                reqMap.put("wdNum", 0);
            }


            jlSumList = deptJLService.getYDDeptJLCountHJ();

        } catch (Exception e) {
            e.printStackTrace();
        }

        DeptJL dl = (DeptJL) jlSumList.get(0);


        //实际到的服刑人数和警力人数

        String jl = dl.getRealCount().toString();
        String fx = reqMap.get("sdNum").toString();

        double percent = Float.parseFloat(jl) / Float.parseFloat(fx);

        //获取格式化对象
        NumberFormat nt = NumberFormat.getPercentInstance();

        //设置百分数精确度2即保留两位小数
        nt.setMinimumFractionDigits(2);

        String perc = nt.format(percent);

        resMap.put("list", jsonStr);
        resMap.put("sdNum", reqMap.get("sdNum"));
        resMap.put("ydNum", reqMap.get("ydNum"));
        resMap.put("realCount", dl.getRealCount());
        resMap.put("planCount", dl.getPlanCount());
        resMap.put("perc", perc);
        return resMap;
    }


    @RequestMapping("/toWd")
    public ModelAndView toWeiDao(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("weidao");

        String xh = request.getParameter("xh");
        mv.getModel().put("data", xh);

        return mv;
    }


    @RequestMapping(value = "/toWdRy", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String toWeiDaory(HttpServletRequest request) {

        String xh = request.getParameter("xh");

        Map reqMap = new HashMap();
        reqMap.put("params", xh);
        String reqJson = "";
        try {
            //获取未到点名人员明细
            List wdDmList = dianMingService.getWdDmInfo(reqMap);
            reqJson = JSON.listToJson(wdDmList);
            System.out.print("ssssssssssssssssssssss" + wdDmList.size());
            System.out.print("JSON" + reqJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reqJson;
    }

    @RequestMapping("/toDmNum")
    @ResponseBody
    public List toDmNum() {
        Map testMap = new HashMap();
        List dmNumList = new ArrayList();
        try {
            dmNumList = dianMingService.getDmNum(testMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String a = JSON.listToJson(dmNumList);
        return dmNumList;
    }


    @RequestMapping("/toJkxx")
    @ResponseBody
    public List toJkxx() {
        Map testMap = new HashMap();
        Map resMap = new HashMap();
        List dmNumList = new ArrayList();
        try {
            dmNumList = dianMingService.getAllJkInfo(testMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        dmNumList= (List) resMap.get("jqlist");

//        String a = JSON.listToJson(dmNumList);

        return dmNumList;
    }


    @RequestMapping("/toYc")
    @ResponseBody
    public List toDmXxqk() throws Exception {
        Map reqmap = dianMingService.getHzsj();
        List resList = dianMingService.getAllDianMingInfo(reqmap);
        List xgList = xunGengService.getWXGtongjiInfo(reqmap);
        resList.addAll(xgList);
        return resList;
    }



      /*  @RequestMapping("/toDmXxqk")
    @ResponseBody
    public List toDmXxqk() {



        List resList = new ArrayList();
        try {
            List sjList = new ArrayList();
            for (int i = 0; i <= 24; i++) {
                sjList.add(i);
            }
            List mapList = new ArrayList();
            for (int j = 0; j < sjList.size(); j++) {
                Map map = new HashMap();
                if (j < 10) {
                    map.put("start" + j, "0" + j);
                    if (j + 1 < 10) {
                        map.put("end" + j, "0" + (j + 1));

                    } else {
                        map.put("end" + j, j + 1);
                    }

                } else {

                    map.put("start" + j, j);
                    map.put("end" + j, j + 1);
                }
                map.put("flag", "-");

                mapList.add(map);
            }

            Map reqMap = new HashMap();
            List areaList = dianMingService.getAreaList();
            List dmXxqkList = dianMingService.getDmXxqkList(reqMap);

            //循环所的监区,给每个监区增加时间
            for (int i = 0; i < areaList.size(); i++) {
                Map resMap = new HashMap();

                DMinfo dMinfo = (DMinfo) areaList.get(i);

                resMap.put("aname", dMinfo.getName() + "点名");
                resMap.put("sjlist", mapList);
                resList.add(resMap);

            }

            for (int i = 0; i < resList.size(); i++) {
                Map resMap = (Map) resList.get(i);
                String aname = (String) resMap.get("aname");
                for (int j = 0; j < dmXxqkList.size(); j++) {
                    DMinfo dMinfo = (DMinfo) dmXxqkList.get(j);
                    String pname = dMinfo.getName();
                    String startTime = dMinfo.getStartTime();
                    String endtime = dMinfo.getEndTime();
                    String ks = startTime.substring(0, 2);
                    String js = endtime.substring(0, 2);
                    if (pname.equals(aname)) {
                        List resSjList = (List) resMap.get("sjlist");
                        for (int t = 0; t < resSjList.size(); t++) {
                            Map sjListMap = (Map) resSjList.get(t);
                            String cs = "start" + t;
                            String sj = sjListMap.get(cs).toString();
                            if (sj.equals(ks) || sj.equals(js)) {
                                sjListMap.put("flag", "点名");
                            }
                        }
                    }

                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        String a = JSON.listToJson(resList);

        return resList;
    }



*/
}