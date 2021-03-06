package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import com.css.service.BigBoardService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("bigBoardService")
public class BigBoardServiceImpl implements BigBoardService {
    @Resource
    DAO dao;

    public DutyInfo getDisplayDutyInfo() {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i = null;
        try {
            i = dao.findForObject("DutyInfoMapper.queryTheLast", null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (DutyInfo)i;
    }

    public boolean updateDutyInfo(DutyInfo dutyInfo) {
        Object i;
        try {
            i = dao.save("DutyInfoMapper.updateByPrimaryKeySelective", dutyInfo);
        } catch (Exception e) {
            e.printStackTrace();
            i = 0;
        }
        return (Integer)i>0;
    }

    public boolean saveDutyInfo(JSONObject dutyInfoJSON) {
        DutyInfo dutyInfo = (DutyInfo) JSONObject.toBean(dutyInfoJSON, DutyInfo.class);
        Object i;
        try {
            i = dao.save("DutyInfoMapper.insert", dutyInfo);
        } catch (Exception e) {
            e.printStackTrace();
            i = 0;
        }
        return (Integer)i>0;
    }

    public ManageInfo getDisplayManageInfo() {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i = null;
        try {
            i = dao.findForObject("ManageInfoMapper.queryTheLast", null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (ManageInfo)i;
    }

    public boolean saveManageInfo(JSONObject manageInfoJSON) {

        ManageInfo manageInfo = (ManageInfo) JSONObject.toBean(manageInfoJSON, ManageInfo.class);
        Object i;
        try {
            i = dao.update("ManageInfoMapper.insert", manageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            i = 0;
        }
        return (Integer)i>0;
    }

}
