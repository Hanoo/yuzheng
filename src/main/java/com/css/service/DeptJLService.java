package com.css.service;

import com.css.entity.DeptJL;
import com.css.entity.EmpInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by wugaofeng on 4/20 0020.
 */
public interface DeptJLService {

    /*分各监区统计情况*/
    public List<DeptJL> getYDDeptJLCount() throws Exception;

    /*所有监区合计情况*/
    public List<DeptJL> getYDDeptJLCountHJ() throws Exception;

    /*获取未出勤人员列表 根据部门id*/
    public List<EmpInfo> getAbsentEmpList(String deptId) throws Exception;

    /*获取出勤人员列表*/
    public List<EmpInfo> getWorkEmpList(String deptId) throws Exception;

    /*获取各人员类型出勤统计列表*/
    public List<DeptJL> getEmpTypeHJList() throws Exception;

    /*获取未出勤人员列表 根据部门名称*/
    public List<EmpInfo> getAbsentEmpListByDeptName(String deptName) throws Exception;

    /*获取出勤人员列表 根据部门名称*/
    public List<EmpInfo> getWorkEmpListByDeptName(String deptName) throws Exception;
    /*按小时导出前一天统计数据*/
    public List<DeptJL> getYesterdayTjData() throws Exception;
    /*根据历史时间统计各部门当时进出情况*/
    public List<DeptJL> getHistoryTjDeptJl(Map map) throws Exception;
    /*获取各监区值班以及总值班情况*/
    public List<DeptJL> getDeptZBAndHeadZBInfo() throws Exception;

    /**
     * 根据时间参数查询当前警力数据
     */
    public List<DeptJL> getDeptJl(Map map) throws Exception;

    int insertManualJlInfo(Map jlInfo) throws Exception;

    List getJLByTime(String stTime, String endTime) throws Exception;
}
