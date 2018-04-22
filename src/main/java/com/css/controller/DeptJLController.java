package com.css.controller;

import com.css.entity.DeptJL;
import com.css.entity.EmpInfo;
import com.css.service.DeptJLService;
import com.css.util.JSON;
import com.css.util.JingLiExcel;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by wugaofeng on 4/21 0021.
 */
@Controller
@RequestMapping("/")
public class DeptJLController {

    @Resource
    private DeptJLService deptJLService;


    @RequestMapping("/toJl")
    public ModelAndView toJingli(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("jingli");
        List<DeptJL> deptJLList;
        try {
            deptJLList = deptJLService.getYDDeptJLCount();
            String jsonStr = JSON.listToJson(deptJLList);
            mv.getModel().put("jsonStr", jsonStr);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    @RequestMapping("/toJlAbsentPage")
    public ModelAndView toJlAbsentPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("jingli/content_absent");
        String deptId = request.getParameter("deptId");

       // List<EmpInfo> empInfolist;

        try {

            //empInfolist = deptJLService.getAbsentEmpList(deptId);
            //String json = JSON.listToJson(empInfolist);
            mv.getModel().put("deptId", deptId);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return mv;
    }

    @RequestMapping("/toJlAbsentPageByDeptName")
    public ModelAndView toJlAbsentPageByDeptName(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("jingli/content_absentByDeptName");
        String deptName = request.getParameter("deptName");
        System.out.println("#########################" + deptName);
        // List<EmpInfo> empInfolist;

        try {

            //empInfolist = deptJLService.getAbsentEmpList(deptId);
            //String json = JSON.listToJson(empInfolist);
            mv.getModel().put("deptName", deptName);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return mv;
    }

    @RequestMapping("/toJlAbsent")
    @ResponseBody
    public List<EmpInfo> toJlAbsent(HttpServletRequest request) {

        String deptId = request.getParameter("deptId");
        List<EmpInfo> empInfolist = null;
        try {
            empInfolist = deptJLService.getAbsentEmpList(deptId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String json = JSON.listToJson(empInfolist);


        return empInfolist;
    }

    @RequestMapping("/toJlAbsentByDeptName")
    @ResponseBody
    public List<EmpInfo> toJlAbsentByDeptName(HttpServletRequest request) {

        String deptName = request.getParameter("deptName");
        System.out.println("###########################toJlAbsentByDeptName:"+deptName);
        List<EmpInfo> empInfolist = null;
        try {
            empInfolist = deptJLService.getAbsentEmpListByDeptName(deptName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String json = JSON.listToJson(empInfolist);


        return empInfolist;
    }

    @RequestMapping("/toJlWorkPage")
    public ModelAndView toJlWorkPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("jingli/content_work");
        String deptId = request.getParameter("deptId");

        // List<EmpInfo> empInfolist;

        try {

            //empInfolist = deptJLService.getAbsentEmpList(deptId);
            //String json = JSON.listToJson(empInfolist);
            mv.getModel().put("deptId", deptId);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return mv;
    }

    @RequestMapping("/toJlWorkPageByDeptName")
    public ModelAndView toJlWorkPageByDeptName(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("jingli/content_workByDeptName");
        String deptName = request.getParameter("deptName");

        // List<EmpInfo> empInfolist;

        try {

            //empInfolist = deptJLService.getAbsentEmpList(deptId);
            //String json = JSON.listToJson(empInfolist);
            mv.getModel().put("deptName", deptName);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return mv;
    }

    @RequestMapping("/toJlWorkByDeptName")
    @ResponseBody
    public List<EmpInfo> toJlWorkByDeptName(HttpServletRequest request) {

        String deptName = request.getParameter("deptName");
        List<EmpInfo> empInfolist = null;
        try {
            empInfolist = deptJLService.getWorkEmpListByDeptName(deptName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return empInfolist;
    }

    @RequestMapping("/toJlWork")
    @ResponseBody
    public List<EmpInfo> toJlWork(HttpServletRequest request) {

        String deptId = request.getParameter("deptId");
        List<EmpInfo> empInfolist = null;
        try {
            empInfolist = deptJLService.getWorkEmpList(deptId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String json = JSON.listToJson(empInfolist);


        return empInfolist;
    }

    @RequestMapping("/toJlEmpTypeHJ")
    @ResponseBody
    public List<DeptJL> toJlEmpTypeHJ(HttpServletRequest request) {

        //String deptId = request.getParameter("deptId");
        List<DeptJL> empTypeHJlist = null;
        try {
            empTypeHJlist = deptJLService.getEmpTypeHJList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //String json = JSON.listToJson(empInfolist);


        return empTypeHJlist;
    }


    @RequestMapping("/toJlSync")
    @ResponseBody
    public List<DeptJL> toJlSync() {
        List<DeptJL> deptJLList = getJLCount();
        return deptJLList;
    }

    @RequestMapping("/toJlSyncHJ")
    @ResponseBody
    public List<DeptJL> toJlSyncHJ() {
        List<DeptJL> deptJLList = null;
        try {
            deptJLList = deptJLService.getYDDeptJLCountHJ();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deptJLList;
    }

    /*按小时导出前一天统计数据*/
    @RequestMapping("/toJlYesterdayTj")
    @ResponseBody
    public String toJlTest() {
        List<DeptJL> deptJLList = null;
        String str = "";
        try {
            deptJLList = deptJLService.getYesterdayTjData();
            str = JSON.listToJson(deptJLList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    /*根据历史时间统计各部门当时进出情况*/
    @RequestMapping("/toGetHistoryTjDeptJl")
    @ResponseBody
    public List<DeptJL> toGetHistoryTjDeptJl() {
        List<DeptJL> deptJLList = null;
        String str = "";
        Map map = new HashMap();
        try {
            deptJLList = deptJLService.getHistoryTjDeptJl(map);
            //str = JSON.listToJson(deptJLList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deptJLList;
    }

    /*获取各监区或总值班情况*/
    @RequestMapping("/getDeptZBAndHeadZBInfo")
    @ResponseBody
    public List<DeptJL> getDeptZBAndHeadZBInfo() {

        List<DeptJL> list=null ;
        try {
            list = deptJLService.getDeptZBAndHeadZBInfo();
            //str = JSON.listToJson(deptJLList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @RequestMapping("/jl/getHistoryData")
    @ResponseBody
    public List getHistoryData(String timeParam) throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date queryTime = sdf.parse(timeParam);
        Calendar instance = Calendar.getInstance();
        instance.setTime(queryTime);
        String stTime = sdf.format(instance.getTime());
        instance.set(Calendar.HOUR_OF_DAY, instance.get(Calendar.HOUR_OF_DAY)+1);
        String endTime = sdf.format(instance.getTime());

        return deptJLService.getJLByTime(stTime, endTime);
    }

    @RequestMapping("/jl/export")
    @ResponseBody
    public ModelAndView export(String timeParam, HttpServletRequest request) throws Exception {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date queryTime = sdf.parse(timeParam);
        Calendar instance = Calendar.getInstance();
        instance.setTime(queryTime);
        String stTime = sdf.format(instance.getTime());
        instance.set(Calendar.HOUR_OF_DAY, instance.get(Calendar.HOUR_OF_DAY)+1);
        String endTime = sdf.format(instance.getTime());
        List<DeptJL> jlList = deptJLService.getJLByTime(stTime, endTime);

        if(0==jlList.size()) {
            request.setAttribute("errorMsg", "查询结果集为空，无法导出列表。");
            return new ModelAndView("404");
        }

        Map data = new HashMap();
        List viewList = new ArrayList();
        viewList.add(jlList);// 创建多个sheet使用
        data.put("viewList", viewList);

        List<String[]> cells = new ArrayList<String[]>();
        cells.add(new String[]{"部门编号", "部门名称", "应到人数", "实到人数", "出勤率"});
        data.put("title", cells);

        List<String> sheets = new ArrayList<String>();
        sheets.add("监区警力统计表");
        data.put("sheets", sheets);
        return new ModelAndView(new JingLiExcel("监区警力统计表"+stTime+"至"+endTime+".xls"), data);
    }

    private List<DeptJL> getJLCount() {

        List<DeptJL> deptJLList = new ArrayList<DeptJL>();
        try {
            deptJLList = deptJLService.getYDDeptJLCount();
            //String jsonStr = JSON.listToJson(deptJLList);
            //mv.getModel().put("jsonStr",jsonStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deptJLList;
    }
}
