package com.css.service;

import com.css.entity.AgeGroup;

import java.util.List;
import java.util.Map;

public interface StatisticService {
    /**
     * 按出生年范围查询囚犯数量，十年一档
     * @return
     * @throws Exception
     */
    List<AgeGroup> getAgeGroups() throws Exception;

    /**
     * 按刑期长短查询囚犯数量
     * @return
     * @throws Exception
     */
    List<AgeGroup> getSentenceLength() throws Exception;

    /**
     * 按民族查询囚犯数量
     * @return
     * @throws Exception
     */
    List<Map> getPCountInNation() throws Exception;

    /**
     * 按犯罪类型进行数量统计
     * @return
     * @throws Exception
     */
    List<Map> getPCountByCrimeType() throws Exception;

    /**
     * 获取各种定时更新数据的时间间隔配置信息
     * @return
     */
    Map<String, String> getIntervalConfig();
}
