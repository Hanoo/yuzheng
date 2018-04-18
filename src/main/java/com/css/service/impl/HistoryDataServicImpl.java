package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DMHistory;
import com.css.entity.Jingli;
import com.css.entity.XunGeng;
import com.css.service.HistoryDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HistoryDataServicImpl implements HistoryDataService{

    @Resource
    private DAO dao;

    public boolean saveJingli(List<Jingli> data) throws Exception {
        Object result = dao.batchSave("JingliMapper.insert", data);
        return (Integer)result>0;
    }

    public boolean saveDMHistroy(List datas) throws Exception {
        boolean result = true;
        for(Object dmHistory : datas) {
            try {
                dao.save("DMHistoryMapper.insertSelective", dmHistory);
            } catch (Exception e) {
                e.printStackTrace();
                result = false;
            }
        }
        return result;
    }

    public boolean saveXGHistory(List<XunGeng> datas) throws Exception {
        Object result = dao.batchSave("XunGeng.insertXunGeng", datas);
        return (Integer)result>0;
    }
}
