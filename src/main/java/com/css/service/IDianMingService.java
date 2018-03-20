package com.css.service;

import java.util.List;
import java.util.Map;

/**
 * Created by yhc on 2017/4/24.
 */
public interface IDianMingService {

    //根据系统当前系统时间前一小时获取点名信息
    public List getDianMingInfo() throws Exception;


    public List getDMInfo() throws Exception;

    public Map getDmSum() throws Exception;

    public List getWdDmInfo(Map reqMap) throws Exception;

//    public List getAreaList() throws Exception;

    public int getAreaNum() throws Exception;

    public int getAreaLog() throws Exception;

//    public List getDmXxqkList(Map reqMap) throws Exception;

    //h获取指定时间的监区的点名次数
    public List getDmNum(Map reqMap) throws Exception;

    //h获取指定时间的监区的点名次数
    public List getAllDianMingInfo(Map reqMap) throws Exception;

    public Map getHzsj();


    //获取所有监区监控信息
    public List getAllJkInfo(Map reqMap) throws Exception;

    // 获取简化的预警信息
    List getAllDianMingReduceInfo(Map reqMap) throws Exception;

    /**
     * 获取各监区犯人总数的列表
     * 包含总人数和
     * @return
     * @throws Exception
     */
    List getJQPCGCount(Map reqMap) throws Exception;

    /**
     * 按监区查询押犯数量。
     * @param reqMap
     * @return
     * @throws Exception
     */
    List getPCountByArea(Map reqMap) throws Exception;

}
