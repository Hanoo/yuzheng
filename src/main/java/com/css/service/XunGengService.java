package com.css.service;

import com.css.entity.XunGeng;

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
}
