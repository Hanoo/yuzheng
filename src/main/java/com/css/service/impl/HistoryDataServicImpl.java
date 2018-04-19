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
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class HistoryDataServicImpl implements HistoryDataService{

    @Resource
    private DAO dao;

    public boolean saveJingli(List<Jingli> datas) throws Exception {
        boolean result = true;
        for(Jingli jl : datas) {
            try {
                dao.save("JingliMapper.insert", jl);
            } catch (Exception e) {
                e.printStackTrace();
                result = false;
            }
        }

        return result;
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

    public boolean saveXGHistory(List<XunGeng> datas, String stTime, String endTime) throws Exception {
        boolean result = true;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for(Object xgData : datas) {
            try {
                XunGeng xunGeng = (XunGeng)xgData;
                if(null==xunGeng.getBeginTime()) {
                    xunGeng.setBeginTime(sdf.parse(stTime));
                }
                if(null==xunGeng.getEndTime()) {
                    xunGeng.setEndTime(sdf.parse(endTime));
                }
                dao.save("XunGeng.insertXunGeng", xgData);
            } catch (Exception e) {
                e.printStackTrace();
                result = false;
            }
        }
        return result;
    }
}
