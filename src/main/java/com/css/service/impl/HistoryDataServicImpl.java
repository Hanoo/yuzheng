package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.Jingli;
import com.css.service.HistoryDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HistoryDataServicImpl implements HistoryDataService{

    @Resource
    private DAO dao;

    public boolean saveJingli(List<Jingli> data) throws Exception {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object result = dao.batchSave("JingliMapper.insert", data);
        return (Integer)result>0;
    }
}
