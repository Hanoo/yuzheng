package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.AgeGroup;
import com.css.service.StatisticService;
import com.css.util.NationCodeMapping;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticServiceImpl implements StatisticService {

    @Resource
    private DAO dao;

    public List<AgeGroup> getAgeGroups() throws Exception {
        DataSourceTypeManager.set(DataSources.JGXT);
        List<AgeGroup> list = (List) dao.findForList("AgeGroup.getAgeGroups",null);
        return list;
    }

    public List<AgeGroup> getSentenceLength() throws Exception {
        DataSourceTypeManager.set(DataSources.JGXT);
        List<AgeGroup> list = (List) dao.findForList("AgeGroup.getSentenceLength",null);
        return list;
    }

    public List<Map> getPCountInNation() throws Exception {
        DataSourceTypeManager.set(DataSources.JGXT);
        List<Map> list = (List) dao.findForList("AgeGroup.getPCountInNation",null);
        List<Map> result = new ArrayList();
        int othersCount = 0;
        for(int i=0;i<list.size();i++) {
            Map nameCodeMapping = list.get(i);
            if(i<4) {// 取人数最多的4个数值
                String cnName = NationCodeMapping.getNameByCode(nameCodeMapping.get("mz").toString());
                nameCodeMapping.put("name", cnName);
                result.add(nameCodeMapping);
            } else {
                othersCount += Integer.parseInt(nameCodeMapping.get("count").toString());
            }
        }
        Map others = new HashMap();
        others.put("name", "其他");
        others.put("value", othersCount);
        result.add(others);
        return result;
    }

    public List<Map> getPCountByCrimeType() throws Exception {
        DataSourceTypeManager.set(DataSources.JGXT);
        List<Map> list = (List) dao.findForList("AgeGroup.getPCountByCrimeType",null);
        return list;
    }
}
