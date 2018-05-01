package com.css.service;

import com.css.entity.XunGeng;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by July on 2017/4/24.
 */
public interface XunGengService {
    public List<XunGeng> getXunGengInfo() throws Exception;
    public List<XunGeng> getXGfenxiInfo() throws Exception;
    public List<XunGeng> getXGtongjiInfo() throws Exception;
    public List<XunGeng> getWXGtongjiInfo(Map map) throws Exception;
//    public List<XunGeng> getSETime() throws Exception;
    public Map getXgsj() throws Exception;


    List<XunGeng> getWXGtongjiReduceInfo(Map map) throws Exception;

    /**
     * 插入手动消除巡更异常的数据
     */
    int insertManualXGInfo(Map map) throws Exception;

    List<XunGeng> getXunGengHistory(String stTime, String endTime) throws Exception;

    /**
     * 根据时间参数查询巡更情况，每个小时的
     * @param stTime
     * @param endTime
     * @return
     * @throws Exception
     */
    List<XunGeng> getXunGengByTime(String stTime, String endTime) throws Exception;

    /**
     * 根据时间参数查询某一天的巡更纪录
     * @return
     * @throws Exception
     */
    List<XunGeng> getXunGengByDate(String date) throws Exception;

    /**
     * 根据配置文件查询每天巡更的起止时间
     * @param date
     * @return
     * @throws ParseException
     */
    Map<String, String> getSETime4ADay(String date) throws ParseException;

    /**
     * 获取配置文件中定义的每天巡更的第一个钟点
     * @return
     */
    int getXGStartTime();

    /**
     * 获取配置文件中定义的每天巡更的最后一个钟点
     * @return
     */
    int getXGEndTime();

    /**
     * 查询当前的巡更异常
     * @Param timePair 开始结束时间对
     */
    List<XunGeng> getXGYc(Map timePair) throws Exception;
}
